# The script to prepare tidy data from UCI HAR Dataset (DS 3 Final)
# Assuming source data zip unpacked into working directory
require(dplyr)

# 1. Merge the training and the test sets to one data set
# Read test dataset: subjects, activities, main data
test <- cbind(read.table(file.path("./UCI HAR Dataset/test/subject_test.txt")),
              read.table(file.path("./UCI HAR Dataset/test/y_test.txt")),
              read.table(file.path("./UCI HAR Dataset/test/X_test.txt")))

# Read train dataset: subjects, activities, main data
train <- cbind(read.table(file.path("./UCI HAR Dataset/train/subject_train.txt")),
              read.table(file.path("./UCI HAR Dataset/train/y_train.txt")),
              read.table(file.path("./UCI HAR Dataset/train/X_train.txt")))

# Bind two datasets and freeing memory of partial data
full <- rbind(test, train)
rm(list = c("test", "train"))

# 2. Extract only mean and standard deviation for each measurement
features <- read.table(file.path("./UCI HAR Dataset/features.txt"),
                       colClasses = "character")
# Keep only means and stdevs features
features <- filter(features, grepl("mean\\(\\)|std\\(\\)", V2))
# Turn feature numbers into integers in order to filter columns
features$V1 <- as.numeric(features$V1)
names(full)[1:2] <- c("Subject", "Activity") # Assign this names to resolve ambiguity
# Select columns with mean and stdev
full <- select(full, c(1, 2, features$V1 + 2))

# 3. Use descriptive activity names to name the activities in the data set
activities <- read.table(file.path("./UCI HAR Dataset/activity_labels.txt"),
                         colClasses = "character")
full$Activity <- activities$V2[full$Activity]
rm(activities) # Freeing memory

# 4. Appropriately label the data set with descriptive variable names
names(full)[3:(length(features$V2) + 2)] <- features$V2 # Assign other names
rm(features) # Freeing memory

# 5. Creates second tidy data set with the average of each variable
# for each activity and each subject
avgs <- full %>%
        group_by(Subject, Activity) %>%
        summarise_each(funs(mean))

# Create output file
write.table(avgs, file = "DS3_tidy.txt", row.name=FALSE)