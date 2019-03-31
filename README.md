# Bostongene
For load and process data of mutation

BostonGene_data_load.ipynb is a notebook to load maf data from https://www.cbioportal.org/ and write it to .csv format (hnsc_tcga study).
Require Mutated_Genes.tsv dataset that contain significatnly genes MutSig annotated, loaded from portal https://www.cbioportal.org/study?id=laml_tcga_pan_can_atlas_2018 
BostonGene_data_load_laml.ipynb load maf data for custom study, but require a gene set from portal which is loaded manually (in this case it is acute myeloid leukemia study). Use this maf files to analyse driver genes downstream.

I apllied two approaches to investigate cancer driver genes: dndscv (https://github.com/im3sanger/dndscv), OncodriveCLUST (https://bitbucket.org/bbglab/oncodriveclust). OncodriveCLUST was used as function realised in maftools R-package (Mayakonda A, Lin DC, Assenov Y, Plass C, Koeffler HP. 2018. Maftools: efficient and comprehensive analysis of somatic variants in cancer. Genome Research. http://dx.doi.org/10.1101/gr.239244.118). 

Results of dndscv algorithm are available in dnds_counting_hnc.html document. For head and neck cancer this method detected 69 driver genes, MutSig 75 and 64 genes are common. R-script dnds_counting.Rmd is suit to other cancer study, but work for long time and require cluster to fast counting.

Maftool is convenient method to visualize and analyse cancer study, in maftool_counting script it is shown. Maf file which are loaded from portal have to convert to requisite input for maftool library. Results is in maftool_counting.html file. OncodriveCLUST identify 13 significantly driver genes, which is less then MutSig.
