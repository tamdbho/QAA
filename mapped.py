#!/usr/bin/env python
import argparse

def get_args():
	parser = argparse.ArgumentParser(description="Reads SAM file and output number of mapped and unmapped reads into terminal")
	parser.add_argument("-f", "--filename", help="Path to file", required=True)
	return parser.parse_args()
args=get_args()

f = args.filename  # input file name

mapped_count = 0
unmapped_count = 0
with open (f,"r") as sam: # -f input file should be a sam file
    i = 0
    for line in sam:
        line = line.strip()
        if line.startswith("@"):
            pass
        else:
            line = line.split("\t")
            flag = int(line [1])
            if ((flag & 256) != 256):
                if ((flag & 4) != 4):
                    mapped_count += 1
                else:
                    unmapped_count += 1
        i+=1
    print("Number of mapped sequence: ",mapped_count)
    print("Number of unmapped sequence: ",unmapped_count)
    