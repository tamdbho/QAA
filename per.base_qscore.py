#!/usr/bin/env python

import gzip
import bioinfo
import matplotlib.pyplot as plt
import argparse

def get_args():
    parser = argparse.ArgumentParser(description="Reads FASTQ file and output per base mean quality score distribution graph")
    parser.add_argument("-f", "--filename", help="Path to file", required=True)
    parser.add_argument("-u", "--outputimage", help="Path to output histogram image", type=str)
    parser.add_argument("-l", "--listlength", help="length of empty list", type=int)
    return parser.parse_args()
args=get_args()	

f = args.filename  # input file name
u = args.outputimage 
l = args.listlength

# Create an empty list:
qscore_sum = []
i = 0
while i < l:
    qscore_sum.append(0.0)
    i+=1

# Using empty list to calculate a running sum of qscores for each base position:
# with open(f,"r") as file:
with gzip.open (f,"rt") as file:
    i = 0
    num_lines = 0
    for line in file:
        line = line.strip()
        i+=1
        num_lines+=1
        if i%4 == 0:
            for base in range (len(line)):
                qscore_sum [base] += bioinfo.convert_phred(line[base])

# Use list of sums to calculate all the means:
num_record = num_lines/4
qscore_mean = []
for qscore in qscore_sum:
    qscore_mean.append(qscore/num_record)

# Create histogram and tsv file:
x = []
for i in range(len(qscore_mean)):
    x.append(i)
y = qscore_mean

plt.bar (x,y)
plt.xlabel("Position in read (bp)")
plt.ylabel("Mean QScore")
plt.title(f'Mean quality scores across all bases {u}')
plt.savefig(f'{u}.png')