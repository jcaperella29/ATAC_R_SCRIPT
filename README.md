This project contains an R-based pipeline for post-peak ATAC-seq analysis, including:

- Genomic annotation of peaks (e.g., promoter, intron, intergenic)
- Functional enrichment of associated genes using **GO Biological Processes**
- Visualization of enriched terms via bar and pie charts
- Ready for integration into a future Shiny app

---

## 🧬 Features

- Accepts **MACS2-style narrowPeak files**
- Uses `ChIPseeker` for peak annotation and visualization
- Performs pathway enrichment using `enrichR` and the **GO_Biological_Process_2023** database
- Outputs include:
  - Annotated peak CSV
  - Enrichment result CSVs
  - Plots: annotation pie chart, top GO bar chart

---

## 📁 File Structure

📦ATACseq_R_Pipeline ┣ 📜example_peaks.narrowPeak # Sample peak file (test data) ┣ 📜ATACseq_analysis.R # Main R script ┣ 📜enrichr_GO_Biological_Process_2023_results.csv # Enrichment results (auto-generated) ┣ 📊plots/ # (Optional) Folder for saved plots ┗ 📄README.md # This file


---

## 🛠️ Requirements

Install required R packages:

```r
# CRAN + Bioconductor
install.packages(c("ggplot2", "enrichR"))
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install(c("ChIPseeker", "TxDb.Hsapiens.UCSC.hg38.knownGene",
                       "org.Hs.eg.db", "GenomicRanges", "clusterProfiler"))



🚀 How to Run
Clone or download this repo.
Open ATAC_script.R in RStudio or another R environment.
Ensure example_peaks.narrowPeak is in your working directory.
Run the script section by section, or use source("ATAC_script.R").
Generated plots and enrichment results will appear in the output directory.
