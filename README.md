# RAD_bioinformatics

## Scripts used to filter and process RAD genomic data

* ipyrad_steps.sh - bash script ro run ipyrad (https://ipyrad.readthedocs.io/en/master/) with standard parameters.

* vcf_filtering.sh - bash script to filter a VCF file which filters SNPs according to specific thresholds and make use of the python script vcf_clone_detect.py by Pim Bongaerts (https://github.com/pimbongaerts/radseq/blob/master/vcf_clone_detect.py) to remove one individual from every deteted clone pairs. 

* treemix.sh - bash script transforming a VCF file into a plink format, making use of the python script plink2treemix.py by Thom Nelson (https://github.com/thomnelson/tools/blob/master/plink2treemix.py) to convert plink clustered allele frequencies to treemix format and running TreeMix for 0 to 4 migration edges ana 10 iterations.

* admixture.sh - bash script performing ADMIXTURE from a .bed file for K2 to K15. Outputs log files and CV errors. 

* dadi_jobarray.sh - bash script to run dadi optimisation models as a job array. I used the folder structure and script from K. Prata (https://github.com/kepra3/kp_dadi) and integrated this in the Scripts folder.
