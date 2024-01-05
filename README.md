# Data and scripts for "Exploring coral speciation: five Stylophora pistillata taxa along a divergence continuum on the Great Barrier Reef" (2024, Evolutionary Applications)

## Data

* Stylo_all_final.vcf.gz - unfiltered VCF file obtained via IPYRAD

## Scripts

### 1. RAD data demultiplexing, variant calling and filtering

* ipyrad_steps.sh - bash script running ipyrad (https://ipyrad.readthedocs.io/en/master/) with standard parameters, ddRAD paired-end read data, and reference genome aligmment.

* vcf_filtering.sh - bash script filtering original VCF file obtained with ipyrad using VCFTOOLS,  remmoving SNPs in physical linkage using PLINK and removing clones using vcf_clone_detect.py by Pim Bongaerts (https://github.com/pimbongaerts/radseq/blob/master/vcf_clone_detect.py). 


### 2. Population structure

* admixture.sh - bash script performing ADMIXTURE from a .bed file for K2 to K15 and outputing log files and cross validation errors.

* PCA_ADMITURE.R - R script performing PCA and ADMIXTURE analyses
  
* treemix.sh - bash script transforming the VCF file into a plink format, converting plink clustered allele frequencies to treemix format using the python script plink2treemix.py by Thom Nelson (https://github.com/thomnelson/tools/blob/master/plink2treemix.py) and running TreeMix for 0 to 4 migration edges and 10 iterations.

### 3. Population differentiation

* Dxy.sh - bash script calculating Dxy from a VCF file using BCFTOOL, VCFTOOLS and PIXY. See https://pixy.readthedocs.io/en/latest/ for more details.

### 4. Demographic modelling using dadi

* dadi_all.sh - bash script used for dadi analyses - uses folder structure and slightly adapted scripts from K. Prata (https://github.com/kepra3/kp_dadi)

    * make_fs.sh - make folded Site Frequency Spectrum
    * optimse_manuel.py - optimise demographic model
    * demo_models.py - detail of demographic models
    * compare_model.py - compares alternative models
    * condidence intervals - calculate confidence intervals around optimised parameters
    * nonparameteric_bootstrap - bootstrapping best fit model
