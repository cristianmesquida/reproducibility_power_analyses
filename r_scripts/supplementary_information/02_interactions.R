## This script contains the code to create the Figure 2 in Supplementary information

# Load packages
library(patchwork)
library(ggplot2)


# Simple effect
df1 <- data.frame(treatment = factor(c("supplement","placebo")),
                 effect = c(1, 0))

simple_effect <- ggplot(data = df1, aes(x = treatment, 
                                        y = effect, 
                                        group = 1)) +
  geom_line(size = 1) +
  geom_point(size = 4, fill = "white") +
  xlab(NULL) +
  scale_shape_manual(values =c (22,21)) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) +
  theme(text=element_text(size=12))


# disordinal interaction
df2 <- data.frame(treatment = factor(c("supplement",
                                       "supplement","
                                       placebo",
                                       "placebo")),
                 time = factor(c("morning",
                                 "evening",
                                 "morning",
                                 "evening")),
                 effect = c(1, 0.0, 0.0, 1))

disordinal <- ggplot(data = df2, aes(x = treatment, 
                                     y = effect, 
                                     group = time, 
                                     shape = time)) +
  geom_line(size = 1) +
  geom_point(size = 4, fill = "white") +
  xlab(NULL) +
  ylab(NULL) +
  scale_shape_manual(values=c(22,21)) +
  theme(legend.position = "none", 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) +
  theme(text=element_text(size=12))

# grand mean = (1 + 0 + 0 + 1) / 4 = 0.5
# Marginal mean for supplement:morning = 1 - (0.5 + (0.5 - 0.5) + (0.5 - 0.5)) = 0.5
# Marginal mean for supplement:evening = 0 - (0.5 + (0.5 - 0.5) + (0.5 - 0.5)) = -0.5
# Marginal mean for placebo:morning = 0 - (0.5 + (0.5 - 0.5) + (0.5 - 0.5)) = -0.5
# Marginal mean for placebo:evening = 1 - (0.5 + (0.5 - 0.5) + (0.5 - 0.5)) = 0.5

# Cohen's f:
sqrt(((0.5)^2 +(-0.5)^2 + (-0.5)^2 + (0.5)^2)/4)/2 
# Cohen's f = 0.25 or Cohen's d of 0.25*2 = 0.5

# ordinal interaction
df3 <- data.frame(treatment = factor(c("supplement",
                                       "supplement",
                                       "placebo",
                                       "placebo")),
                 time = factor(c("morning",
                                 "evening",
                                 "morning",
                                 "evening")),
                 effect = c(1, 0.0, 0.0, 0))

ordinal <- ggplot(data = df3, aes(x = treatment, 
                                  y = effect, 
                                  group = time, 
                                  shape = time)) +
  geom_line(size = 1) +
  geom_point(size = 4, fill = "white") +
  xlab(NULL) +
  ylab(NULL) +
  scale_shape_manual(values=c(22,21)) +
  theme(legend.position = "none", 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) +
  theme(text=element_text(size=12))

# grand mean = (1 + 0 + 0 + 0) / 4 = 0.25
# Marginal mean for supplement:morning = 1 - (0.25 + (0.5 - 0.25) + (0.5 - 0.25)) = 0.25
# Marginal mean for supplement:evening = 0 - (0.25 + (0.5 - 0.25) + (0 - 0.25)) = -0.25
# Marginal mean for placebo:morning = 0 - (0.25 + (0 - 0.25) + (0.5 - 0.25)) = -0.25
# Marginal mean for placebo:evening = 0 - (0.25 + (0. - 0.25) + (0 - 0.25)) = 0.25

# Cohen's f: 
sqrt(((0.25)^2 +(-0.25)^2 + (-0.25)^2 + (0.25)^2)/4)/2 
# Cohen's f = 0.125 or Cohen's d of 0.125*2 = 0.25

# attenuated interaction
df4 <- data.frame(treatment = factor(c("supplement",
                                       "supplement",
                                       "placebo",
                                       "placebo")),
                 time = factor(c("morning",
                                 "evening",
                                 "morning",
                                 "evening")),
                 effect = c(1, 0.6, 0.0, 0.0))

attenuated <- ggplot(data = df4, aes(x = treatment, 
                                     y = effect, 
                                     group = time, 
                                     shape = time)) +
  geom_line(size = 1) +
  geom_point(size = 4, fill = "white") +
  xlab(NULL) +
  ylab(NULL) +
  scale_shape_manual(values=c(22,21)) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) +
  theme(text=element_text(size=12))

# grand mean = (1 + 0.6 + 0 + 0) / 4 = 0.4
# Marginal mean for supplement:morning = 1 - (0.4 + (0.8 - 0.4) + (0.5 - 0.4)) = 0.1
# Marginal mean for supplement:evening = 0.6 - (0.4 + (0.8 - 0.4) + (0.3 - 0.4)) = -0.1
# Marginal mean for placebo:morning = 0 - (0.4 + (0 - 0.4) + (0.5 - 0.4)) = -0.1
# Marginal mean for placebo:evening = 0 - (0.4 + (0. - 0.4) + (0.3 - 0.4)) = 0.1

# Cohen's f = 
sqrt(((0.1)^2 +(-0.1)^2 + (-0.1)^2 + (0.1)^2)/4)/2
# Cohen's f = 0.05 or Cohen's d of 0.05*2 = 0.1


# Cohen's f = sqrt(((0.25)^2 +(-0.25)^2 + (-0.25)^2 + (0.25)^2)/4)/2 = 0.125
# Use patchwork to combine and plot only 1 legend without title.
combined_figures <- simple_effect | ordinal | disordinal | attenuated & 
                    plot_layout(axes = "collect", 
                                guides = "collect") 

combined_figures <- combined_figures + plot_annotation(tag_levels = c('a', '1'))

ggsave(here("figures","figures_interactiont.png"), width = 20, height = 5, combined_figures)

