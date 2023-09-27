## Scripts used to analyse the data for "Exploring coral speciation: five Stylophora pistillata taxa along a divergence continuum on the Great Barrier Reef"

##Data

## Scripts

* ipyrad_steps.sh - bash script running ipyrad (https://ipyrad.readthedocs.io/en/master/) with standard parameters, ddRAD paired-end read data, and reference genome aligmment.

* vcf_filtering.sh - bash script filtering original VCF file obtained with ipyrad using VCFTOOLS,  remmoving SNPs in physical linkage using PLINK and removing clones using vcf_clone_detect.py by Pim Bongaerts (https://github.com/pimbongaerts/radseq/blob/master/vcf_clone_detect.py). 

* treemix.sh - bash script transforming the VCF file into a plink format, converting plink clustered allele frequencies to treemix format using the python script plink2treemix.py by Thom Nelson (https://github.com/thomnelson/tools/blob/master/plink2treemix.py) and running TreeMix for 0 to 4 migration edges and 10 iterations.

* admixture.sh - bash script performing ADMIXTURE from a .bed file for K2 to K15 and outputing log files and cross validation errors. 

* Dxy.sh - bash script calculating Dxy from a VCF file using BCFTOOL, VCFTOOLS and PIXY. See https://pixy.readthedocs.io/en/latest/ for more details.

* dadi_all.sh - bash script used for dadi analyses - uses folder structure and developped and slightly adapted from K. Prata (https://github.com/kepra3/kp_dadi)

## Results
