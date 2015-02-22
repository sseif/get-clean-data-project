# 1. Merge training and test datasets & 4. Label the datasets with descriptive file names
# ========================================================================================
# Forming subject ID column
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subject_training <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subject_ID <- rbind(subject_test, subject_training)
colnames(subject_ID) <- 'subject_ID'

# Forming activity label column
labels_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
labels_training <- read.table('./UCI HAR Dataset/train/y_train.txt')
activity_label <- rbind(labels_test, labels_training)
colnames(activity_label) <- 'activity'

# Forming features vector columns
features_vector_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
features_vector_training <- read.table('./UCI HAR Dataset/train/X_train.txt')
features_vector <- rbind(features_vector_test, features_vector_training)
features <- read.table('./UCI HAR Dataset/features.txt')[ , 2]
colnames(features_vector) <- features

# Forming the merged dataset
dataset <- cbind( subject_ID, activity_label, features_vector)

# 2. Extract only mean and standard deviation for each measurement
# ================================================================
columns_to_keep =c()
for ( name in names(dataset) ){
  if ( ( ( name == 'subject_ID' | name == 'activity' ) |
         ( grepl('mean()', name) ) |
         ( grepl('std()', name) ) ) &
       !( grepl('meanFreq()', name) ) ){
    columns_to_keep <- c(columns_to_keep, name)
  }
}

dataset_filtered <- subset( dataset, select= columns_to_keep )

# 3. Use descriptive activity names
# =================================
activity_desc <- read.table( file = './UCI HAR Dataset/activity_labels.txt')
dataset_filtered$activity <- sapply( dataset_filtered$activity, FUN = function(x) x <- activity_desc[x, 'V2'] )

# 4. Create a dataset with the average of each variable for each activity and each subject
# ========================================================================================
measurements_mean<- data.frame()
ids <- c()
activities <- c()
for ( id in 1:30 ){
  for ( act in activity_desc[, 'V2'] ){
    measurements_mean <- rbind( measurements_mean, apply( dataset_filtered[ dataset_filtered$subject_ID ==id & dataset_filtered$activity  == act, c(3: length(dataset_filtered)) ], 2,  mean ) )
    ids <- c(ids, id)
    activities <- c(activities, act)
  }
}
tidy_df <- data.frame( ids, activities, measurements_mean, stringsAsFactors = F)
colnames(tidy_df) <- c( 'subject_id', 'activity', sapply( columns_to_keep[3: length(columns_to_keep)], FUN = function(x) paste('Mean(', x, ')', sep = '') ) )

# Saving the data
# ===============
write.table( x = tidy_df, file = './dataset.txt', row.names = F)

