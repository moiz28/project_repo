mydatav_tomcat<-read.csv("C:\\Users\\umroot\\Desktop\\cloud_scale\\processed_metrics_virtual1min.csv")
mydatav_tomcat_modforoldp<-read.csv("C:\\Users\\umroot\\Desktop\\cloud_scale\\virtual_1min\\processed_metrics_virtual1min_mod.csv")
mydatap_tomcat_old<-read.csv("C:\\Users\\umroot\\Desktop\\cloud_scale\\physical_everymin_unique\\physical_everymin_unique_java_(hasall) (unmoded old).csv")
mydatap_tomcat_mod<-read.csv("C:\\Users\\umroot\\Desktop\\cloud_scale\\physical_everymin_unique\\physical_everymin_unique_java_(hasall).csv")
mydatavr1<-read.csv("C:\\Users\\umroot\\Desktop\\cloud_scale\\virtual_reference1_1min\\java_processed_virtualref1_1min.csv")

datau_vc<-read.csv("C:\\Users\\umroot\\Desktop\\datau_varclus.csv")

datau<-read.csv("C:\\Users\\umroot\\Desktop\\physical_everymin_unique_java_(hasall).csv")


data4<-read.csv("C:\\Users\\umroot\\Desktop\\physical_4mins.csv")

mydatap_wamp <- read.csv("C:\\Users\\umroot\\Desktop\\ds2\\physical_inventory_2min\\physical_processed_hasall_2min.csv")
mydatap_wamp_mod <- read.csv("C:\\Users\\umroot\\Desktop\\ds2\\physical_inventory_2min\\physical_processed_hasall_2min_mod.csv")
mydatav_wamp_old <- read.csv("C:\\Users\\umroot\\Desktop\\ds2\\virt_2min\\virtual_base_2min_hasall.csv")
mydatav_wamp <- read.csv("C:\\Users\\umroot\\Desktop\\ds2\\virtual_2min_modsqlinventorychange\\virtual_2min_processed_hasall.csv")
mydatav_wamp_mod <- read.csv("C:\\Users\\umroot\\Desktop\\ds2\\virtual_2min_modsqlinventorychange\\virtual_2min_processed_hasall_mod.csv")

library(BiodiversityR)
library(caret)
library(Hmisc)
library(e1071)
library(hydroGOF)
library(robustHD)
library(vegan)
library(corpcor)
library(Shrinkage)
library(plotly)
library(lawstat)
library(glmnet)
library(lars)
#-----------------------------------------------------------------


reduce_counters <- function(inputdata)
{
  drops <- c()
  u=sapply(inputdata, function(x) length(unique(x)))
  countername=names(inputdata)
  counterunique=as.vector(as.matrix(u))
  
  for (i in 1:length(counterunique)) 
  {
    v=counterunique[i]
    
    if(v < 20) {
      drops[length(drops)+1] <- countername[i]
    }
    
  }
  
  filteredSegData=inputdata[,!(names(inputdata) %in% drops)]
  
  return(filteredSegData)
}

----------------------------------------------------
  
k=10 #Folds

data <- mydatav_wamp
#data=standardize(data)

id <- sample(1:k,nrow(data),replace=TRUE)
list <- 1:k

##prediction <- data.frame()
trainingset <- data.frame()
##testsetCopy <- data.frame()
testset <- data.frame()


newsim <- c()
newtestset <- c()
percentageerror <- c()

c <- c()
MEAN <- c()

trainingset <- mydatav

testset <- datau
#testset$req.minp <- NULL
summary(testset)

for (i in 1:k)
{
  trainingset <- subset(data, id %in% list[-i])
  testset <- subset(data, id %in% c(i))

  physical_reduced=trainingset
  testset$req.minv <- NULL
    
  physical_reduced_removereqmin=physical_reduced
  physical_reduced_removereqmin$req.minv <- NULL
    
  physical_reduced_removereqmin=reduce_counters(physical_reduced_removereqmin)
    
  correlations <- cor(physical_reduced_removereqmin) 
  highCorr <- findCorrelation(correlations, cutoff = 0.75)
  low_cor_names=names(physical_reduced_removereqmin[, -highCorr])
  low_cor_data=physical_reduced_removereqmin[(names(physical_reduced_removereqmin) %in% low_cor_names)]
  

  fmla=as.formula(paste('req.minv~',paste(names(low_cor_data),collapse = "+")))
    
  glm.modelinit=lm(fmla, data=physical_reduced)

  #glm_model_final=glm.modelinit
  glm_model_final <- step(glm.modelinit, direction = 'both')
  
  #glm_model_final=new_model
  
  sim=as.matrix(predict(glm_model_final,newdata=testset,type='response'))
  
  
  
  for(j in 1:dim(testset)[1])
  {
    
    newsim[j]=sim[j]
    newtestset[j]= mydatav_wamp[,1][j]

  }
  MEAN=mean(abs(newsim-newtestset)/newtestset)
  c[i]=MEAN*100
  #c=MEAN*100
}
c