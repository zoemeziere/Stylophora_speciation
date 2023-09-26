#create VCF file with invariable and varaible sites using BCFTOOLS
bcftools mpileup -f /QRISdata/Q5253/RAD_data/Stylophora/raw_data/reference_genome_gbr/Stylophora_pistillata_LR3SR3PC3.fa_decontaminated.fasta -b bam-files.txt | bcftools call -m -Oz -f GQ -o Stylo_all_allsites

#filter using VCFTOOLS
vcftools --gzvcf Stylo_all_allsites.vcf.gz --keep sample_names.txt --recode --out Stylo_all_allsites_samples
vcftools --gzvcf Stylo_all_allsites_samples.vcf.gz --remove-indels --max-missing 0.95 --recode --out Stylo_all_allsites_samples_SF

#filter variable and invariable sites separately:

#create a filtered VCF containing only invariant sites
vcftools --gzvcf Stylo_all_allsites_samples_SF.recode.vcf.gz --max-maf 0 --recode --out Stylo_all_allsites_samples_SF_invar

#create a filtered VCF containing only variant sites
vcftools --gzvcf Stylo_all_allsites_samples_SF.recode.vcf.gz --mac 3 --maf 0.005 --recode --min-alleles 2 --max-alleles 2 --max-meanDP 100 --recode --out Stylo_all_allsites_samples_SF_var

#compress and index both vcfs
tabix bgzip Stylo_all_allsites_samples_SF_var.recode.vcf tabix Stylo_all_allsites_samples_SF_var.recode.vcf bgzip Stylo_all_allsites_samples_SF_invar.recode.vcf tabix Stylo_all_allsites_samples_SF_invar.recode.vcf

#combine the two VCFs using bcftools concat
bcftools concat --allow-overlaps Stylo_all_allsites_samples_SF_var.recode.vcf Stylo_all_allsites_samples_SF_invar.recode.vcf -O z -o Stylo_all_allsites_samples_SF_combined.vcf

#remane contigs
sed 's/lcl|//' Stylo_all_allsites_samples_SF_combined.vcf > Stylo_all_allsites_samples_SF_combined2.vcf
f- zip and index
bgzip -c Stylo_all_allsites_samples_SF_combined2.vcf > Stylo_all_allsites_samples_SF_combined2.vcf.gz tabix Stylo_all_allsites_samples_SF_combined2.vcf.gz

#run pixy
pixy --stats pi fst dxy --vcf Stylo_all_allsites_samples_SF_combined2.vcf.gz --populations Stylo_popfile.txt --window_size 10000 --n_cores 4
