#!/bin/bash
#chmod +x 16S_workflow.sh

dossier_reads_bruts=$1
dossier_sortie=$2

echo $1
echo $2

if ! [ -d /$dossier_sortie/ ]; then
	echo "Repository does not exist"
	mkdir $2
else 
	echo "Repository exists";
fi

fastq_files=$(find $1 -name "*.fastq.gz"| gunzip )

#for FILE in $fastq_files
#do
#	echo $FILE
#	fastqc $FILE --outdir $dossier_sortie
#done

for elt in $(ls $1*.fastq |sed -r 's/_R[12].fastq//'|uniq)
do 
	echo $elt
	java -jar ../tp_1/soft/AlienTrimmer.jar -if ${elt}_R1.fastq -ir ${elt}_R2.fastq -c ../tp_1/databases/contaminants.fasta -of ${elt}_R1.trim.fastq -or ${elt}_R2.trim.fastq -os ${elt}_single.trim.fastq
done



