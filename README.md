## Scripts used to analyse the data for "Exploring coral speciation: five Stylophora pistillata taxa along a divergence continuum on the Great Barrier Reef"

* ipyrad_steps.sh - bash script running ipyrad (https://ipyrad.readthedocs.io/en/master/) with standard parameters, ddRAD paired-end read data, and reference genome aligmment.

* vcf_filtering.sh - bash script filtering original VCF file obtained with ipyrad using VCFTOOLS,  remmoving SNPs in physical linkage using PLINK and removing clones using vcf_clone_detect.py by Pim Bongaerts (https://github.com/pimbongaerts/radseq/blob/master/vcf_clone_detect.py). 

* treemix.sh - bash script transforming the VCF file into a plink format, converting plink clustered allele frequencies to treemix format using the python script plink2treemix.py by Thom Nelson (https://github.com/thomnelson/tools/blob/master/plink2treemix.py) and running TreeMix for 0 to 4 migration edges and 10 iterations.

* admixture.sh - bash script performing ADMIXTURE from a .bed file for K2 to K15 and outputing log files and cross validation errors. 

* dadi_jobarray.sh - bash script running dadi optimisation models as a job array, using the folder structure and script developped by K. Prata (https://github.com/kepra3/kp_dadi)
