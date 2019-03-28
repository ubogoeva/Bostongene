library(maftools)
maf_file <- read.csv('C:/Users/Лена/Documents/BostonGene/genes_sign_mutsig.csv', header = T)
colnames(maf_file)
head(maf_file)
colnames(maf_file)[2] <- 'Hugo_Symbol'
colnames(maf_file)[13] <- 'Chromosome'
colnames(maf_file)[3] <- 'Tumor_Sample_Barcode'
colnames(maf_file)[8] <- 'Protein_Change'
colnames(maf_file)[6] <- 'Variant_Classification'
maf_file$Variant_Type <- NA
maf_file[grep('Del', maf_file$Variant_Classification, 
                           ignore.case = T), 23] <- 'DEL'
maf_file[grep('Ins', maf_file$Variant_Classification, 
              ignore.case = T), 23] <- 'INS'
maf_file[is.na(maf_file$Variant_Type), 23] <- 'SNP'
sum(maf_file$Variant_Type == 'INS')
colnames(maf_file)[17] <- 'Tumor_Seq_Allele2'
write.table(maf_file, file = 'C:/Users/Лена/Documents/BostonGene/genes_sign_mutsig.tsv', 
            sep = '\t', quote = F, row.names = F)
laml <- read.maf(maf = 'C:/Users/Лена/Documents/BostonGene/genes_sign_mutsig.tsv')
laml
getSampleSummary(laml)
View(getGeneSummary(laml))
getFields(laml)
write.mafSummary(maf = laml, basename = 'laml')
plotmafSummary(maf = laml, rmOutlier = TRUE, addStat = 'median', 
               dashboard = TRUE, titvRaw = FALSE)
oncoplot(maf = laml, top = 10, fontSize = 12)
laml.sig = oncodrive(maf = laml, AACol = 'Protein_Change', 
                     minMut = 5, pvalMethod = 'zscore')
head(laml.sig)
plotOncodrive(res = laml.sig, fdrCutOff = 0.1, useFraction = TRUE)
laml.sig[laml.sig$fdr < 0.1, 1]
laml.pfam = pfamDomains(maf = laml, AACol = 'Protein_Change', top = 10)
somaticInteractions(maf = laml, top = 25, pvalue = c(0.05, 0.1))
