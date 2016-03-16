set.seed(10)


k=10 #Folds

data <- mydatap_tomcat_mod
id <- sample(1:k,nrow(data),replace=TRUE)
list <- 1:k


trainingset <- data.frame()
testset <- data.frame()

c <- c()
MEAN <- c()


#rm(newsim,newtestset)

for (i in 1:k)
{
  newsim <- c()
  newtestset <- c()
  
  trainingset <- subset(data, id %in% list[-i])
  testset <- subset(data, id %in% c(i))
  
  testset_copy=testset
  testset$req.minp <- NULL
  
  physical_data=trainingset
  physical_data$req.minp <- NULL
  
  
  physical_reduced_removereqmin=reduce_counters(physical_data)
  
  correlations <- cor(physical_reduced_removereqmin) 
  highCorr <- findCorrelation(correlations, cutoff = 0.75)
  low_cor_names=names(physical_reduced_removereqmin[, -highCorr])
  low_cor_data=physical_reduced_removereqmin[(names(physical_reduced_removereqmin) %in% low_cor_names)]
  
  
  fmla=as.formula(paste('req.minp~',paste(names(low_cor_data),collapse = "+")))
  glm.modelinit=glm(fmla, data=trainingset)
  glm_model_final <- step(glm.modelinit, direction = 'both')
  
  #fmla
  
  sim=as.matrix(predict(glm_model_final,newdata=testset,type='response'))
  
  
  
  for(j in 1:dim(testset)[1])
  {
    
    newsim[j]=sim[j]
    newtestset[j]=testset_copy[,1][j]
    
  }
  MEAN=mean(abs(newsim-newtestset)/newtestset)
  c[i]=MEAN*100
  #fmla_new[i]=fmla
  
  rm(newsim,newtestset)
}
c
anova(glm_model_final)