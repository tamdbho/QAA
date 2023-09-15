#!/bin/bash
#SBATCH --account=bgmp                    
#SBATCH --partition=compute               
#SBATCH --mail-type=ALL                  
#SBATCH --cpus-per-task=8                 
#SBATCH --mem=32GB  

module spider fastqc
module load fastqc/0.11.5

dir_1_R1=/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R1_001.fastq.gz
dir_1_R2=/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R2_001.fastq.gz
dir_2_R1=/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz
dir_2_R2=/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz

output_dir1=/projects/bgmp/tamho/bioinfo/Bi623/QAA/29_output
output_dir2=/projects/bgmp/tamho/bioinfo/Bi623/QAA/8_output
/usr/bin/time -v fastqc $dir_1_R1 -o $output_dir1 --extract
/usr/bin/time -v fastqc $dir_1_R2 -o $output_dir1 --extract
/usr/bin/time -v fastqc $dir_2_R1 -o $output_dir2 --extract
/usr/bin/time -v fastqc $dir_2_R2 -o $output_dir2 --extract