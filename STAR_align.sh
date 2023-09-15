#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB

conda activate QAA

dbDIR=/projects/bgmp/tamho/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.ens110.STAR_2.7.10b

input_dir1_R1=/projects/bgmp/tamho/bioinfo/Bi623/QAA/trimmed_29_4E_fox_S21_L008/29_R1_PAIRED.fq.gz
input_dir1_R2=/projects/bgmp/tamho/bioinfo/Bi623/QAA/trimmed_29_4E_fox_S21_L008/29_R2_PAIRED.fq.gz

input_dir2_R1=/projects/bgmp/tamho/bioinfo/Bi623/QAA/trimmed_8_2F_fox_S7_L008/8_R1_PAIRED.fq.gz
input_dir2_R2=/projects/bgmp/tamho/bioinfo/Bi623/QAA/trimmed_8_2F_fox_S7_L008/8_R2_PAIRED.fq.gz

 /usr/bin/time -v STAR \
--runThreadN 8 \
--runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 \
--alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $input_dir2_R1 $input_dir2_R2 \
--genomeDir $dbDIR