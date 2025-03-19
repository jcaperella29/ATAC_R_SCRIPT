# ATAC-seq R Script: Peak Annotation and Visualization

# Load necessary packages
library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(org.Hs.eg.db)
library(GenomicRanges)
library(clusterProfiler)
library(ggplot2)

# Step 1: Load your peak file (MACS2 format)
peak_file <- "example_peaks.narrowPeak"
peak <- readPeakFile(peak_file)

# Step 2: Annotate peaks
txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene
peak_annot <- annotatePeak(peak, tssRegion = c(-3000, 3000),
                           TxDb = txdb, annoDb = "org.Hs.eg.db")

# Step 3: Visualize annotation
plotAnnoBar(peak_annot)
plotDistToTSS(peak_annot)

# Step 4: Get gene list and run enrichment
peak_genes <- as.data.frame(peak_annot)$geneId
ego <- enrichGO(gene         = peak_genes,
                OrgDb        = org.Hs.eg.db,
                keyType      = "ENTREZID",
                ont          = "BP",
                pAdjustMethod = "BH",
                pvalueCutoff  = 0.05,
                qvalueCutoff  = 0.2)

# Step 5: GO Term plot
barplot(ego, showCategory = 15)

# Step 6: Save outputs
write.csv(as.data.frame(peak_annot), "peak_annotations.csv")
