#!/bin/bash
#SBATCH --account=bgmp                    
#SBATCH --partition=compute               
#SBATCH --mail-type=ALL                  
#SBATCH --cpus-per-task=8                 
#SBATCH --mem=32GB  

conda activate QAA

adapter_R1="AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"
adapter_R2="AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"

input_dir1_R1=/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R1_001.fastq.gz
input_dir1_R2=/projects/bgmp/shared/2017_sequencing/demultiplexed/29_4E_fox_S21_L008_R2_001.fastq.gz
input_dir2_R1=/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz
input_dir2_R2=/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz

output_dir1_R1=/projects/bgmp/tamho/bioinfo/Bi623/QAA/cutadapt_29/29_4E_fox_S21_L008_R1.fastq
output_dir1_R2=/projects/bgmp/tamho/bioinfo/Bi623/QAA/cutadapt_29/29_4E_fox_S21_L008_R2.fastq
output_dir2_R1=/projects/bgmp/tamho/bioinfo/Bi623/QAA/cutadapt_8/8_2F_fox_S7_L008_R1.fastq
output_dir2_R2=/projects/bgmp/tamho/bioinfo/Bi623/QAA/cutadapt_8/8_2F_fox_S7_L008_R2.fastq

/usr/bin/time -v cutadapt -a $adapter_R1 -A $adapter_R2 -o $output_dir1_R1 -p $output_dir1_R2 $input_dir1_R1 $input_dir1_R2
/usr/bin/time -v cutadapt -a $adapter_R1 -A $adapter_R2 -o $output_dir2_R1 -p $output_dir2_R2 $input_dir2_R1 $input_dir2_R2