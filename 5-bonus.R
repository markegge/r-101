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

# Gotchas

# R's weird not ternary operator
ifelse(TRUE, "hello", "goodbye")

ifelse(TRUE, c(1, 2), c(3, 4))
# [1] 1

ifelse(FALSE, c(1, 2), c(3, 4))
# [1] 3

ifelse(c(FALSE, TRUE, FALSE), c(1, 2), c(3, 4))
# Can you guess?


DT <- data.table(temp = c(31, 44, 7, 39), precip = c(1.1, 0.3, 0.9, 2))

DT[, type := ifelse(temp < 32, "snow", "rain")] # DANGER! This works, but can get you into trouble

DT[temp < 32, type := "snow"]
DT[temp >= 32, type := "rain"] # more verbose, but highly reliable


table(DT$type)
DT[, type := cut(temp, 
                 breaks = c(-273, 30, 34, 150), 
                 labels = c("snow", "sleet", "rain"))] # an easy solution for 3+ values




result <- TRUE

# save() / load() preserves object names
save(result, file = "output/result-1.rda")
rm(result)
load("output/result-test.rda")


# saveRDS() / readRDS() saves only object data
saveRDS(result, "output/result-2.rds")
new_result <- readRDS("output/result-2.rds")
rm(result, new_result)
