# Titanic-Survival-Prediction-using-GLM
Machine Learning From Disaster: Titanic Dataset Survival Prediction using Logistic Regression.
Contains 3 Logistic Regression models with nested regressors.
The missing values are imputed using MICE R PACKAGE.
The Final model gave the test dataset accuracy of 0.77033
FILES:
train.csv : training data containing 891 rows and 12 columns. 
test.csv: testing data containing 418 rows and 11 columsns.
gender_submission.csv: an example file showcasing how the structure of the output file needs to be.
titanicPrediction.R:R file containing actual code.
predictions.csv: the output file containing predicted suvival for test dataset.

COLUMNS:
PassengerId : type should be integers
Survived : Survived or Not
Pclass : Class of Travel
Name : Name of Passenger
Sex : Gender
Age : Age of Passengers
SibSp : Number of Sibling/Spouse aboard
Parch : Number of Parent/Child aboard
Ticket: Ticket number
Fare : Amount of fare
Cabin : Cabin alloted
Embarked : The port in which a passenger has embarked. C - Cherbourg, S - Southampton, Q = Queenstown

THANKS
