library("tidyverse")
data <- read_csv("KC1_product_module_metrics.csv")
data
data[is.na(data)] = 0
model_lm <- lm(ERROR_COUNT~CYCLOMATIC_COMPLEXITY, data)
summary(model_lm)
data$pred<-predict(model_lm,newdata = data)# These are the predicted values
str(data$pred)
summary(data$pred)
library(DMwR)
regr.eval(data$CYCLOMATIC_COMPLEXITY,data$pred)
plot(model_lm$residuals)
predict(model_lm,newdata = data.frame(CYCLOMATIC_COMPLEXITY=c(5,30,45)))

