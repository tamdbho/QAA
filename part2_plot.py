#!/usr/bin/env python
import gzip
import argparse
import numpy as np
import matplotlib.pyplot as plt

def get_args():
    parser = argparse.ArgumentParser(description="Reads trimmed FASTQ file and output read length distribution graphs")
    parser.add_argument("-r1", "--read1file", help="Path to file", required=True)
    parser.add_argument("-r2", "--read2file", help="Path to output histogram image", type=str)
    parser.add_argument("-o", "--outputimage", help="length of empty list", type=int)
    return parser.parse_args()
args=get_args()	

r1 = args.read1file  # input file name
r2 = args.read2file 
# o = args.outputimage

length_dist1 = []
length_dist2 = []

# with open("r1.txt","r") as file1:
with gzip.open (r1,"rt") as file1:
    i = 0
    for line in file1:
        line = line.strip()
        i+=1
        if i%4 == 2:
            length = len(line)
            length_dist1.append(length)
            

# with open("r2.txt","r") as file2:
with gzip.open (r2,"rt") as file2:
    j = 0
    for line2 in file2:
        line2 = line2.strip()
        j+=1
        if j%4 == 2:
            length2 = len(line2)
            length_dist2.append(length2)


plt.hist([length_dist1,length_dist2], alpha = 0.5, color =['purple','red'], label=['R1','R2'])
plt.legend()
plt.yscale("log")
plt.xlabel("Read length (bp)")
plt.ylabel("Abundance (Log)")
plt.title(f'Read length distribution of 8_2F_fox_S7_L008')
plt.savefig("rlength_log_8_2F_fox_S7_L008.png")

  
