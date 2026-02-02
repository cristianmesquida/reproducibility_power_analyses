## This script contains the code to create the Figure 1 in Supplementary file.

# Load packages
library(patchwork)
library(ggplot2)
library(here)

# Simulate data
df <- data.frame(
  intervention = factor(c("normoxia", "moderate hypoxia", "severe hypoxia",
                          "normoxia", "moderate hypoxia", "severe hypoxia",
                          "normoxia", "moderate hypoxia", "severe hypoxia",
                          "normoxia", "moderate hypoxia", "severe hypoxia")),
  time = factor(c("Bout 1", "Bout 1", "Bout 1",
                  "Bout 2", "Bout 2", "Bout 2",
                  "Bout 3", "Bout 3", "Bout 3",
                  "Bout 4", "Bout 4", "Bout 4"), 
                levels = c("Bout 1", "Bout 2", "Bout 3", "Bout 4")),
  effect = c(845, 812, 790, 804, 795, 783, 751, 755, 739, 705, 705, 685))

# Plot with color-blind friendly palette
ggplot(data = df, aes(x = time, 
                       y = effect, 
                       group = intervention, 
                       color = intervention)) +
  geom_line(size = 1) +
  geom_point(size = 4, fill = "white") +
  xlab("Number of bouts") +
  ylab("Power output (W)") +
  scale_y_continuous(limits = c(600, 900), 
                     breaks = seq(600, 900, by = 50)) +
  theme(legend.title = element_blank(),  
        legend.position = "right", 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) +
  theme(text = element_text(size = 10))
