###USING LOGISTIC REGRESSION TO PREDICT SUVIVAL IN TITANIC DATASET

#read train and test datasets
trainData<-read.csv("C:/Users/himank/Documents/R/titanic/train.csv")
testData<-read.csv("C:/Users/himank/Documents/R/titanic/test.csv")
#exploratory analysis
nrow(trainData)
nrow(testData)
str(trainData)
any(trainData$Survived!=0&trainData$Survived!=1)
any(is.na(trainData))
#data wrangling
trainData$Pclass<-factor(trainData$Pclass)
trainData$Sex<-factor(trainData$Sex)
trainData$Survived<-factor(trainData$Survived)
testData$Pclass<-factor(testData$Pclass)
testData$Sex<-factor(testData$Sex)
testData$Survived<-factor(testData$Survived)

##imputing missing values
library(mice)
init<-mice(trainData,maxit=0)
predM<-init$predictorMatrix
predM[,c("PassengerId", "Name","Ticket","Cabin")]=0  
imp<-mice(trainData,m=5,predictorMatrix = predM)
trainData<-complete(imp)
##logistic models
names(trainData)
fit3<-glm(data=trainData,Survived~Pclass+Sex+Age,family="binomial")
summary(fit3)
fit2<-glm(data=trainData,Survived~Pclass+Sex+Age+SibSp+Parch,family="binomial")
summary(fit2)
fit<-glm(data=trainData,Survived~Pclass+Sex+Age+SibSp+Parch+Fare+Embarked,family="binomial")
summary(fit)
anova(fit3,fit2,fit)
#survival vs age
cdplot(trainData$Survived~trainData$Age)

length(trainData$Survived)
names(trainData)
#calculating predictions through model fit:
pred<-c(factor(unname(predict(fit,trainData)>0.5)))-1
actual<-trainData$Survived
sum(pred==actual)/nrow(trainData)
##81% accuracy in train data.

#imputing missing in test dataset
init<-mice(maxit=0,testData)
predM<-init$predictorMatrix
predM[,c("PassengerId", "Name","Ticket","Cabin")]=0
imp<-mice(m=5,testData,predictorMatrix = predM)
testData<-complete(imp)

#test data survival predictions
Survived<-c(factor(unname(predict(fit,testData)>0.5)))-1
predictions<-data.frame(testData$PassengerId,Survived)
names(predictions)<-c("PassengerId","Survived")

#writing output file
write.csv(predictions,file="C:/Users/himank/Documents/R/titanic/predictions.csv",row.names = F,quote = F)

##This model generates a test model accuracy of 0.77033
