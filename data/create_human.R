#Read in the datasets
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#More information about the datasets can be found here: http://hdr.undp.org/en/content/human-development-index-hdi
#and here:http://hdr.undp.org/sites/default/files/hdr2015_technical_notes.pdf


#Short description of the datasets

#hd dataset
dim(hd)
#consists of 195 rows and 8 columns
str(hd)
#Dataset consists of variables to calculate The Human Development Index (HDI) which 
#is a summary measure of average achievement in key dimensions of human development: 
#a long and healthy life, being knowledgeable and have a decent standard of living.
summary(hd)
#There are 7 missing values in the HDI.Rank. The same is true for GNI. 
#These seven rows contain otherwise the averages for continents.
#Human development index varies from 0.35 till 0.94. 
#Mean Life expectancy at birth is 73 years. Expected years of varies from 4.1 till 20.2. 
#Similar range of variability can be seen for years of education (1.4 till 13.10) 



#gii data set
dim(gii)
#consists of 195 rows and 10 columns
str(gii)
#The second dataset describes Gender Inequality Index (gii)
#and looks at three main aspects: health, empowerment, labor market.
#Dataset is very similar to the previously described hd one.
#It consists of GII values for different countries and parameters to calculate the GII.
summary(gii)
#Again we have seven missing values for the GII.
#In this dataset there are a large number of missing values for other parameters as well.
#Gender.Inequality.Index..GII.(33), Maternal.Mortality.Ratio (10),
#Population.with.Secondary.Education..Female/Male (26), 
#Labour.Force.Participation.Rate..Female/Male (11).
#The GII varies from 0.0160 - 0.7440. 
#Maternal Mortality ratio varies from 1 -1100.
#There are countries where no women are represented in the parliament. 
#On average there are less women with secondary education (54.8) than men (60.29)
#On average more men (74.7) are in the labour force than women (52.6).

#Renaming variables

names(hd)[names(hd) == "HDI.Rank"] <- "HDIrank"
names(hd)[names(hd) == "Human.Development.Index..HDI."] <- "HDI"
names(hd)[names(hd) == "Life.Expectancy.at.Birth"] <- "LifeExpec"
names(hd)[names(hd) == "Expected.Years.of.Education"] <- "ExpecYearsEd"
names(hd)[names(hd) == "Mean.Years.of.Education"] <- "YearsEd"
names(hd)[names(hd) == "Gross.National.Income..GNI..per.Capita"] <- "GNI"
names(hd)[names(hd) == "GNI.per.Capita.Rank.Minus.HDI.Rank"] <- "GNIrank-HDIRank"


names(gii)[names(gii) == "GII.Rank"] <- "GIIrank"
names(gii)[names(gii) == "Gender.Inequality.Index..GII."] <- "GII"
names(gii)[names(gii) == "Maternal.Mortality.Ratio"] <- "MatMortRat"
names(gii)[names(gii) == "Adolescent.Birth.Rate"] <- "AdolecBirthRate"
names(gii)[names(gii) == "Percent.Representation.in.Parliament"] <- "RepresParl"
names(gii)[names(gii) == "Population.with.Secondary.Education..Female."] <- "SecEdF"
names(gii)[names(gii) == "Population.with.Secondary.Education..Male."] <- "SecEdM"
names(gii)[names(gii) == "Labour.Force.Participation.Rate..Female."] <- "LabForceF"
names(gii)[names(gii) == "Labour.Force.Participation.Rate..Male."] <- "LabForceM"



#Create new variables
#ratio of Female and Male populations with secondary education in each country
gii$SecEdRatioFM <- gii$SecEdF/gii$SecEdM


#ratio of labour force participation of females and males 
gii$LabForceRatioFM <- gii$LabForceF/gii$LabForceM

#Join together the two datasets using the variable Country as the identifier.
human <- merge(gii, hd, by = "Country")

#Save the joined and modified data set
write.table(human,"human.txt")
