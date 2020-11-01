#Week 10 Sex-Biased Dispersal Lab Code Handout
#RStudio Binder Version


library(hierfstat) #load new package

data(crocrussula) #access data we will use, which is already a part of the hierfstat package

head(crocrussula) #provides an overview of what the data looks like. $genot contains the microsatellite allele info for different loci (contained in different columns), and $sex indicates whether each individual in the dataset is male (M) or female (F) 

aic<-AIc(crocrussula$genot) #use the AIc function to calculate corrected assignment indices for each individual in the dataset

boxplot(aic~crocrussula$sex, col=c("red", "green")) #create a boxplot of AIc values for females vs. males to visualize results. colors can be adjusted to whatever you want! :)

sexbias.test(crocrussula$genot,crocrussula$sex) #conduct a statistical test to determine whether the AIc values are significantly different for females vs. males. The resulting p.value tells us whether the AIc is significantly lower for one sex vs. the other. Remember negative AIc values indicate immigrants who came from other populations, and thus the sex with more negative AIc values is the one dispersing.