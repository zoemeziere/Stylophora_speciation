cd $PBS_O_WORKDIR
source /QRISdata/Q5253/miniconda3/etc/profile.d/conda.sh
conda activate ipyrad

##demultiplexing reads from different sequencing lanes separately (step 1)##

ipyrad -p params-P1.txt -s 1 -c 20 
ipyrad -p params-P2.txt -s 1 -c 20 
ipyrad -p params-P3.txt -s 1 -c 20 
ipyrad -p params-P4.txt -s 1 -c 20 
ipyrad -p params-S50.txt -s 1 -c 20

##merging parameter files##

ipyrad -m Stylo_all params-P1.txt params-P2.txt params-P3.txt params-P4.txt params-S50.txt

##running steps 2 to 6 on the merged parameter file##

ipyrad -p params-Stylo_all.txt -s 23456 -c 20 -f

#Look at output and copy names of samples with less than 1000 consensus read in samples_to_remove.txt

##removing individuals with low number of reads##

ipyrad -p params-Stylo_all.txt -b Stylo_all_final - samples_to_remove.txt -f

##run step 7##

ipyrad -p params-Stylo_all_final.txt -s 7 -c 20 -f
