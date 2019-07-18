trainData<-read.csv("C:/Users/himank/Documents/R/titanic/train.csv")
testData<-read.csv("C:/Users/himank/Documents/R/titanic/test.csv")
trainData$Pclass<-factor(trainData$Pclass)
trainData$Sex<-factor(trainData$Sex)
trainData$Survived<-factor(trainData$Survived)
testData$Pclass<-factor(testData$Pclass)
testData$Sex<-factor(testData$Sex)

library(caret)
names(trainData)
preobj<-preProcess(trainData[,-2],method="knnImpute")
train<-predict(preobj,trainData[,-2])
test<-predict(preobj,testData)


names(test)
model<-train(data=train,Survived~Pclass+Sex+Age+SibSp+Parch+Fare+Embarked,method='rpart')
model
pred<-predict(model,test)
predictions<-data.frame(testData$PassengerId,pred)
names(predictions)<-c("PassengerId","Survived")
predictions
write.csv(predictions,file="C:/Users/himank/Documents/R/titanic/predictionsDecisionTree.csv",row.names = F,quote = F)

