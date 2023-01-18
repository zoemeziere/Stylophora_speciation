cd $PBS_O_WORKDIR
source /QRISdata/Q5253/miniconda3/etc/profile.d/conda.sh
conda activate plink

plink --vcf Stylo_sf095_noclones_ld_nohyb.vcf --freq --missing --out Stylo_plink --allow-extra-chr --set-missing-var-ids @:# --keep-allele-order --double-id --within clusterID.clus$
gzip Stylo_plink.frq.strat

conda deactivate

./plink2treemix.py Stylo_plink.frq.strat.gz Stylo_treemix_input.frq.gz

conda activate treemix

for m in {1..4}
do      
	for i in {0..10}  
        do
                treemix -i Stylo_treemix_input.frq.gz -m ${m} -bootstrap -k 1000 -o Stylo.${m}.${i}
       	done
done
