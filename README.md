# Rnotebook
## Open file "metric_notebook.Rmd" in R Studio

# Report as follows: 

---
title: "R Notebook- Analysis and prediction on NASA KC1"
output:
  html_notebook: default
bibliography: bibliography.bib
---
                              
Resource 
• NASA KC1

Setup :
 Rtool and Rstudio

# **Analysis** 

##  Finding 1

### Load data

```{r}
  library("tidyverse")
data <- read_csv("KC1_product_module_metrics.csv")

```
### view data
```{r}
data
```
### Cleaning data 
```{r}
data[is.na(data)] = 0
data
```

### Structure and data types of the data 
```{r}
str(data)
```

### summary of the data 
  summary provides the various statistical information about the data like mean, median, min , max values. 
```{r}
summary(data)
```
### Plotting  Cyclomatic Complexity

```{r}
ggplot(data = data) + 
  geom_bar(mapping = aes(x = CYCLOMATIC_COMPLEXITY))
```

### Relation among cyclomatic Complexity  and Error Count
```{r}
boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, data)
```
```{r}
summary(data$CYCLOMATIC_COMPLEXITY)
summary(data$ERROR_COUNT)
```

### Analysis by filtering the CC value 
  
  for CC < 45
```{r}
cc_restricted <- data %>% 
  filter(CYCLOMATIC_COMPLEXITY <= 45)
```
 Plot
``` {r}
 boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, ylab="CC_45",cc_restricted)
```
```{r}
summary(cc_restricted$CYCLOMATIC_COMPLEXITY)
summary(cc_restricted$ERROR_COUNT)
```
  for CC < 16
```{r}
cc_restricted <- data %>% 
  filter(CYCLOMATIC_COMPLEXITY < 16)
```
 Plot
``` {r}
 boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, ylab="CC_lt_16",cc_restricted)
``` 
```{r}
summary(cc_restricted$CYCLOMATIC_COMPLEXITY)
summary(cc_restricted$ERROR_COUNT)
```
  for CC < 8
```{r}
cc_restricted <- data %>% 
  filter(CYCLOMATIC_COMPLEXITY < 8)
```
 Plot
``` {r}
 boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, ylab="CC_lt_8",cc_restricted)
```
```{r}
summary(cc_restricted$CYCLOMATIC_COMPLEXITY)
summary(cc_restricted$ERROR_COUNT)
```
  for CC < 4
```{r}
cc_restricted <- data %>% 
  filter(CYCLOMATIC_COMPLEXITY < 4)
```
 Plot
``` {r}
 boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, ylab="CC_lt_4",cc_restricted)

```
```{r}
summary(cc_restricted$CYCLOMATIC_COMPLEXITY)
summary(cc_restricted$ERROR_COUNT)
``` 
  for CC < 2
```{r}
cc_restricted <- data %>% 
  filter(CYCLOMATIC_COMPLEXITY < 2)
```
 Plot
``` {r}
 boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, ylab="CC_lt_2",cc_restricted)
```
```{r}
summary(cc_restricted$CYCLOMATIC_COMPLEXITY)
summary(cc_restricted$ERROR_COUNT)
```
### Result of Analysis

  **From above analysis we can see the relation between Cyclomatic Complexity of module and and the error count in the same module.**
  **Above plots and the summary of the plots shows changing the error count on varying cyclomatic complexity.**

  
## Finding 2 

### Relation of LOC_BLANK, LOC_EXECUTABLE, LOC_CODE_AND_COMMENT,LOC_COMMENT with ERROR_COUNT

Same procedure as finding_1. 

  Plotting Each variables with ERROR_COUNT
  Analysis of the summary
  
  Sample Run
```{r}
result_1 <-boxplot(LOC_EXECUTABLE~ERROR_COUNT, ylab="loc blank",data)
```
```{r}
summary(data$LOC_EXECUTABLE)
summary(data$ERROR_COUNT)
```
```{r}
data_1 <- data %>% 
  filter(LOC_EXECUTABLE < 100)
result_1 <-boxplot(LOC_EXECUTABLE~ERROR_COUNT, ylab="loc blank",data_1)
```  
  
```{r}
summary(data_1$LOC_EXECUTABLE)
summary(data_1$ERROR_COUNT)
```

Similarly for rest of the variables, LOC_BLANK, LOC_CODE_AND_COMMENT,LOC_COMMENT.

### Result of finding 2
  **There is less relation among these variables and ERROR_COUNT as compared to Cyclomatic complexity and Design Complexity values.**
  **These values has small affect on the defect Count of the module.** 
  
  
  
  
  

# **Prediction**
  REF: https://www.rdocumentation.org/packages/car/versions/3.0-8/topics/Predict

Linear Model 
```{r}

model_lm <- lm(ERROR_COUNT~CYCLOMATIC_COMPLEXITY, data)

summary(model_lm)
```


New predicted Values And summary 
```{r}
data$pred<-predict(model_lm,newdata = data)# These are the predicted values
str(data$pred)
```
summary of predicted value
```{r}
summary(data$pred)
```

Install Package for Evaluation of the Model
  #"mae": mean absolute error
  #"mse": mean squared error,
  #"rmse": root mean squared error
```{r}
library(DMwR)
regr.eval(data$CYCLOMATIC_COMPLEXITY,data$pred)

```
```{r}
plot(model_lm$residuals)
```
## Prediction on new value of CC

```{r}
predict(model_lm,newdata = data.frame(CYCLOMATIC_COMPLEXITY=c(5,30,45)))
```
  
## Results

**Result of the prediction can be seen with less accuracy.** 
**With altering the parameters in the lm accuracy may be improved.**


## References
  http://promise.site.uottawa.ca/SERepository/datasets-page.html
  
  

