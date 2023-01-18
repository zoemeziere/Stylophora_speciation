# RAD_bioinformatics

## Scripts used to filter and process RAD genomic data

* ipyrad_steps.sh is a bash script ro run ipyrad (https://ipyrad.readthedocs.io/en/master/) with standard parameters.

* vcf_filtering.sh is a bash script to filter a VCF file which filters SNPs according to specific thresholds and make use of the python script vcf_clone_detect.py by Pim Bongaerts (https://github.com/pimbongaerts/radseq/blob/master/vcf_clone_detect.py) to remove one individual from every deteted clone pairs. 
