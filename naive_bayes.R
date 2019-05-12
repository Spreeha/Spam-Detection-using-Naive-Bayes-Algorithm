library(naivebayes)
library(dplyr)
library(ggplot2)
library(psych)

data <- read.csv(file.choose(), header=T)
str(data)
xtabs(~label+Length, data=data)
data$Length <- as.factor(data$Length)

#Visualization
pairs.panels(data[-1])
data %>%
  ggplot(aes(x=label, y=Length, fill=label)) +
  geom_boxplot() +
  ggtitle("Box plot")

#data partition
set.seed(1234)
ind <- sample(2,nrow(data), replace=T, prob=c(0.8,0.2))
train <- data[ind ==1,]
test <- data[ind ==2,]
view(train)

#Naive Bayes Model
model <- naive_bayes(label ~ ., data = train)
model

train %>%
  filter(label == "good") %>%
  summarise(mean(Length), sd(Length))
plot(model)

#Predict
p <- predict(model,train,type='prob')
head(cbind(p,train))

#Confusion matrix
p1 <- predict(model,train)
(tab1 <- table(p1, train$Length))
1- sum(diag(tab1)) / sum(tab1) #misclassification, 

#then repeat confusion matrix for test data
  
