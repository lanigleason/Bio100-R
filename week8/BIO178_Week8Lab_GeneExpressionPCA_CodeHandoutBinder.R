#Week 8 Gene Expression PCA Lab Code Handout
#RStudio Binder Version


library(FactoMineR) #load new package
library(factoextra) #load new package
library(ggplot2) #load package needed for plotting below

GEmatch<-read.csv("week8/GE_match2.csv") #read in gene expression csv data file
ncol(GEmatch2) #determine number of columns in gene expression data file
GEmatch.active <- GEmatch[, 1:1521] #subset data to skip the first column when creating the PCA. The first column contains population info and we do not want to use it to create the actual PCA (only the gene expression data in all other columns should be input into the PCA itself)

res.pca = PCA(GEmatch.active, scale.unit=TRUE, ncp=5, quali.sup=c(1), graph=T) #conduct the analysis to create a PCA using our subset data

fviz_pca_ind(res.pca,
             geom.ind = "point", # show points only (nbut not "text")
             col.ind = GEmatch.active$group, # color by groups
             palette = c("green", "purple", "pink", "red", "blue"),
             addEllipses = TRUE, # Concentration ellipses
             legend.title = "Treatment Groups"
) #create a pretty PCA graph, including 95% confidence interval ellipses and color coding according to treatment group
