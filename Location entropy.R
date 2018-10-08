
# Imprort the data
geo <- read.csv("ct.csv")
View(geo)
head(geo)
summary(geo)

# Missing Values
sum(is.na(geo$NUMBER))                 #98108 Missing Value
sum(is.na(geo$DISTRICT))               #1015947 Missing Value
sum(is.na(geo$ID))                     #1015947 Missing Value


#Splitting data into Training, Validaton and Testing Dataset
set.seed(123)

train_ind <- sample(1:nrow(geo), size = floor(0.70 * nrow(geo)))

training<-geo[train_ind,]
testing<-geo[-train_ind,]


# Class Frequency
probabilities <- prop.table(table(testing$DISTRICT))
probabilities1 <- prop.table(table(testing$STREET))
probabilities2 <- prop.table(table(testing$CITY))



# Calculating Entropy of each location
location_entropy <- -sum(probabilities*log2(probabilities))  # 1.13

location_entropy1 <- -sum(probabilities1*log2(probabilities1))  # 11.64

location_entropy2 <- -sum(probabilities2*log2(probabilities2))  # 6.61



#####################################   Summary  ##################################
# Entropy is a measure of disorder in a dataset.
# lower is the entropy more uniform the model is.
# In our dataset, Region variable has the lowest location entropy.
###################################################################################
