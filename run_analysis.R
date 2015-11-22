###########################################################################
########################## Course Project #################################
###########################################################################
library(plyr)

### reading in test data sets
subject_test <- read.table("test/subject_test.txt")

x_test <- read.table("test/X_test.txt")

y_test <- read.table("test/Y_test.txt")

### reading in train data sets
subject_train <- read.table("train/subject_train.txt")

x_train <- read.table("train/X_train.txt")

y_train <- read.table("train/Y_train.txt")

### get activity names
activity <- read.table("activity_labels.txt")

y_train <- merge(y_train,activity,by="V1")
y_train <- as.data.frame(y_train[,2])

y_test <- merge(y_test,activity,by="V1")
y_test <- as.data.frame(y_test[,2])

### renaming columns
colnames(y_train) <- c("Activity")
colnames(y_test) <- c("Activity")

colnames(subject_train) <- c("Subject")
colnames(subject_test) <- c("Subject")

### reading in feature labels to select only mean and std variables
features_labels <- read.table("features.txt")

colnames(x_test) <- features_labels$V2
colnames(x_train) <- features_labels$V2

column_vector1 <- grep("mean", features_labels$V2)
column_vector2 <- grep("std", features_labels$V2)

column_vector <- sort(c(column_vector1, column_vector2))

### only get columns in x datasets that are mean and std
x_test_subset <- x_test[, column_vector]
x_train_subset <- x_train[, column_vector]

### join subjects, x data and y data for test and train data
test_data <- cbind(subject_test, x_test_subset, y_test)
train_data <- cbind(subject_train, x_train_subset, y_train)

data <- rbind(test_data, train_data)

### aggregrate data over subject and activity, return mean of each
tidy_data <- ddply(data, .(Subject, Activity), numcolwise(mean))

write.table(tidy_data, "tidy_data.txt", row.name = FALSE)



