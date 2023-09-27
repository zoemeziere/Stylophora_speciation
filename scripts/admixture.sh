cd $PBS_O_WORKDIR

source /QRISdata/Q5253/miniconda3/etc/profile.d/conda.sh
conda activate admixture

FILE=Stylo_cluster5_sf095_ld

awk '{$1="0";print $0}' $FILE.bim > $FILE.bim.tmp
mv $FILE.bim.tmp $FILE.bim

for i in {2..15}
do
 admixture --cv $FILE.bed $i > log${i}.out 
done

awk '/CV/ {print $3,$4}' *out | cut -c 4,7-20 > $FILE.cv.error
