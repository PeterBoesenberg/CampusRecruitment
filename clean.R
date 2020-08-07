import(modules)
import(data.table)

export("clean")

# select columns we will use for prediction
# remove salary, since we only now it, when a candidate got placed
select_columns <- function(data) {
  cols <- names(data)
  cols <- cols[!cols %in% c("salary")]
  data[, cols, with=FALSE]
}

# convert character columns to factors
create_factors <- function(data) {
  character_cols <- names(which(sapply(data, is.character)))
  data[,(character_cols) := lapply(.SD, as.factor), .SDcols = character_cols]
}


# do everything do make our data nice and clean
clean <- function(data) {
  data <- select_columns(data)
  data <- create_factors(data)
  data
}