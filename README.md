# The script to create tidy dataset from the Human Activity Recognition Using Smartphones Dataset
### See CodeBook.md for more deatails on the datasets and variables

The provided R script processes provded dataset stored in the current working directory.
As an output the "DS3_tidy.txt" file is put into current working directory.
The script is stored in a single file named "run_analysis.R".
The script uses "dplyr" package to manipulate with data.

## Implemented procedure
1. Read train and test data components from files according to initial dataset archive folder structure.
2. Bind data from different files: subjects, activites, signal variables.
3. Bind train and test datasets together.
4. Read features names from file.
5. Filter features names in order to get variables with mean() and std() - means and standard deviations respectively. Regular epxression is used to filter by names.
6. Name Subject and Activity columns (now to resolve names ambiguity caused by initial binding).
7. Select columns with means and standard deviations only.
8. Read activities names and replace codes in the Activity column.
9. Assign names to the rest of the columns.
10. Group by subjects and activities.
11. Calculate averages for means and standard deviations.
12. Write file with tidy data.