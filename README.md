This repository contains all materials, data and code to reproduce the analyses presented in our manuscript. It includes the study preregistration, the raw data, R scripts and R Markdown files used to generate the results. Below is an overview of the structure of this repository and a brief description of the files. 

Manuscript:
The folder manuscript/ contains the following documents:
-	preprint: a PDF document containing the preprint of the study. 
- supplementary_file: a PDF document containing additional information about how the shape of the interaction determines the size of the effect.
-	preregistration: a PDF document containing the preregistration.

Materials:
The folder materials/ contains:
-	coding_form: a PDF document with the coding scheme used to code data from sampled studies. This coding scheme was applied in two projects: (1) the reproducibility of a priori power analyses and (2) a z-curve analysis.

Data:
The folder raw_data/ contains:
-	raw_data.xlsx contains the original dataset that was double and triple coded. This is the raw data before any steps were taken to resolve disagreements.
-	disagreements3.xlsx: each sheet in this file corresponds to a variable that was triple coded. This dataset was used to compare responses between coders and resolve disagreements.
-	disagreements2.xlsx: each sheet in this file corresponds to a variable that was double coded. This dataset was used to compare responses between coders and resolve disagreements.
-	processed_data contains the dataset after resolving disagreements. This dataset contains data used for both projects: (1) the reproducibility of a priori power analyses and (2) a z-curve analysis.
-	consolidated_data_power.xlsx contains the raw data used for the analyses of this manuscript.
-	power_analysis.xlsx expands on “consolidated_data_power.xlsx” by containing manually created columns for assessing the reproducibility of a priori power analyses. This dataset cannot be fully recreated in R due to manual modifications.

Code:
The folder r_scripts/ contains all analysis scripts that were used to compute all results presented in the manuscript.
-	sample_size_calculation.R contains the sample size calculation based on a precision analysis.

The subfolder intercoder_agreement/ contains the functions to process data and calculate interrater agreement between raters, including:
-	01_checking_disagreements.R produces files “disagreements3.xlsx” and “disgreements2.xlsx”.
-	02_intercoder _agreement_function.R contains the functions used to assess intercoder agreement.
-	03_intercoder_agreement.Rmd an R Markdown documents presenting the results of the intercoder agreement across variables.

The subfolder data_analysis/ contains the scripts to load data and conduct statistical analyses, including:
-	01_consolidate_data.R merges columns from “disagreements3.xlsx” and “disagreements2.xlsx” containing responses after disagreements have been resolved.
-	02_clean_data.R cleans, processes and loads data used in our analyses. 
-	03_descriptive_stats_function.R contains a function used in “10_descriptive_es.Rmd” to generate descriptive statistics.
-	04_reporting_practices_analysis.R: an R Markdown document with the results of examining reporting practices of a priori power analyses.
-	05_reproducibility_analysis.Rmd: an R Markdown document with the results of examining the reproducibility of a priori power analyses.
-	06_sample_and_proportion_analysis.Rmd: an R Markdown document with the results of the differences in sample sizes and the proportion of studies that supported the tested hypothesis tested, comparing studies that reported an a priori power analysis with those that did not.
-	07_descriptive_es.Rmd: an R Markdown document with the descriptive results on the effect sizes reported in a priori power analyses.
-	08_figures.Rmd: an R Markdown document to generate the figures reported in the manuscript.

The subfolder supplementary_information/ contains the scripts to reproduce the figures reported in the Supplementary information.

Figures:
The folder figures/ contains the figures originated from the statistical analyses.
