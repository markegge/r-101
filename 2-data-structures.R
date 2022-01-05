# Data Types and Data Structures


# ######################
#       Data Types
# ######################

class(1234) # numeric

# classes can have multiple types
typeof(1234L)

typeof(as.integer(1234))
typeof(as.double(1234L))
typeof(as.character(1234))

class(TRUE) # logical

class("1234") # character

class(factor(c("a", "b", "c", "d"))) # factor

a_factor <- as.factor(a)
class(a_factor)
as.integer(a_factor)

# ##########################
#       Data Structures
# ##########################


# Scalar
1 

# "None" (different than NaN)
NA 

# Vector (of numerics)
c(1, 2, 3, 4) 

# Vector (of character class)
c(1, "2", 3, NA)

# Range
1:4

# Factors - Internal Integer Representation of Character strings
(f <- factor(c("blue", "green", "red")))
levels(f)
as.numeric(factor(c("blue", "green", "red")))

# Factors no longer offer performance advantages over character strings
# Due to legacy reasons, R often converts character vectors to factors by default.

# Factors should be avoided unless explicitly needed, e.g.:
# - categorical axis scales
# - categorical model variables
# - translating ranges to values
cut(c(5, 2, 6, 7, 9, 1), breaks = c(1, 4, 7, 10), labels = c("Poor", "Fair", "Good"), right = FALSE)

# Control this behavior with stringsAsFactors = FALSE
read.csv("data/example.csv", stringsAsFactors = FALSE)


# Lists
list(item_one = c(1, 2, 3, 4),
     item_two = c("one", "two", "three", "four", "five"))

# Mark's advice: don't use lists unless you have a very compelling reason

# Matrices - 2 Dimensions
matrix(1:20, nrow = 5, ncol = 4)

# Arrays - 2 or more Dimensions
array(1:40, dim = c(5, 4, 2))

# Data Frames - Combine Multiple Primitive Classes in One "Matrix"
data.frame(names = c("Bobby", "Joe", "Sue"),
           ages = c(55, 23, 34))
