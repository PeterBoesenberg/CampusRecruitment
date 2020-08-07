library(data.table)
library(modules)

clean <- modules::use("clean.R")
predict <- modules::use("predict.R")


load_data <- function() {
  fread("./data/datasets_596958_1073629_Placement_Data_Full_Class.csv")
}

data <- load_data()
data <- clean$clean(data)

prediction <- predict$get_result(data, data)

# generate confusion matrix
confusionMatrix(data = prediction, reference = data$status)
