# Load package
library(here)

# Load function to estimate inter-rater agreement between 3 and 2 coders
source(here("r_scripts", "intercoder_agreement", "02_intercoder_agreement_function.R"))


# Inter-rater agreement between 3 coders: Fleiss' kappa
agreement_3_coders <- calculate_kappa3_from_excel(here("data/disagreements3.xlsx"))


# Average Fleiss' kappa
# Calculate average Fleiss' kappa after excluding hypothesis_statement, 
# statistical result, type effect, preregistration, public_data_repository and 
# link_data_repository

average_fleiss <- mean(agreement_3_coders[-c(15, 19:23), 2]) 


# Inter-rater agreement between 2 coders: Cohen's kappa
# Calculate Cohen's kappa by coded variable

agreement_2_coders <- calculate_kappa2_from_excel(here("data/disagreements2.xlsx")) 


# Average Cohen's Kappa
# Calculate average Cohen's Kappa after excluding hypothesis_statement, 
# statistical result, type effect, preregistration, public_data_repository and 
# link_data_repository

average_cohen <- mean(agreement_2_coders[-c(15, 19), 2])







