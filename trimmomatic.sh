#!/bin/bash
#SBATCH --account=bgmp                    
#SBATCH --partition=compute               
#SBATCH --mail-type=ALL                  
#SBATCH --cpus-per-task=8                 
#SBATCH --mem=32GB  

conda activate QAA

input_dir1_R1=/projects/bgmp/tamho/bioinfo/Bi623/QAA/cutadapt_29/29_4E_fox_S21_L008_R1.fastq
input_dir1_R2=/projects/bgmp/tamho/bioinfo/Bi623/QAA/cutadapt_29/29_4E_fox_S21_L008_R2.fastq
input_dir2_R1=/projects/bgmp/tamho/bioinfo/Bi623/QAA/cutadapt_8/8_2F_fox_S7_L008_R1.fastq
input_dir2_R2=/projects/bgmp/tamho/bioinfo/Bi623/QAA/cutadapt_8/8_2F_fox_S7_L008_R2.fastq

output_dir1=/projects/bgmp/tamho/bioinfo/Bi623/QAA/trimmed_29
output_dir2=/projects/bgmp/tamho/bioinfo/Bi623/QAA/trimmed_8

/usr/bin/time -v trimmomatic PE -phred33 $input_dir1_R1 $input_dir1_R2 $output_dir1/29_R1_PAIRED.fq.gz $output_dir1/29_R1_UNPAIRED.fq.gz $output_dir1/29_R2_PAIRED.fq.gz $output_dir1/29_R2_UNPAIRED.fq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35
/usr/bin/time -v trimmomatic PE -phred33 $input_dir2_R1 $input_dir2_R2 $output_dir2/8_R1_PAIRED.fq.gz $output_dir2/8_R1_UNPAIRED.fq.gz $output_dir2/8_R2_PAIRED.fq.gz $output_dir2/8_R2_UNPAIRED.fq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35 