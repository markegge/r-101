
# Functions --------------------------------------------------------------------

# Function arguments may be specified by sequence, or by name

greet <- function (greeting = "Hello", name = "World") { 
  message <- paste(greeting, name)
  return(message)
}

greet()
greet(name = "Jane")
greet("'Sup")
greet("'Sup", "Jane")
greet(name = "Pardner", greeting = "Howdy")

# Return statements are optional, but should be used where they increase clarity
f1 <- function(greeting, name) { paste(greeting, name) } # Okay
f1("Hello", "Jane")

f2 <- function(greeting, name) {
  return(paste(greeting, name)) # Explicit return statement adds clarity
}
f2("Greetings", "John")


# Control Structures -----------------------------------------------------------

weather_advisor <- function(weather) {
  if (weather == "Rain") {
    return("Don't forget your umbrella!")
  } else if (weather == "Sun") {
    return("Remember your sunscreen!")
  } else {
    return("Ski time!")
  }
}

forecast <- sample(c("Rain", "Sun", "Snow"), 5, replace = TRUE)

for (weather in forecast) {
  print(weather_advisor(weather))
}

# For Loops
for (i in 1:10) {
  print(i)
}

# Note: For loops are considered poor form in R. Instead, use an apply function

# lapply applies a function to each element of a list (or vector, or matrix), returning a list
lapply(forecast, weather_advisor)

# sapply applied a function to each element of a list and returns a named vector
sapply(forecast, weather_advisor)

# lapply and sapply will pass each element to a function
l <- list(first = c(1, 2, 3),
          second = c(100, 200, 300),
          third = c(1000, 2000, 3000))

lapply(l, sum)
sapply(l, sum) 


# Applying a Function to a Row or Column

# Apply - the "R" approach of For Loops
(m <- matrix(1:20, nrow = 5, ncol = 4))

# Sum the rows
for(i in 1:nrow(m)) {
  print(sum(m[i, ])) # Slow, Inelegant
}

apply(m, 1, sum) # Fast, Elegant

# Sum the columns
apply(m, 2, sum)

# Apply with Custom Functions
m[2:4, 2:3] <- 99

# count unique values per row
apply(m, 1, function (x) { length(unique(x)) })

num_unique <- function(x) {
  return(length(unique(x)))
}
apply(m, 1, num_unique)

# More complicated functions can be defined separately, or in line
# determine mode value of each row
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
apply(m, 2, Mode)
