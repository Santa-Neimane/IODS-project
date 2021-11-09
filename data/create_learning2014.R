# Author: Santa Neimane
# Date: 09.11.2021
# Regression and model validation tasks /learning2014 data/ 

data <- read.table(url("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt"), header = TRUE)
str(data)
head(data)
# Data consists of 60 columns and 183 rows. 
# Data shows points survey responses and includes participants age and gender info.

data$gender <- as.factor(data$gender) #Set gender as a factor to see statistics
summary(data)
# Mean age of the participant is 26 years.  
# Youngest was 17 years old, whilst oldest was 55 years old. 
# Most (122) participants were female. 