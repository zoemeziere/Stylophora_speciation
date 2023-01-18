{\rtf1\ansi\ansicpg1252\cocoartf2636
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c100000\c100000\c99985\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww18120\viewh10300\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf2 \cb3 \expnd0\expndtw0\kerning0
conda activate vcftools\
\
##Applingy basic filters to vcf file##\
\
vcftools --vcf Stylo_ipyrad.vcf --remove-indels --max-meanDP 100 --min-meanDP 5 --max-missing 0.5 --mac 3 --min-alleles 2 --max-alleles 2 --recode --out Stylo_bf\
\
##Finding and removing individuals with more than 30% missing data##\
vcftools --vcf Stylo_bf.recode.vcf --missing-indv --out Stylo_bf\
\
awk '$5 > 0.3' Stylo_bf.imiss | cut -f1 > imiss_to_remove.txt\
\
vcftools --vcf Stylo_bf.recode.vcf --remove imiss_to_remove.txt --recode --out Stylo_bf_imissrm\
\
##Applying more stringent filters to vcf file allowing for only 5% missing data and MAF=0.005##\
\
vcftools --vcf Stylo_bf_imissrm.recode.vcf --remove-indels --max-meanDP 100 --min-meanDP 5 --max-missing 0.80 --mac 3 --min-alleles 2 --max-alleles 2 --maf 0.005 --recode --out Stylo_sf080\
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 ##Finding and removing clones##\
\
\pard\pardeftab720\sa300\partightenfactor0

\fs28 \cf2 \cb3 python3 vcf_clone_detect.py --vcf Stylo_sf095.recode.vcf --output Stylo_sf095_clones\
vcftools --vcf Stylo_sf095.recode.vcf --remove clones_to_remove.txt --recode --out Stylo_sf095_noclones\
##Pruning vcf file##\
conda deactivate\
conda activate plink\
\pard\pardeftab720\partightenfactor0

\fs26 \cf2 \cb3 plink --vcf Stylo_sf095_noclones.recode.vcf --double-id --allow-extra-chr --set-missing-var-ids @:#  --indep 50 5 2 --out Stylo_sf095_noclones_ld\
\
plink --vcf Stylo_sf095_noclones.recode.vcf --double-id --allow-extra-chr --set-missing-var-ids @:# --extract Stylo_sf095_noclones_ld.prune.in --recode vcf --out Stylo_sf095_noclones_ld\
}