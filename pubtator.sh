#!/bin/bash
while read line
	do
		curl -L https://www.ncbi.nlm.nih.gov/research/pubtator-api/publications/export/pubtator?pmids=$line
	done < input.txt >> output.csv

sed '/|a|/d' output.csv > abstract.csv
sed '/|t|/d' abstract.csv > title.csv
sed '/^$/d' title.csv > final.csv

echo "Number of connections: "
wc -l final.csv

head -n 30 final.csv

rm abstract.csv
rm output.csv
rm title.csv


exit



