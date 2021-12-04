#30.11.2021
#Santa Neimane
#Dimensionality reduction techniques - data preparation script

#Read in previously prepared data
data <- read.csv("C:/Users/Localadmin_neimane/Desktop/Data Science/OpenDataScience/IODS-project/data/human.txt", sep="")
#Data set consists of “Human development” and “Gender inequality” data files.
#More information about where the original data files and script to join these data sets can be found in create_human.R file


#Explore dimensions
dim(data)
#Data set consists of 195 rows and 19 columns

#Explore structure
str(data)
#Data set describes country human development and gender inequality with corresponding index value (HDI & GNI).
#Also data set includes all the parameters that are needed to calculate the examined indexes.  
#There are some NA values in the data set
#GNI - Gross National Income - is interpreted as character.


#Transform the Gross National Income (GNI) variable to numeric value.
library(stringr)
data$GNI <- str_replace(data$GNI, pattern=",", replace ="")
data$GNI <- as.numeric(data$GNI)


#Select columns from the whole data set
keep <- c("Country", "SecEdRatioFM", "LabForceRatioFM", "ExpecYearsEd", "LifeExpec", "GNI", "MatMortRat", "AdolecBirthRate", "RepresParl")

library(dplyr)
#Code is written in the following form not to mix up with MASS select function
#Select only the specified variables
data <- dplyr::select(data, one_of(keep))


#Remove missing values
data <- na.omit(data)

#Remove the observations which relate to regions instead of countries
data <- subset(data, !(Country %in% c("World", "Europe and Central Asia", "Arab States","East Asia and the Pacific","Latin America and the Caribbean","South Asia","Sub-Saharan Africa")))

#Define the row names of the data by the country names
rownames(data) <- data$Country

#Remove the country name column from the data
data_ <- select(data, -Country)

##Save the modified data set
write.table(data_,"humanEdit.txt")


