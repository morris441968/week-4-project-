colnames(X_train) <- features[,2]
> colnames(y_train) <- "activityId"
> colnames(subject_train) <- "subjectId"
> colnames(X_test) <- features[,2]
> colnames(y_test) <- "activityId"
> colnames(subject_test) <- "subjectId"
> colnames(activity_labels) <- c('activityId', 'activityType')
> ## merging all data into one set
  > mrg_train <- cbind(y_train, subject_train, X_train)
  > mrg_test <- cbind(y_test, subject_test, X_test)
  > setallinone <- rbind(mrg_train, mrg_test)
  > ##extracting only mean and std
    > colNames <- colnames(setallinone)
    > mean_and_std <- (grep1("activityId" , colNames) | grep1("subjectId" , colNames) | grep1("mean.." , colNames) | grep1("std.." , colNames))
    Error: could not find function "grep1"
    > mean_and_std <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
    > setformeanandstd <- setallinone[ , meand_and_std == TRUE]
    Error in `[.data.frame`(setallinone, , meand_and_std == TRUE) : 
      object 'meand_and_std' not found
    > setformeanandstd <- setallinone[ , mean_and_std == TRUE]
    > ## adding activity names to data set
      > activitynames <- merger(setformeanandstd, activityLabels, by='activityId', all.x=TRUE)
    Error: could not find function "merger"
    > activitynames <- merge(setformeanandstd, activityLabels, by='activityId', all.x=TRUE)
    Error in as.data.frame(y) : object 'activityLabels' not found
    > activitynames <- merge(setformeanandstd, activity_abels, by='activityId', all.x=TRUE)
    Error in as.data.frame(y) : object 'activity_abels' not found
    > activitynames <- merge(setformeanandstd, activity_labels, by='activityId', all.x=TRUE)
    > ##tidy data set with averages
      > sectidyset <- aggregate(. ~subjectId + activityId, setwithactivitynames, mean)
    Error in eval(expr, envir, enclos) : 
      object 'setwithactivitynames' not found
    > sectidyset <- aggregate(. ~subjectId + activityId, activitynames, mean)
    > sectidyset <- sectidyset[order(sectidyset$subjectId, sectidyset$activityId),]
    > ##writing second tidy data set in txt file
      > write.table(sectidyset, "sectidyset.txt", row.name=FALSE)
    > 