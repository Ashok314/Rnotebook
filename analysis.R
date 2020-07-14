library("tidyverse")
data <- read_csv("KC1_product_module_metrics.csv")
data
data[is.na(data)] = 0
data
str(data)
summary(data)
ggplot(data = data) +
  geom_bar(mapping = aes(x = CYCLOMATIC_COMPLEXITY))
boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, data)
summary(data$CYCLOMATIC_COMPLEXITY)
summary(data$ERROR_COUNT)
cc_restricted <- data %>%
  filter(CYCLOMATIC_COMPLEXITY <= 45)
boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, ylab="CC_45",cc_restricted)
summary(cc_restricted$CYCLOMATIC_COMPLEXITY)
summary(cc_restricted$ERROR_COUNT)
cc_restricted <- data %>%
  filter(CYCLOMATIC_COMPLEXITY < 16)
boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, ylab="CC_lt_16",cc_restricted)
summary(cc_restricted$CYCLOMATIC_COMPLEXITY)
summary(cc_restricted$ERROR_COUNT)
cc_restricted <- data %>%
  filter(CYCLOMATIC_COMPLEXITY < 8)
boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, ylab="CC_lt_8",cc_restricted)
summary(cc_restricted$CYCLOMATIC_COMPLEXITY)
summary(cc_restricted$ERROR_COUNT)
cc_restricted <- data %>%
  filter(CYCLOMATIC_COMPLEXITY < 4)
boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, ylab="CC_lt_4",cc_restricted)
summary(cc_restricted$CYCLOMATIC_COMPLEXITY)
summary(cc_restricted$ERROR_COUNT)
cc_restricted <- data %>%
  filter(CYCLOMATIC_COMPLEXITY < 2)
boxplot(CYCLOMATIC_COMPLEXITY~ERROR_COUNT, ylab="CC_lt_2",cc_restricted)
summary(cc_restricted$CYCLOMATIC_COMPLEXITY)
summary(cc_restricted$ERROR_COUNT)
result_1 <-boxplot(LOC_EXECUTABLE~ERROR_COUNT, ylab="loc blank",data)
summary(data$LOC_EXECUTABLE)
summary(data$ERROR_COUNT)
data_1 <- data %>%
  filter(LOC_EXECUTABLE < 100)
result_1 <-boxplot(LOC_EXECUTABLE~ERROR_COUNT, ylab="loc blank",data_1)
summary(data_1$LOC_EXECUTABLE)
summary(data_1$ERROR_COUNT)

