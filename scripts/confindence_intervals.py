
    # For comparison, we can estimate uncertainties with the Fisher Information
    # Matrix, which doesn't account for linkage in the data and thus underestimates
    # uncertainty. (Although it's a fine approach if you think your data is truly
    # unlinked.)
    # if multinom = True

    # uncert contains the estimated standard deviations of each parameter, with
    # theta as the final entry in the list.
    # uncerts_fim = dadi.Godambe.FIM_uncert(func_ex,PTS,opt,fs,multinom=True,eps=0.1)
    # print('Estimate parameter standard deviations from FIM with eps=0.1: {0}'.format(uncerts_fim))

    # eps: Fractional stepsize to use when taking finite-difference derivatives.
    #         Note that if eps*param is < 1e-6, then the step size for that parameter
    #         will simply be eps, to avoid numerical issues with small parameter
    #         perturbations.
    # uncerts_fim = dadi.Godambe.FIM_uncert(func_ex, PTS, opt, fs, multinom=True, eps=0.01)
    # print('Estimate parameter standard deviations from FIM with ep=0.01: {0}'.format(uncerts_fim))

    # uncerts_fim = dadi.Godambe.FIM_uncert(func_ex,PTS,opt,fs,multinom=True,eps=0.001)
    # print('Estimate parameter standard deviations from FIM: {0}'.format(uncerts_fim))

    # uncerts_fim = dadi.Godambe.FIM_uncert(func_ex,PTS,opt,fs,log=True,multinom=True)
    # print('Estimate Log parameter standard deviations from FIM: {0}'.format(uncerts_fim))


if __name__ == "__main__":
    # Arguments
    parser = argparse.ArgumentParser(prog="GIM uncertainity")
    parser.add_argument("snps")
    parser.add_argument("model")
    parser.add_argument("sims", type=int)
    parser.add_argument("eps", type=float)
    parser.add_argument("-o", "--opt_params", nargs="+", type=float)
    args: Namespace = parser.parse_args()

    # Setting variables
    snps = args.snps
    model = args.model
    sims = args.sims
    eps = args.eps
    opt = args.opt_params

    # Extrapolation of grid size
    PTS = [50, 60, 70]

    main(snps, model, sims, eps, opt, PTS)
