library(data.table)
# ----------
# Fast aggregation of large data (e.g. 100GB in RAM), 
# fast ordered joins, 
# fast add/modify/delete of columns by group using no copies at all, 
# list columns, 
# friendly and fast character-separated-value read/write. 
# Offers a natural and flexible syntax, for faster development.

# DT[i, j, by]

df <- data.frame(height = sample(52:78, 10), 
                 gender = sample(c("female", "male"), 10, replace = TRUE),
                 weight = sample(100:200, 10))

DT <- as.data.table(df)

# - or -
setDT(df) # modifies in place


# data.table uses with() by default
# equivalent - select the weight of males taller than 55 inches
df[df$gender == "male", ]
DT[gender == "male"]
  
df[which(df$height > 55 & df$gender == "male"), "weight"]

with(df, df[which(height > 55 & gender == "male"), "weight"])

DT[height > 55 & gender == "male", weight]

# if you want to use a variable name, use with = FALSE
my_var <- "weight"

DT[height > 60 & gender == "male", my_var] # this doesn't work!

DT[height > 60 & gender == "male", my_var, with = FALSE] # use with = FALSE, or ..my_var
DT[height > 60 & gender == "male", ..my_var]

# Subsetting - no "j" required
DT[height > 60]

# Ordering
(setorder(DT, gender, height))
(setorder(DT, gender, -height))

# Grouping
DT[, mean(height), by = gender]

DT[, print(.SD), by = gender]

DT[, .(avg_height = mean(height),
       max_weight = max(weight)), by = gender]


# Counting using .N
DT[, .(count = .N), by = gender]


# make males taller and heavier
DT[gender == "male", height := height + 2L]
DT[gender == "male", weight := weight +  20L]

# same as above, but in one line
DT[gender == "male", `:=`(height = height + 2L, weight = weight + 20L)]


DT[, eye_color := sample(c("green", "brown", "blue"), .N, replace = TRUE)]
DT[, bmi := weight / height]
hist(DT$bmi)
DT[, bmi := NULL]


# Equimerge
sizes <- data.table(lower = c(40, 52, 62, 72),
                    upper = c(52, 62, 72, 80),
                    size = c("Tiny", "Small", "Medium", "Large"))

DT[1, height := 85]

DT[sizes, on = c("height>=lower", "height<upper")]

sizes[DT, on = c("lower<=height", "upper>height")]

# foverlaps


# a demonstration

sites <- fread("data/ADTP0102_Collection_Sites.csv") # ADT Coverage Count Location Master.
# Trim off whitespace
char_cols <- which(sapply(sites, class) == "character")
sites[, (char_cols) := lapply(.SD, trimws), .SDcols = char_cols]
rm(char_cols) # Keep things Tidy


# data.table := notation - create new columns
sites$DCTVTN_DT <- as.Date(substr(sites$DCTVTN_DT, 1, 10))
# vs
sites[, ACTVTN_DT := as.Date(substr(ACTVTN_DT, 1, 10))]

# data.table uses with() by default 
sites[, SITE_ID := paste(HWY_NUM, 
                         formatC(REF_POST_NUM * 10, width = 4, format = "d", flag = "0"), 
                         format(ACTVTN_DT, "%Y"), 
                         sep="-")]

# Subset
sites <- sites[LAT_M > 0 & ADT_MAP_ID != ""]

# Select Columns with .()
sites <- sites[, 
               .(SITE_ID, HWY_NUM, REF_POST_NUM, ADT_CNT_TYP, DCTVTN_DT, ACTVTN_DT, 
                 ADT_LOC_ID, ADT_CONTR_DESC, RD_GRP_CDE, ADT_AXL_FAC, 
                 ADT_OFCL_ID, ADT_MAP_ID, LAT_M, LNG_M)]

# Join Highway Attributes ------------------------------------------------------
ihi <- fread("data/IHI_ADT.csv")
ihi[, DT_CMPLTD := as.Date(substr(DT_CMPLTD, 1, 10))]

