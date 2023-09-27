
cd $PBS_O_WORKDIR
source /QRISdata/Q5253/miniconda3/etc/profile.d/conda.sh

##Applingy basic filters to vcf file##\
conda activate vcftools

vcftools --vcf Stylo_ipyrad.vcf --remove-indels --max-meanDP 100 --min-meanDP 5 --max-missing 0.5 --mac 3 --min-alleles 2 --max-alleles 2 --recode --out Stylo_bf

##Finding and removing individuals with more than 30% missing data##
vcftools --vcf Stylo_bf.recode.vcf --missing-indv --out Stylo_bf

awk '$5 > 0.3' Stylo_bf.imiss | cut -f1 > imiss_to_remove.txt

vcftools --vcf Stylo_bf.recode.vcf --remove imiss_to_remove.txt --recode --out Stylo_bf_imissrm

##Applying more stringent filters to vcf file allowing for only 5% missing data and MAF=0.005##

vcftools --vcf Stylo_bf_imissrm.recode.vcf --remove-indels --max-meanDP 100 --min-meanDP 5 --max-missing 0.80 --mac 3 --min-alleles 2 --max-alleles 2 --maf 0.005 --recode --out Stylo_sf080

##Finding and removing clones##

python3 vcf_clone_detect.py --vcf Stylo_sf095.recode.vcf --output Stylo_sf095_clones
vcftools --vcf Stylo_sf095.recode.vcf --remove clones_to_remove.txt --recode --out Stylo_sf095_noclones

##Pruning vcf file##

conda deactivate
conda activate plink

plink --vcf Stylo_sf095_noclones.recode.vcf --double-id --allow-extra-chr --set-missing-var-ids @:#  --indep 50 5 2 --out Stylo_sf095_noclones_ld

plink --vcf Stylo_sf095_noclones.recode.vcf --double-id --allow-extra-chr --set-missing-var-ids @:# --extract Stylo_sf095_noclones_ld.prune.in --recode vcf --out Stylo_sf095_noclones_ld
