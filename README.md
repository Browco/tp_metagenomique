# tp_metagenomique
## Author : CAPRON Coralie



## Requirements

* Some tools : 
	- FastQC (precisely v0.11.8),
	- Vsearch (v2.7.1_linux_x86_64)
	- AlienTrimmer

## Utilization

In a shell : 
```
chmod +x 16S_workflow.sh
./16S_workflow.sh INPUT_DIRECTORY OUTPUT_DIRECTORY
```

Knowing that :
- INPUT_DIRECTORY : A directory with all the fastq.gz files paired end
- OUTPUT_DIRECTORY : The output directory for the results

## Output

This script will create an output directory with sub-directories for each tool (Fastqc, vsearch, alientrimmer). 
