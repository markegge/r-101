# Vectors
a <- c("one", "two", "three", "four")
a[3]
a[c(2, 4)]

# Data Frames
df <- data.frame(name = c("Bobby", "Joe", "Sue", "Jane"), 
                 hair = c("Brown", "Black", "Brown", "Blonde"),
                 age = c(55, 23, 34, 35), 
                 stringsAsFactors = FALSE)

# Select ROWS by Index or Logical Vector
df[x, y]
df[1, ]

df[which(df$name == "Bobby" & df$hair == "Brown"), ]

df[1:2, ]
df[which(df$age < 35), ]

# Select COLUMNS by name or with $
df[1, c("name", "hair")]
df[1, ]$name

# omit row selector to select all
df[, "name"]
df$name

df
row.names(df) <- df$name
View(df)

df[which(df$name == "Bobby"), "name"] # Yes
df[which(row.names(df) == "Bobby"), "name"] # No

# Lists -----------------------------------------------------------------------
l <- list(item_one = c(1, 2, 3, 4), item_two = c("one", "two", "three", "four", "five"))
# access list items with [[]]
l[[1]]
l[["item_two"]]

# access elements of a list with [[]][]
# access list items with [[]]
l[[1]][3]
l[["item_two"]][3]
