#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB

conda activate QAA

dbDIR=/projects/bgmp/tamho/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.ens110.STAR_2.7.10b
fastaDIR=/projects/bgmp/tamho/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.dna.primary_assembly.fa
gtfDIR=/projects/bgmp/tamho/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.110.gtf


/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir $dbDIR \
--genomeFastaFiles $fastaDIR \
--sjdbGTFfile $gtfDIR