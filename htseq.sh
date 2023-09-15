#!/bin/bash
#SBATCH --account=bgmp                    
#SBATCH --partition=interactive              
#SBATCH --reservation=bgmp-res                
#SBATCH --cpus-per-task=8                 
#SBATCH --mem=16GB  

conda activate QAA

gtfDIR=/projects/bgmp/tamho/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.110.gtf
samDIR1=/projects/bgmp/tamho/bioinfo/Bi623/QAA/STAR_align_output_29_4E_fox_S21_L008/Aligned.out.sam
samDIR2=/projects/bgmp/tamho/bioinfo/Bi623/QAA/STAR_align_output_8_2F_fox_S7_L008/Aligned.out.sam


output=/projects/bgmp/tamho/bioinfo/Bi623/QAA/htseq_outputs

/usr/bin/time -v htseq-count --stranded yes $samDIR1 $gtfDIR  > $output/stranded_mapped_29_4E_fox_S21_L008.tsv

/usr/bin/time -v htseq-count --stranded reverse $samDIR1 $gtfDIR  > $output/reverse_mapped_29_4E_fox_S21_L008.tsv

/usr/bin/time -v htseq-count --stranded yes $samDIR2 $gtfDIR  > $output/stranded_mapped_8_2F_fox_S7_L008.tsv

/usr/bin/time -v htseq-count --stranded reverse $samDIR2 $gtfDIR  > $output/reverse_mapped_8_2F_fox_S7_L008.tsv