#Santa Neimane
#Date: 15.11.2021
#Data available at: https://archive.ics.uci.edu/ml/machine-learning-databases/00320/
#Data originates from a study examining student grades and other factors in Portuguese schools
#Data was collected by school reports and questionnaires.


#Read in the data
datamat <- read.csv(file = 'student-mat.csv', sep=';')
datapor <- read.csv(file = 'student-por.csv', sep=';')

#Explore the data
head(datamat)
head(datapor)
str(datamat)
str(datapor)
#StudentMat file consist 395 observations, StudentPor of 649.
#Otherwise the data structure seem the same. 
#Shows three grades (G1, G2, G3) and number of possible affecting factors. 


#Set up new id
library(dplyr)
por_id <- datapor %>% mutate(id=1000+row_number()) 
math_id <- datamat %>% mutate(id=2000+row_number())

#Set columns that vary
free_cols <- c("id","failures","paid","absences","G1","G2","G3")
# The rest of the columns to join datasets
join_cols <- setdiff(colnames(por_id),free_cols)

#Join files
math_por <- inner_join(datamat, datapor, by = join_cols, suffix = c(".math", ".por"))

#Exploring the structure of the joined datafile
summary(math_por)
str(math_por)
dim(math_por)
#370 observations, 39 columns


#Calculate average alcohol use
math_por$alc_use = (math_por$Dalc + math_por$Walc) / 2

#create new logical column 'high_use' 
#which is TRUE for students for which 'alc_use' is greater than 2
math_por$high_use = math_por$alc_use > 2

#Glimpse at the joined and modified data
View(math_por)

#Save the joined and modified data set
write.table(math_por,"JoinedMathPorData.txt")
