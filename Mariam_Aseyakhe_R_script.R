# working directory
getwd()
# Organizing folders
dir.create("data")
dir.create("script")
dir.create("results")
# Loading CSV file
Patient_info <- read.csv(file.choose())
View(Patient_info)
# Structure
str(Patient_info)
# convert gender to factor
Patient_info$gende_fac <- as.factor(Patient_info$gender)
str(Patient_info$gende_fac)
# convert factor to numeric factor
Patient_info$gender_num <- ifelse(Patient_info$gende_fac == "Male", 1, 0)
class(Patient_info$gender_num)
Patient_info$gender_num <- as.factor(Patient_info$gender_num)
class(Patient_info$gender_num)
# convert diagnosis to factor
Patient_info$diagnosis_fac <- as.factor(Patient_info$diagnosis)
class(Patient_info$diagnosis_fac)
# convert numeric to integer
Patient_info$bmi_int <- as.integer(Patient_info$bmi)
class(Patient_info$bmi_int)
# convert character to factor
Patient_info$smoke_fac <- as.factor(Patient_info$smoker)
str(Patient_info$smoke_fac)

save.image(file ="Mariam_Aseyakhe.RData" )
