import(modules)
import(caret)
import(stats)

export("get_result")

train_knn <- function(data) {
  train(
    status ~ .,
    data = data,
    method = "knn",
    trControl = trainControl(method = "cv", number = 10),
    preProcess = c("center", "scale"),
    tuneGrid = expand.grid(k = seq(1, 31, by = 2))
  )
}

# logistic model tree scores 96.28% accuracy with 9 iterations
train_lmt <- function(data) {
  train(
    status ~ .,
    data = data,
    method = "LMT",
    trControl = trainControl(method = "cv", number = 10),
    preProcess = c("center", "scale"),
    tuneGrid = expand.grid(iter = 9)
  )
}

# model traning with knn and cross validation
train_model <- function(data) {
  train_lmt(data)
}

# train and predict
get_result <- function(train, test) {
  model <- train_model(train)
  prediction <-  predict(model, test)
  prediction
}