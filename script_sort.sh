#!/bin/bash
awk {'print $6"\t"$4'} mac_port.txt | sort -u -nk1.6 > input.txt

port=48

for i in $(seq 1 $port); do
	echo "ether$i" >> def.txt
done

awk -v OFS='\t' 'NR==FNR{a[$1]=$2; next}{$2=a[$1]; print}' input.txt def.txt


rm input.txt
rm def.txt