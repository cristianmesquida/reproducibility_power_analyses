# Repository

This repository contains all materials, data and code to reproduce the analyses presented in our manuscript, as well as the manuscript itself written in Quarto.

# Project Structure

```
reproducibility_power_analyses/
├── preregistration.pdf               # Preregistration document
|
├── manuscript/ 
│   ├── preprint.pdf                  # Preprint of the study
│   ├── manuscript.qmd                # Quarto document to fully reproduce the manuscript
|   ├── manuscript.pdf                # PDF document of the manuscript
|   ├── appendix.qmd                  # Quarto document to fully reproduce supplementary file
|   ├── appendix.pdf                  # PDF document to fully reproduce supplementary file
│   └── references.bib                # Bib file containing references used in the manuscript
│
├── materials/ 
│   └── coding_form.pdf               # Coding scheme used in two projects
│
├── raw_data/
│   ├── raw_data.xlsx                  # Original dataset before resolving disagreements
│   ├── disagreements3.xlsx            # Triple-coded dataset for resolving disagreements
│   ├── disagreements2.xlsx            # Double-coded dataset for resolving disagreements
│   ├── processed_data                 # Dataset after resolving disagreements
│   ├── consolidated_data_power.xlsx   # Processed dataset used for manuscript analyses
│   └── power_analysis.xlsx            # Dataset with manual modifications for power analyses
│
├── r_scripts/ 
│   ├── sample_size_calculation.R                  # Script for sample size calculation (precision analysis)
│   ├── intercoder_agreement/                      # Functions and scripts to calculate interrater agreement
│       ├── 01_checking_disagreements.R            # Produces disagreements3.xlsx & disagreements2.xlsx
│       ├── 02_intercoder_agreement_function.R     # Functions to assess intercoder agreement
│       └── 03_intercoder_agreement.Rmd            # Results of intercoder agreement
│   └── data_analysis/                             # Scripts for statistical analyses
│       ├── 01_consolidate_data.R                  # Merge columns after resolving disagreements
│       ├── 02_clean_data.R                        # Clean and process data
│       ├── 03_descriptive_stats_function.R        # Function used in 07_descriptive_es.Rmd
│       ├── 04_reporting_practices_analysis.Rmd    # Reporting practices of a priori power analyses
│       ├── 05_reproducibility_analysis.Rmd        # Reproducibility of a priori power analyses
│       ├── 06_sample_and_proportion_analysis.Rmd  # Differences in sample sizes and hypothesis support
│       ├── 07_descriptive_es.Rmd                  # Descriptive results on effect sizes
│       └── 08_figures.Rmd                         # Generate figures reported in manuscript
│   
└── figures/                                       # Contains the figures reported in manuscript and appendix
│   ├── es_distribution.pdf
│   ├── es_justification.pdf
│   ├── gpower.png
│   ├── reproducibility.pdf
│   ├── statistical_test.pdf
│   ├── type_es.pdf
│   ├── hypoxia.png   
│   └── interaction.png
│ 
└── session-info.tex    # Contains a snapshot of the computational environment used to generate manuscript.qmd         
```
