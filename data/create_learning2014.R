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

# Calculate the needed parameters
#deep  ~d_sm+d_ri+d_ue
#d_sm  ~D03+D11+D19+D27
#d_ri  ~D07+D14+D22+D30
#d_ue  ~D06+D15+D23+D31

data$d_sm <- (data$D03+data$D11+data$D19+data$D27)
data$d_ri <- (data$D07+data$D14+data$D22+data$D30)
data$d_ue <- (data$D06+data$D15+data$D23+data$D31)
data$deep <- (data$d_sm+data$d_ri+data$d_ue)

#stra ~st_os+st_tm
#st_os ~ ST01+ST09+ST17+ST25
#st_tm ~ ST04+ST12+ST20+ST28

data$st_os <- (data$ST01+data$ST09+data$ST17+data$ST25)
data$st_tm <- (data$ST04+data$ST12+data$ST20+data$ST28)
data$strata <- (data$st_os + data$st_tm)

#surf ~su_lp+su_um+su_sb
#su_lp ~SU02+SU10+SU18+SU26
#su_um ~SU05+SU13+SU21+SU29
#su_sb ~SU08+SU16+SU24+SU32
data$su_lp <- (data$SU02+data$SU10+data$SU18+data$SU26)
data$su_um <- (data$SU05+data$SU13+data$SU21+data$SU29)
data$su_sb <- (data$SU08+data$SU16+data$SU24+data$SU32)
data$surf <- (data$su_lp+data$su_um+data$su_sb)


