fs.mask[1, 0] = True
fs.mask[0, 1] = True
fs.mask[2, 0] = True
fs.mask[0, 2] = True
fs.mask[1, 1] = True

# Models:
func_ex_simple = Numerics.make_extrap_log_func(simple_model)
sim_simple_model = func_ex_simple(opt_simple, ns, PTS)
ll_simple_model = Inference.ll_multinom(sim_simple_model, fs)

func_ex = Numerics.make_extrap_log_func(complex_model)
sim_complex_model = func_ex(opt_complex, ns, PTS)
ll_complex_model = Inference.ll_multinom(sim_complex_model, fs)

# Import all bootstraps:
all_boot = [Spectrum.from_file('../results/bootstraps/{}_bootstrap_vcf_{}.fs'.format(snps, i))
                for i in range(0, 100)]

# Ratio test:       
# Need to change nested_indices for other model comparaisons       
adj = Godambe.LRT_adjust(func_ex, PTS, all_boot, params_complex, fs, nested_indices=[4], 
                multinom=True)
D_adj = adj*2*(ll_complex_model - ll_simple_model)

print('Adjusted D statistic: {0:.4f}'.format(D_adj))

# Point percent function for a weighted sum of chi^2 dists:
pval = Godambe.sum_chi2_ppf(D_adj, weights=(0.5,0.5))
print('p-value for rejecting no-migration model: {0:.4f}'.format(pval))
