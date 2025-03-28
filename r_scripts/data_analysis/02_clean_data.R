# In this R script we read the data file "power_analysis.xlsx" which contains all
# data required to reproduce all analyses reported in this paper, including:
# 1) 04_reporting_practices_analysis.Rmd 
# 2) 05_reproducibility_analysis.Rmd 
# 3) 07_sample_and_proportion analysis.Rmd
# 4) 08_descriptive_es.Rmd


# Load packages
library(readxl)
library(here)
library(dplyr)
library(tidyr)

# Load data
data <- read_xlsx(here("data","power_analysis.xlsx")) 

# Papare data set
cleaned_data <- data %>%
  
  # Select and transform main dataset
  select(study_title, power_analysis, specified_dv_power, power_sample, type_es, 
         type_standardised_es, type_cohen, type_hedge, magnitude_es, 
         es_justification, sample_previous_study, statistical_test_power, software,
         measurements, groups, correlation, alpha_level, intended_power,
         included_for_reproducibility, gpower_default_option, 
         guessed_parameters, statistical_test_gpower, reproducibility, 
         software, type_es_in_gpower, magnitude_es_in_gpower,
         statistical_test_study, study_sample, type_hypothesis, support_hypothesis) %>%
  
  # Standardize missing values for "a priori" power analysis
  mutate(across(c("type_es", "type_standardised_es", "magnitude_es", 
                  "es_justification", "power_sample", "statistical_test_power", 
                  "alpha_level", "software", "intended_power"), 
                ~ if_else(power_analysis == "a priori" & is.na(.), 
                          "not reported", as.character(.)))) %>%
  
  # Convert data types
  mutate(across(c("power_analysis", "specified_dv_power", "type_es", 
                  "type_standardised_es", "type_cohen", "type_hedge", 
                  "es_justification", "statistical_test_power", "alpha_level", 
                  "software", "statistical_test_study", "intended_power", 
                  "type_hypothesis", "support_hypothesis"), as.factor),
         across(c("power_sample", "magnitude_es", "sample_previous_study",
                  "magnitude_es_in_gpower"), as.numeric)) %>%
  
  # Convert NA to "fully-non reproducible" when studies reported an a priori power analysis
  mutate(reproducibility = if_else(power_analysis == "a priori" & is.na(reproducibility), 
                                   "fully non-reproducible", reproducibility))


# Prepare 2nd data set used in "09_sample_and_proportion analysis.Rmd"
data2 <- cleaned_data %>% 
  select(study_sample, 
         power_analysis, 
         type_hypothesis, 
         support_hypothesis) %>%
  mutate(pre_p = case_when(power_analysis %in% c("post-hoc", 
                                                 "sensitivity", 
                                                 "not reported") ~ "n",
                           TRUE ~ power_analysis)) %>%
  mutate_at(c("pre_p", 
              "type_hypothesis", 
              "support_hypothesis"), as.factor) %>%
  filter(pre_p != "unclear")

