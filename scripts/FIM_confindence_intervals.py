#!/usr/anaconda3/env/dadi211/bin/python
# -*- coding: utf-8 -*-

from argparse import Namespace
from dadi import Numerics, Spectrum, Inference, Godambe
import demo_models_kp
import numpy as np
import argparse


def main(snps, model, sims, eps, opt, PTS):
    # Import spectrum
    fs_path = "../data/fs/{}_projected.fs".format(snps)  
    fs = Spectrum.from_file(fs_path)
    ns = fs.sample_sizes

    # The parameter confidence interval txt file which will be output
    out_name = "../results/{}_{}_confidence_intervals.txt".format(snps, model)

    # Mask singletons and doubletons
    fs.mask[1, 0] = True
    fs.mask[0, 1] = True
    fs.mask[2, 0] = True
    fs.mask[0, 2] = True
    fs.mask[1, 1] = True

    # Print information about the spectrum
    print("\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n")
    print("Data for site frequency spectrum:\n")
    print("Sample sizes: {}".format(fs.sample_sizes))
    print("Sum of SFS: {}".format(np.around(fs.S(), 2)))
    print("FST of SFS: {}".format(np.around(fs.Fst(), 2)))
    print("\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n")

    # Models of choice
    if model == "iso_inbred":
        model_fun = demo_models_kp.iso_inbreeding
    elif model == "mig_inbred":
        model_fun = demo_models_kp.mig_inbreeding
    elif model == "anc_mig":
        model_fun = demo_models_kp.anc_sym_mig_inbred
    elif model == "sec_cont":
        model_fun = demo_models_kp.sec_contact_sym_mig_inbred
    else:
        model_fun = False
        print("Choose a correct model")

    # Model function
    func_ex = Numerics.make_extrap_log_func(model_fun)
    sim_model = func_ex(opt, ns, PTS)
    ll_model = Inference.ll_multinom(sim_model, fs)

    # The log likelihood of the model
    print('Maximum log composite likelihood: {0}'.format(ll_model))

    # The optimal value of theta given the model
    theta = Inference.optimal_sfs_scaling(sim_model, fs)
    print('Optimal value of theta: {0}'.format(theta))

    # Import all bootstraps
    all_boot = [Spectrum.from_file('../results/bootstraps/{}_bootstrap_vcf_{}.fs'.format(snps, i))
                for i in range(0, sims)]

    uncerts_fim = Godambe.FIM_uncert(func_ex,PTS,opt,fs,multinom=True,eps=0.1)
    print('Estimate parameter standard deviations from FIM with eps=0.1: {0}'.format(uncerts_fim))
    
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
    PTS = [40, 50, 60]

    main(snps, model, sims, eps, opt, PTS)
