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
find $1 -name "*.fastq.gz"| gunzip 
fastq_files=$(find $1 -name "*.fastq")

##Fastqc
mkdir $2/fastqc
for FILE in $fastq_files
do
	echo $FILE
	fastqc $FILE --outdir $2/fastqc
done

##Trimming
mkdir $2/trimming
for elt in $(ls $1*.fastq |sed -r 's/_R[12].fastq//'|uniq)
do 
	echo $elt
	file=$(basename $elt)
	java -jar ../tp_1/soft/AlienTrimmer.jar -if ${elt}_R1.fastq -ir ${elt}_R2.fastq -c ../tp_1/databases/contaminants.fasta -of $2/trimming/${file}_R1.trim.fastq -or $2/trimming/${file}_R2.trim.fastq -os $2/trimming/${file}_single.trim.fastq
done

##Vsearch
mkdir $2/vsearch
for elt in $(ls $2/trimming/*.trim.fastq |sed -r 's/_R[12].trim.fastq//'|uniq)
do
echo $elt
file=$(basename $elt)
suffixe=";sample=${file}" 
	../tp_1/soft/vsearch --fastq_mergepairs ${elt}_R1.trim.fastq --reverse ${elt}_R2.trim.fastq --label_suffix $suffixe --fastaout $2/vsearch/$file.merged.fasta
done

cat $2/vsearch/*.merged.fasta > $2/vsearch/amplicon.fasta

sed "s/ /_/g" $2/vsearch/amplicon.fasta > $2/vsearch/amplicon.clean.fasta

../tp_1/soft/vsearch --derep_fulllength $2/vsearch/amplicon.clean.fasta -sizeout --minuniquesize 10 --output $2/vsearch/amplicon.noSingleton.fasta
../tp_1/soft/vsearch --uchime_denovo $2/vsearch/amplicon.noSingleton.fasta --nonchimeras $2/vsearch/results.fasta
OTU_n="OTU_"
../tp_1/soft/vsearch --cluster_size $2/vsearch/results.fasta --id 0.97 --centroids $2/vsearch/centroids.fasta --uc $2/vsearch/clusters.uc --relabel $OTU_n

../tp_1/soft/vsearch --usearch_global $2/vsearch/results.fasta --otutabout $2/vsearch/amplicon_abun.txt --db $2/vsearch/centroids.fasta  --id 0.97

../tp_1/soft/vsearch --usearch_global $2/vsearch/centroids.fasta --userout  $2/vsearch/amplicon_annot.txt --db ../tp_1/databases/mock_16S_18S.fasta  --id 0.9 --top_hits_only --userfields query+target

sed '1iOTU\tAnnotation' -i $2/vsearch/amplicon_annot.txt

#Pas de changement des abondances en modifiant juste la quantité d'adn (modif statistique). Par contre comparer les cycles de PCR, parce que la PCR génère des erreurs et fausse les abondances, moins il y a de cycles PCR il y a plus on réduit les erreurs. 
