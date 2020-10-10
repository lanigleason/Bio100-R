#BIO178 Week 7 Code Handout

library(survival) #install 2 new packages needed for survival analysis and plotting
library(survminer) #install 2 new packages needed for survival analysis and plotting

ab_data<-read.csv("survival_MAC_CA_forBIO178.csv", header=TRUE) #read in the abalone dataset provided
head(ab_data) #make sure data loaded correctly - should be two columns, sutime and farm

surv_object<-Surv(time=ab_data$sutime) #create a survival object. this is a compiled version of the survival time data that can be interpreted by the function we will use next

fit1<-survfit(surv_object~farm, data=ab_data) #fit the Kaplan-Meier survival curves by passing the surv_object to the survfit function

summary(fit1) #this summary of the fit1 object shows, among other things, the proportion of surviving abalone at every time point for the CA and MAC farms

ggsurvplot(fit1, data = ab_data, pval=TRUE) #we can visualize the survival curve by passing the survival object to the ggsurvplot function. pval=TRUE argument plots the p-value of the log rank test that tells us whether the survival curves of the 2 farms are significantly different
