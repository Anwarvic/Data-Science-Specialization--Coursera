# run_analysis() Code Book

Here, I will explain all the details of the `run_analysis()` function that processes the Samsung data. the function works in the following manner:

1. Loads the `features` and `activity_labels`. `features` are some information that our wearable device collects from the user, information like "body acceleration", "body energy", ...etc. `activity_labels` are what is the activity that the user was making while recording these features. Activities like "walking", "sitting", "standing", ...etc.
2. We only interested in the features that are either the mean of  standard deviation. So, I extracted these features and put them in a variable called `mean_std_features` using regular expressions and the function `grep()`
3. Then, loads the train features data (`X_train`), then use `mean_std_features` to filter them. Also, loads the activity label of the train data `Y_train` and the subject `subject_train` which represents the user.
4. Do, the same with the test data.
5. merge the train and test data forming a data frame called `df` and give the columns names using `colnames()` function.
6. Melt the whole data depending on "subject" and "activity" values.
7. Get the mean of the melted data frame.
8. Write the output into a txt file using `write.table()` function.



## Note

The data should be in the same directory of the `run_analysis` script.