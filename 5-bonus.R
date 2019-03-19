# use with() to access data.frame objects by name
with() # moves df columns into the local name space, e.g. print(df$name) vs. with(df, print(name))

trimws() # remove white spaces on either side of a string

any() # given a vector of logical values, return true if any value is true


# control scientific notation
# Disabling Scientific Notation
12000000000
options(scipen = 12)
12000000000

# Gotchas
# e.g. the weird not ternary operator
ifelse(TRUE, c(1, 2), c(3, 4))
# [1] 1
ifelse(FALSE, c(1, 2), c(3, 4))
# [1] 3

m <- matrix(1:20, nrow = 5, ncol = 4)
apply(m, 2, min)

result <- TRUE

# save() / load() preserves object names
save(result, file = "output/result-1.rda")
rm(result)
load("output/result-test.rda")

# saveRDS() / readRDS() saves only object data
saveRDS(result, "output/result-2.rds")
new_result <- readRDS("output/result-2.rds")
rm(result, new_result)