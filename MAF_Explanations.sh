#!/bin/bash

for i in `seq 1 47`;
do
	echo -n "Column $i:  ";
	cat hgsc.bcm.edu_COAD.IlluminaGA_DNASeq.1.somatic.maf | head -n 2 | cut -f $i | grep -v "#version";
done