
        fs.mask[0, 2] = True
        fs.mask[1, 1] = True

        print("\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n")
        print("Data for masked site frequency spectrum:\n")
        print("Sample sizes: {}".format(fs.sample_sizes))
        print("Sum of SFS: {}".format(np.around(fs.S(), 2)))
        print("FST of SFS: {}".format(np.around(fs.Fst(), 2)))
        print("\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n")

        with open(stats_out_name, "a") as stats_out:
            stats_out.write("{0}\t{1}\t{2}\t{3}\n".format("{}_masked".format(snps), fs.sample_sizes,
                                                          np.around(fs.S(), 2), np.around(fs.Fst(), 2)))
    elif masked == "no":
        print("low frequency SNP masking not performed |-O-O-|")
    else:
	print("choose an appropriate option for masking - \"yes\" or \"no\"")


if __name__ == '__main__':
    # Arguments
    parser = argparse.ArgumentParser(prog="dadi fs", usage="[options]")
    parser.add_argument("snps")
    parser.add_argument("masked")
    parser.add_argument("method")
    parser.add_argument("genotypes", type=int, nargs="+")
    args: Namespace = parser.parse_args()

    # Setting variables
    snps = args.snps
    masked = args.masked
    method = args.method
    genotypes = args.genotypes

    main(snps, masked, method, genotypes)
