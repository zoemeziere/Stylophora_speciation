
        print("\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n")
        # make a file to get the likelihoods of all the nonparametric bootstraps
        with open(out_name, 'a') as stat_out:
            stat_out.write("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}\n".format(snps, model, ll, aic,
                                                                             theta, boots_subsample[i].S(), chisq, i))


if __name__ == '__main__':
    # Arguments
    parser = argparse.ArgumentParser(prog="vcf bootstraps")
    parser.add_argument("snps")
    parser.add_argument("model")
    parser.add_argument("sims", type=int)
    parser.add_argument("-g", "--genotypes", nargs="+", type=int)
    parser.add_argument("-o", "--opt_params", nargs="+", type=float)
    args: argparse.Namespace = parser.parse_args()

    # Setting variables
    snps = args.snps
    model = args.model
    sims = args.sims
    genotypes = args.genotypes
    opt = args.opt_params

    # Define optimisation bounds - use the same ones as before
    PTS = [50, 60, 70]

    main(snps, model, sims, genotypes, opt, PTS)
