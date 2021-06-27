# use with() to access data.frame objects by name
local_var <- df$hair
local_var

with() # moves df columns into the local name space, e.g. print(df$name) vs. with(df, print(name))

print(df$name) 
with(df, print(name))
with(df, df[name == "Bobby", ])

trimws("  Johnny   ") # remove white spaces on either side of a string

any(c(FALSE, FALSE, FALSE, FALSE, TRUE, FALSE)) # given a vector of logical values, return true if any value is true


# control scientific notation
# Disabling Scientific Notation
120000000
options(scipen = 12)
120000000


# Gotchas ----

# R's ifelse() function does not work like ternary operators from other languages
# In general, avoid, or use with care
ifelse(TRUE, "hello", "goodbye")

ifelse(TRUE, c(1, 2), c(3, 4))
# [1] 1

ifelse(FALSE, c(1, 2), c(3, 4))
# [1] 3

ifelse(c(FALSE, TRUE, FALSE), c(1, 2), c(3, 4))
# [1] 3 2 3


# An example:
DT <- data.table(temp = c(31, 44, 7, 39), precip = c(1.1, 0.3, 0.9, 2))

DT[, type := ifelse(temp < 32, "snow", "rain")] # DANGER! This works, but can get you into trouble
# a better way to write this:
DT[temp < 32, type := "snow"]
DT[temp >= 32, type := "rain"] # more verbose, but highly reliable

# switch statements are also weird in R and unlike other languages
# write a function with if ... else clauses instead, or use cut for numeric ranges:
table(DT$type)
DT[, type := cut(temp, 
                 breaks = c(-273, 30, 34, 150), 
                 labels = c("snow", "sleet", "rain"))] # an easy solution for 3+ values



# Read / write R objects to/from disk ---
result <- "I will want to refer back to this later."

# save() / load() preserves object names
save(result, file = "output/result-1.rda")
rm(result)
load("output/result-test.rda")


# saveRDS() / readRDS() saves only object data
saveRDS(result, "output/result-2.rds")
new_result <- readRDS("output/result-2.rds")
rm(result, new_result)
