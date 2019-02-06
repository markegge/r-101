# Intro to R

# R Origins
# - S (Bell Labs)
# - R vs. RStudio

# R - kinda a hot mess. E.g.: colnames() vs. row.names()


# R Studio
# - Using the Environment
# - Loading Files
# - Using Help
# - Using Autocomplete and Argument Suggestions

# R Style: Hadley Wickham's R Style Guide: http://adv-r.had.co.nz/Style.html

result <- TRUE # Yes
result <- T # No

# Specific functions belong in context. 
# Short, repeatedly used functions belong at the top of the R file. 
# Medium-length functions should be placed in "./R/functions.R". 
# Long-length functions belong in their own file in the "R" subfolder (e.g. "./R/my-long-function.R")

# Projects, Git, and Project Layout: https://nicercode.github.io/blog/2013-04-05-projects/ 

# Helpful Things to Know

# R always counts from one
c("a", "b", "c")[0]
c("a", "b", "c")[1]

# Show value assignment with parentheses
(k <- 1)

# Useful Functions
a <- c("a", "b", "c", "d", "c")

length(a) # number of elements or components
str(a)    # structure of an object 
class(a)  # class or type of an object
typeof(a) 
names(a)  # names
dput(a)   # prints in literal notation
table(a)  # count unique values

c(a, a, a)       # combine objects into a vector c(a, a, ...)
cbind(a, a, a) # combine objects as columns
rbind(a, a, a) # combine objects as rows 

rm(a) # delete an object

# Basic Mathmatical Functions
v <- c(1, 2, 3)
mean(v) # calculates the mean of the vector
var(v)  # calculates the variance of the vector
sum(v)
cumsum(v)  # check what this function is doing
median(v)