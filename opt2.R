library(profvis)

system.time({
  
  # vectors that collect the results
  p_values <- rep(NA, iterations)
  
  # now repeatedly draw samples, analyze, and save p-value of 
  for (i in 1:iterations) {
    print(i) # show how long we have to wait ...
    BDI <- 23 - 6*treatment + rnorm(n, mean=0, sd=sqrt(117))
    res <- lm(BDI ~ treatment)
    p_values[i] <- summary(res)$coefficients["treatment", "Pr(>|t|)"]
  }
  
})