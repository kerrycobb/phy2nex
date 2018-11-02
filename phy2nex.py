#! /usr/bin/env python

'''
Incomplete python script for performance comparison
'''

import sys

def stacks_phylip_to_nexus(in_path, out_path):
    with open(in_path, 'r') as in_handle, open(out_path, 'w+') as out_handle:
        sample_num, character_num = in_handle.readline().split()
        sample_num = int(sample_num)
        out_handle.write('#NEXUS\n\nBEGIN DATA;\nDIMENSIONS NTAX={} NCHAR={};\nFORMAT DATATYPE=DNA MISSING=? GAP=-;\nMATRIX\n'.format(sample_num, character_num))
        for i in range(1, sample_num+1):
            line = in_handle.readline()
            sequence = line.rstrip().replace('N', '?')
            out_handle.write(sequence + '\n')
        out_handle.write(';\nEND;')

# if __name__ == "__main__":
#     stacks_phylip_to_nexus(sys.argv[1], sys.argv[2])

in_path = 'input.phy'
out_path = 'output.nex'
stacks_phylip_to_nexus(in_path, out_path)
