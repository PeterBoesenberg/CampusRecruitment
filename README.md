# CampusRecruitment
DataTasks for https://www.kaggle.com/benroshan/factors-affecting-campus-placement

# KNN
The task is to predict campus placement with KNN

## Data preparation
Only students, who got placed also get a salary. Therefore I removed the column "salary" from the data. 
Additionally, I converted all character columns to factors.

## Prediction
To predict column "status", I used K-NN with centered+scaled data and 10-fold cross-validation.

## Accuracy
The confusion matrix shows accuracy-values between 82% and 87%.
