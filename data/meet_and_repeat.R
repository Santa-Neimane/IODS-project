#Santa Neimane
#07.12.2021

#Read in data
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep  ="\t", header = T)

str(BPRS)
summary(BPRS)
str(RATS)
summary(RATS)

library(dplyr)
library(tidyr)
library(ggplot2)

#Set categorical variables as factors
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)


#Change table format from wide to long
BPRSl <- pivot_longer(BPRS, week0:week8)
RATSl <- pivot_longer(RATS, WD1:WD64)


#Make new variable
BPRSl$week <- sub("week","",BPRSl$name)
#Remove variable that will not be further used
BPRSl <- select(BPRSl, -name)
#Look at dataset properties
str(BPRSl)
#Set week as numeric values
BPRSl$week <- as.integer(BPRSl$week)

#Plot the result
ggplot(BPRSl, aes(x = week, y = value, linetype = subject)) +
  geom_line() +
  scale_linetype_manual(values = rep(1:10, times=4)) +
  facet_grid(. ~ treatment, labeller = label_both) +
  theme(legend.position = "none") + 
  scale_y_continuous(limits = c(min(BPRSl$value), max(BPRSl$value)))



#Do the same steps with the RATS data set
RATSl$Time <- sub("WD","",RATSl$name)
RATSl <- select(RATSl, -name)
str(RATSl)
RATSl$Time <- as.numeric(RATSl$Time)


ggplot(RATSl, aes(x = Time, y = value, linetype = ID)) +
  geom_line() +
  scale_linetype_manual(values = rep(1:10, times=4)) +
  facet_grid(. ~ Group, labeller = label_both) +
  theme(legend.position = "none") + 
  scale_y_continuous(limits = c(min(RATSl$value), max(RATSl$value)))


#The original wide format of the data had the output value in separate column for each week/time,
#while now in the long format there is one column that specifies week/time and the second one showing the value. 


write.table(RATSl,"RATSl.txt", sep=',')
write.table(BPRSl, "BPRSl.txt", sep=',')
