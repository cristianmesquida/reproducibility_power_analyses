# This script contains the sample size caluculation based on a precision analysis

# Load package
library("tidyverse")


# For proportions, using 0.5 as the expected proportion is appropriate in 
# situations where you do not know what to expect - this is the most conservative 
# approach because it leads to a maximal sample size estimate. See Gelman & Hill (2006, p. 442).

# Simulation of a range of margins of errors (MOE) for a given hypothesized proportion and 
# 95% confidence interval.

moe <- seq(0.01,1,0.001) # range of margin of error for the 95% confidence interval
p <- 0.30 # expected proportion of studies with a pre-study power calculation
z <- 1.96 # corresponding to the desired confidence interval (e.g., 1.96 for a 95% confidence interval)
n <- numeric() # number of studies
n_all <- vector("numeric", length = length(moe))

for (i in 1:length(moe)) { #for each simulated experiment
n <- ((sqrt(p*(1-p))*z) /moe[i])^2
n_all[i] <- n
}

df <- data.frame(moe = moe, n_all = round(n_all, 0))
colnames(df) <- c("Margin of Error", "Sample Size")
table <- df %>% filter(n_all > 280 & n_all < 500)
write.table(table, file = "table.txt", sep = ",", quote = FALSE, row.names = F)

# sample size required to obtain a proportion of 20% given a 95% confidence interval
# and a margin of error of 0.05
n <- ((sqrt(0.3*(1-0.3))*1.96) /0.05)^2
print(n)

#now plot histograms of margin of error vs. sample size
sample_size <- ggplot(data = df) + geom_line(aes(x = n_all, y = moe)) +
  scale_x_continuous(expand = c(0.01, 0),limits=c(0, 1000), breaks = seq(0,1000, 100)) +
  scale_y_continuous(expand = c(0.01, 0), limits=c(0,0.25), breaks = seq(0,0.5,0.05)) +
  ylab("Margin of Error (MOE)") +
  xlab("Sample Size") +
  theme_classic() +
  theme(panel.grid.major = element_line(colour = "gray", linetype = "dotted")) +
  geom_vline(xintercept = 350, colour = "red") +
  geom_hline(yintercept = 0.048, colour = "red")
  
print(sample_size)

ggsave("sample_size.pdf")
