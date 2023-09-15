#!/bin/bash
#SBATCH --account=bgmp                    
#SBATCH --partition=compute               
#SBATCH --mail-type=ALL                  
#SBATCH --cpus-per-task=8                 
#SBATCH --mem=32GB  

conda activate bgmp_py311

file_1=/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R1_001.fastq.gz
file_2=/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R2_001.fastq.gz
file_3=/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz 
file_4=/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz 

output_1="29_4E_fox_S21_L008_R1_001"
output_2="29_4E_fox_S21_L008_R2_001"
output_3="8_2F_fox_S7_L008_R1_001"
output_4="8_2F_fox_S7_L008_R2_001"

/usr/bin/time -v ./per.base_qscore.py -f $file_1 -u $output_1 -l 101
/usr/bin/time -v ./per.base_qscore.py -f $file_2 -u $output_2 -l 101
/usr/bin/time -v ./per.base_qscore.py -f $file_3 -u $output_3 -l 101
/usr/bin/time -v ./per.base_qscore.py -f $file_4 -u $output_4 -l 101
