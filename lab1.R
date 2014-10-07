##### Part I: Getting Started #####
# remove any variables that are leftover in the workspace
rm(list=ls())
# fetch the BRFSS data
source('http://www.openintro.org/stat/data/cdc.R')
save(cdc, 'cdc.RData')
load('cdc.RData')

# view the names of the variables
names(cdc)
# take a look at the first few rows of the dataset
head(cdc)
# take a look at the last few rows of the dataset
tail(cdc)

## Exercise 1 ##
blah

##### Part II: Summaries and tables #####
#make a numerical summary of the weight variable
summary(cdc$weight)

# make a vector
weight.stats = c(mean=mean(cdc$weight), var=var(cdc$weight), med=median(cdc$weight))
print(weight.stats)

#make a data to summarize categorical data
table(cdc$smoke100)
#summarize by relative frequency
nrow(cdc)
length(cdc$smoke100)
table(cdc$smoke100)/nrow(cdc)
table(cdc$smoke100)/length(cdc$smoke100)
#graphical summary using relative frequency
barplot(table(cdc$smoke100)/nrow(cdc))
#another way to do such a summary, but now adding some nicer labels and using counts
smoke.table = table(cdc$smoke100)
barplot(smoke.table, xlab= 'smoked 100 cigs (1 = yes, 0 = no) in lifetime?', ylab= 'count', main='CDC Smoking Data')

## Exercise 2: ##
# (i) create a numerical summary for height and age
summary(cdc$height)
summary(cdc$age)
# (ii) compute rel freq sitn for gender and exerany
table(cdc$gender)/nrow(cdc)
table(cdc$exerany)/nrow(cdc)

# examine lifetime smoking >= 100 cigs vs. gender
table(cdc$gender, cdc$smoke100)
table(cdc$gender, cdc$smoke100)/nrow(cdc)

# create a mosaic plot
mosaicplot(table(cdc$gender, cdc$smoke100), main = 'Mosiac: Smoking by Gender', xlab= 'gender', ylab= 'smoked > 100 cigs? (1 = yes, 0 = no)')

## Exercise 3: What does the mosica plot reveal ##
# Answer: a greater number of men than women have smoked at least 100 cigs in their lifetime


##### Part III: How R thinks about data #####

#see size of data frame
dim(cdc)


# reminder: row is observation columns variables
# to see a subset specifically 567th observation, 6th column (which is weight)
#easy way
cdc[567, 6]
#hard way
head(cdc)
names(cdc)
colnames(cdc) #colnames are just variable names
head(rownames(cdc)) #rownames are just the observation number
cdc[567, 'weight'] # same thigns works only if variables are defined

# to see weights for first 10 respondents, (':' = range)
cdc[1:10, 6]
#or
cdc[1:10, 'weight']
cdc$weight[1:10]

# can tell what the sequence goes by , backwards must use negative
seq(from=1, to=10, by=1)
seq(from=10, to=1, by=-1)
#length.out determines the length of vector, useful for plotting
seq(from=1, to=10, length.out=15)

t = seq(from=1, to=1, length.out=1000)
plot(y=t^2, x=t, type= 'l')


##### Part IV: A little more on subsetting #####
#let's extract which observations are men
head(cdc$gender == 'm') # == for equal != for not equal 
head(which(cdc$gender == 'm'))
male.idx = which(cdc$gender =='m')



##### Part V: Quantitative data #####

##### Part VI: On Your Own #####