# if you need to reference a column with a variable, use with = FALSE)
ihi_cols <- c("HWY_NUM", "BEG_REF_POST_NUM", "END_REF_POST_NUM", 
              "LANE_NUM", "ACCUM_CNTRLN_AMT",
              "CHNL_MDN_SW", "CITY_CNSS_CDE", 
              "CMPSS_DIR_CDE","CNTRLN_MILE_AMT", 
              "CNTY_CDE", "NHS_CDE", "NUM_THRU_LANES", 
              "NUM_THRU_LANES_DIR", "TOT_NUM_LANES_DIR", 
              "TOTAL_NUM_LANES", "TRUK_ADT_TOT_NUM", 
              "TRVLWY_WDTH_AMT", "URB_LOC_CDE", 
              "YR_20_GRWTH_FAC", "BEG_REF_POST_NUM", "END_REF_POST_NUM")
ihi <- ihi[!duplicated(ihi[, ihi_cols, with = FALSE]), ihi_cols, with = FALSE]
rm(ihi_cols)

# merge sites with highway inventory - using data.table equijoin
sites <- ihi[sites,
             on = c("HWY_NUM==HWY_NUM", 
                    "BEG_REF_POST_NUM<=REF_POST_NUM", 
                    "END_REF_POST_NUM>=REF_POST_NUM")]


sites[, ID := paste(SITE_ID, ADT_CNT_TYP, sep = "-")]
sites[, REF_POST_NUM := BEG_REF_POST_NUM]

sites <- sites[, .(SITE_ID, HWY_NUM, REF_POST_NUM, LANE_NUM, 
                   CMPSS_DIR_CDE, CNTRLN_MILE_AMT, CNTY_CDE, 
                   NHS_CDE, NUM_THRU_LANES, URB_LOC_CDE,  
                   YR_20_GRWTH_FAC, BEG_REF_POST_NUM.1, 
                   END_REF_POST_NUM.1,  ADT_CNT_TYP, DCTVTN_DT, 
                   ACTVTN_DT, ADT_LOC_ID, ADT_CONTR_DESC, RD_GRP_CDE, ADT_AXL_FAC, 
                   ADT_OFCL_ID, ADT_MAP_ID, LAT_M, LNG_M)]

# Traffic Counts ---------------------------------------------------------------
counts <- fread("data/ADTP0103_Traffic_Counts.csv") # ADT count detail master.
counts <- counts[ADT_RAW_CNT > 0]
counts[, c("ADT_WTHR_COND", "ADT_CONTR_NUM_A", "ADT_CMNTS3") := NULL] # drop unused columns

counts[, 
       (which(sapply(counts, class) == "character")) := lapply(.SD, trimws), 
       .SDcols = which(sapply(counts, class) == "character")]

# Create multiple new columns using `:=`() notation and chaining DT[][]
counts[, `:=`(ADT_CNT_DT = as.Date(substr(ADT_CNT_DT, 1, 10)),
              ADT_CNT_TYP_FULL = ADT_CNT_TYP, 
              ADT_CNT_TYP = substr(ADT_CNT_TYP, 1, 1),
              ADT_CNT_DATE = ADT_CNT_DT
              )][, YEAR := format(ADT_CNT_DT, "%Y")]

# join the counts and sites by hwy_num, ref_post, type, and date
counts <- sites[counts, on = c("HWY_NUM==HWY_NUM", 
                               "REF_POST_NUM==REF_POST_NUM", 
                               "ADT_CNT_TYP==ADT_CNT_TYP", 
                               "ACTVTN_DT<=ADT_CNT_DT", 
                               "DCTVTN_DT>=ADT_CNT_DT")]

counts[, ID := paste(SITE_ID, ADT_CNT_TYP, sep = "-")]
counts[, YEAR := as.integer(YEAR)]

# aggregate - describe our dataset
count_stats <- counts[, .(Count = .N,
                          First_Year = min(YEAR),
                          Last_Year = max(YEAR),
                          Average = mean(ADJ_ADT_TOT_NUM),
                          SD = sd(ADJ_ADT_TOT_NUM)), 
                      by = ID]

# reshape
# create panel dataset
counts[, truk_pct := TRUK_ADT_TOT_NUM / ADJ_ADT_TOT_NUM]

# write the file out
fwrite(counts, file = "output/counts.csv")


truk_pcts <- dcast(counts[!is.na(SITE_ID) & YEAR >= 1990 & YEAR <= 2017], 
                   ID ~ YEAR, 
                   fun.aggregate = mean,
                   fill = NA,
                   value.var = "truk_pct")

setorder(counts, ID, -YEAR)
DT <- merge(truk_pcts, counts[!duplicated(counts$ID)], by = "ID")
