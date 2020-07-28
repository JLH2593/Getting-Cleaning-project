library(dplyr)
library(tidyr)
library(readr)
#Column names
featnam <-read.table("features.txt",stringsAsFactors = FALSE) %>%
          rename(features= V1) %>%
          transform(features = as.character(features))%>%
          select(V2)%>%
          unlist(use.names = FALSE)
#Activity names 
actnames <- read.table("activity_labels.txt")
#Test Data
list.files("test",full.names = TRUE)
xtest <- read.table("test/X_test.txt",header = FALSE,stringsAsFactors = FALSE)
         colnames(xtest) <- featnam
ytest <- read.table("test/y_test.txt") %>%
         rename(idact= V1)
stest <- read.table("test/subject_test.txt") %>%
         rename(subject= V1 )
#Train Data
list.files("train",full.names = TRUE)
xtrain <- read.table("train/X_train.txt",header = FALSE,stringsAsFactors = FALSE)
          colnames(xtrain) <- featnam
ytrain <- read.table("train/y_train.txt") %>%
          rename(idact= V1)
strain <- read.table("train/subject_train.txt") %>%
          rename(subject= V1)
#Get data together 
datatest  <- cbind(xtest,ytest,stest)
datatrain <- cbind(xtrain,ytrain,strain)
dataset   <- rbind(datatest,datatrain) 
#Extract measurements on the mean and std / descriptive activity names
dataset <- dataset[,grep("(mean\\(\\)|std\\(\\))|idact|subject",names(dataset),value = TRUE)]%>%
           merge(actnames,by.x = "idact",by.y = "V1") %>%
           select(subject,idact,V2,everything()) %>%
           rename(activity_name = V2)
#Appropriately labels the data
library(stringr)
uppernames <- str_to_title(colnames(dataset))
cleannames <- gsub("(-|\\(\\)|$-)","",uppernames)
colnames(dataset) <- cleannames
# Second independent Tidy Data
tidydata <- dataset%>%
            select(-2) %>%
            group_by(Subject,Activity_name)%>%
            summarize_each(mean)
#Create tidydata.txt
write.table(tidydata,"C:/Users/Lizzi Herrera/Desktop/Getting-Cleaning-project/secondtidydataset.txt",row.names = FALSE)
View(tidydata)  



