
import dadi
import demo_models_kp
import argparse
import numpy


def main(snps, model, masked, method, folds, int_params, PTS):
    # Import and define data constants
    if method == "subsample":
        data = dadi.Spectrum.from_file('../data/fs/{}_subsampled.fs'.format(snps))
    elif method == "projection":
        data = dadi.Spectrum.from_file('../data/fs/{}_projected.fs'.format(snps))
    else:
        data = dadi.Spectrum.from_file('../data/fs/{}.fs'.format(snps))
    pops = "{}".format(snps)
    pop_ids = pops.split("-")

    # Mask singletons and doubletons
    if masked == "yes":
        data.mask[1, 0] = True
        data.mask[0, 1] = True
        data.mask[2, 0] = True
        data.mask[0, 2] = True
        data.mask[1, 1] = True
    else:
        print("Singletons and Doubletons are not masked")

    # Print useful information about the sfs
    print("The datafile is {}".format(snps))
    print("\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n")
    print("Data for site frequency spectrum:")
    print("Sample sizes: {}".format(data.sample_sizes))
    print("Sum of SFS: {}".format(numpy.around(data.S(), 2)))
    print("FST of SFS: {}".format(numpy.around(data.Fst(), 2)))
    print("\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n")

    # Define metadata for models
    if model == "snm":
        # standard neutral model, no divergence
        num = 1
        p_labels = "nu"
        upper = [150]
        lower = [0.001]
        model_fun = demo_models_kp.no_divergence
    elif model == "IM2M":
	# divergence with symmetrical migration and heterogeneous gene flow
        num = 6
        p_labels = "nu1, nu2, m, me, P, T"
        upper = [150, 150, 60, 30, 0.99, 20]
        lower = [0.001, 0.001, 0.001, 0.001,  0.01, 0.001]
        model_fun = demo_models_kp.IM2M
    elif model == "no_mig":
        # divergence with no migration
        num = 3
        p_labels = "nu1, nu2, T"
        upper = [150, 150, 15]
        lower = [0.001, 0.001, 0.001]
        model_fun = demo_models_kp.no_migration
    elif model == "sym_mig":
        # divergence with symmetrical migration
        num = 4
        p_labels = "nu1, nu2, m, T"
        upper = [150, 150, 10, 20]
        lower = [0.001, 0.001, 0.001, 0.001]
        model_fun = demo_models_kp.sym_migration
    elif model == "asym_mig":
        # divergence with asymmetrical migration
        num = 5
        p_labels = "nu1, nu2, m12, m21, T"
        upper = [150, 150, 10, 10, 15]
        lower = [0.001, 0.001, 0.001, 0.001, 0.001]
        model_fun = demo_models_kp.asym_migration
    elif model == "anc_sym_mig":
        num = 5
        p_labels = "nu1, nu2, m, T1, T2"
        upper = [150, 150, 10, 15, 15]
        lower = [0.001, 0.001, 0.001, 0.001, 0.001]
        model_fun = demo_models_kp.anc_sym_migration
    elif model == "sec_cont_sym_mig":
        num = 5
        p_labels = "nu1, nu2, m, T1, T2"
        upper = [150, 150, 10, 15, 15]
        lower = [0.001, 0.001, 0.001, 0.001, 0.001]
        model_fun = demo_models_kp.sec_contact_sym_migration
    else:
        print("model nickname undefined please check you are using the correct model nickname!")

    # Create log file.
    out_name = "../results/dadi_optimisation.txt"
    with open(out_name, 'a') as opt_out:
        if opt_out.tell() == 0:
            print('Creating a new file\n')
            opt_out.write(
                "Pop\tModel\tFolds\tlog-likelihood\tAIC\tchi-squared\ttheta\toptimised_params\t"
                "optimised_params_labels\n")
        else:
            print('File exists, appending\n')

    # This is our initial guess for the parameters, which is somewhat arbitrary.
    if int_params is None:
        p0 = [1] * num
    else:
        p0 = int_params
    	p1 = p0

    func_ex = dadi.Numerics.make_extrap_log_func(model_fun)

    p1 = dadi.Misc.perturb_params(p1, fold=folds, upper_bound=upper, lower_bound=lower)

    print('\nInitial parameters are {}\n'.format(numpy.around(p1, 2)))
    print('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *')
    print('* * * * * * * * * * * * * * * * * * Beginning  optimisation * * * * * * * * * * * * * * * * * *')
    print('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *')
    param_opt = dadi.Inference.optimize_log_fmin(p1, data, func_ex, PTS,
                                                 lower_bound=lower,
                                                 upper_bound=upper,
                                                 verbose=1, maxiter=1000)

    # Calculate sim model using parameters optimised (p_opt).
    sim_model = func_ex(param_opt, data.sample_sizes, PTS)

    # Calculate theta
    theta = dadi.Inference.optimal_sfs_scaling(sim_model, data)
    theta = numpy.around(theta, 2)

    # Calculate likelihood
    ll = dadi.Inference.ll_multinom(sim_model, data)
    ll = numpy.around(ll, 2)

    # Calculate AIC
    aic = (-2 * (float(ll))) + (2 * len(param_opt))

    # Calculate  Chi^2
    scaled_sim_model = sim_model * theta
    folded_sim_model = scaled_sim_model.fold()
    chi2 = numpy.sum((folded_sim_model - data) ** 2 / folded_sim_model)
    chi2 = numpy.around(chi2, 2)

    # Store results with likelihoods, theta and parameters (max. likelihood)
    results = [ll, aic, chi2, theta, param_opt]

    # Export the results to file
    with open(out_name, "a") as opt_out:
        easy_p = ",".join([str(numpy.around(x, 4)) for x in results[4]])
        opt_out.write("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}\t{8}\n".format(snps, model, folds,
                                                                        results[0], results[1], results[2],
                                                                        results[3], easy_p, p_labels))
    print('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *')
    print('* * * * * * * * * * * * * * * * * *  Finished optimisation  * * * * * * * * * * * * * * * * * *')
    print('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *')


if __name__ == '__main__':
    # Arguments
    parser = argparse.ArgumentParser(prog="dadi Optimisation", usage='[options]')
    parser.add_argument("snps")
    parser.add_argument("model")
    parser.add_argument("masked")
    parser.add_argument("method")
    parser.add_argument("folds", type=int, nargs=1)
    parser.add_argument("-p", "--int_params", nargs="+", type=float)
    # parser.add_argument("out_path")
    args = parser.parse_args()

    # Setting variables
    snps = args.snps
    model = args.model
    masked = args.masked
    method = args.method
    int_params = [args.int_params]
    folds = args.folds

    # Need to manually define!
    # Define optimisation bounds
    PTS = [60, 80, 90]

    main(snps, model, masked, method, folds, int_params, PTS)
