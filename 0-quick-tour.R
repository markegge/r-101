# a quick tour demonstrating the power and versability of R

library(datasets)
library(data.table)
library(ggplot2)

data(iris)
View(iris)
summary(iris)
table(iris$Species)
hist(iris$Petal.Length)

# convert the iris data.frame to a more powerful data.table
DT <- as.data.table(iris)

# filter to virginica records
DT[Species == "virginica"]

# visually explore the dataset
ggplot(DT, aes(x = Species, y = Petal.Length)) + 
  geom_boxplot()

ggplot(DT, aes(x = Petal.Length, y = Sepal.Length, color = Species)) + 
  geom_point()

# estimate average petal lenght by species using linear regression
summary(lm(Petal.Length ~ Species, DT))

# identify species of unknown flowers
library(rpart)
library(rpart.plot)
set.seed(1234) # for reproducible results
sample_ids <- sample(nrow(DT), 15)

train <- DT[-sample_ids]
test <- DT[sample_ids]
test[, actual_species := Species]
test$Species <- NA

model <- rpart(Species ~ ., train)
rpart.plot(model)

test[, predicted_species := predict(model, newdata = test, type = "class")]
