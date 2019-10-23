#!/bin/bash
#chmod +x 16S_workflow.sh

dossier_reads_bruts=$1
dossier_sortie=$2

echo $1
echo $2

#if ! [ -d /$dossier_sortie/ ]; then
#	echo "Repository does not exist"
#	mkdir $2
#else 
#	echo "Repository exists";
#fi

#fastq_files=$(find $1 -name "*.fastq.gz"| gunzip )

##Fastqc
#mkdir $2/fastqc
#for FILE in $fastq_files
#do
#	echo $FILE
#	fastqc $FILE --outdir $2/fastqc
#done

##Trimming
#mkdir $2/trimming
#for elt in $(ls $1*.fastq |sed -r 's/_R[12].fastq//'|uniq)
#do 
#	echo $elt
#	java -jar ../tp_1/soft/AlienTrimmer.jar -if ${elt}_R1.fastq -ir ${elt}_R2.fastq -c ../tp_1/databases/contaminants.fasta -of $2/trimming/${elt}_R1.trim.fastq -or $2/trimming/${elt}_R2.trim.fastq -os $2/trimming/${elt}_single.trim.fastq
#done

##Vsearch
mkdir $2/vsearch
#for elt in $(ls $2/trimming/*.trim.fastq |sed -r 's/_R[12].trim.fastq//'|uniq)
#do
#echo $elt
#suffixe=";sample= $fichier" 
#	../tp_1/soft/vsearch --fastq_mergepairs ${elt}_R1.trim.fastq --reverse ${elt}_R2.trim.fastq --label_suffix $suffixe --fastaout ${elt}.merged.fasta
#done

#cat $1/*.merged.fasta > $1/amplicon.fasta

#sed "s/ /_/g" $1/amplicon.fasta > $1/amplicon.clean.fasta

#../tp_1/soft/vsearch --derep_fulllength $1/amplicon.clean.fasta -sizeout --minuniquesize 10 --output $1/amplicon.noSingleton.fasta
#../tp_1/soft/vsearch --uchime_denovo $1/amplicon.noSingleton.fasta --nonchimeras $1/results.fasta
OTU_n="OTU_"
#../tp_1/soft/vsearch --cluster_size $1/results.fasta --id 0.97 --centroids $1/centroids.fasta --uc $1/clusters.uc --relabel $OTU_n

#../tp_1/soft/vsearch --usearch_global $1/results.fasta --otutabout $1/amplicon_abun.txt --db $1/centroids.fasta  --id 0.97

#../tp_1/soft/vsearch --usearch_global $1/centroids.fasta --userout  $1/amplicon_annot.txt --db ../tp_1/databases/mock_16S_18S.fasta  --id 0.9 --top_hits_only --userfields query+target

#sed '1iOTU\tAnnotation' -i $1/amplicon_annot.txt


