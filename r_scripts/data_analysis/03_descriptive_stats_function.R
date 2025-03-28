## This script contains the code to call the function descriptive_stats() to 
## estimate the mean, standard deviation, median, range and number of rows of cases

# We create a function to calculate descriptive data including meand, sd, median 
# and range
descriptive_stats <- function(x) {

  mean_value <- mean(x, na.rm = TRUE)
  
  median_value <- median(x, na.rm = TRUE)
  
  sd_value <- sd(x, na.rm = TRUE)
  
  min_value <- min(x, na.rm = TRUE)
  
  max_value <- max(x, na.rm = TRUE)
  
  n <- sum(!is.na(x))
  
  return(data.frame(mean = mean_value, median = median_value, 
                    sd = sd_value, min = min_value, 
                    max = max_value, n = n))
}

