# tp_metagenomique
## Author : CAPRON Coralie

  > **Note to Diderot Bioinformatics Master students looking at this repository :**  
 > 
 > Bonjour à tous, vous avez accès ici à un repo que j'ai laissé en public pour évaluation en premier lieu puis en guise de démonstration du travail que j'ai pu faire lors de mon M2 par la suite. Vous avez donc la possibilité en tant qu'étudiant de regarder et/ou de cloner ce repo. A savoir toutefois que, bien que ce repo puisse vous inspirer (ou non) ou vous aider pour avancer dans votre travail, celui-ci est soumis à la propriété intellectuelle. A savoir donc que : Le plagiat, selon son niveau de gravité, est une contrefaçon. L'article L122-4 du Code de la propriété intellectuelle prévoit que "toute représentation ou reproduction intégrale ou parielle faite sans le consentement de l'auteur ou de ses ayants droit ou ayants cause est illicite". Soyez critique sur ce que vous trouverez dans ce repository, et dans les résultats qui y sont produits. Aidez-vous de ce travail mais par pitié, ne le plagiez pas bêtement, vous devez vous casser la tête pour devenir ensuite de bons bioinformaticiens. A bon entendeur. 



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
