set.seed(101)

trainingset <- data.frame()
testset <- data.frame()


newsim <- c()
newtestset <- c()
percentageerror <- c()

c <- c()
MEAN <- c()

new_datav_wamp=mydatav_tomcat
new_datav_wamp$wamp_ID.Process <- NULL

new_datap_wamp=mydatavr1
new_datap_wamp$wamp_ID.Process <- NULL

trainingset <- new_datav_wamp

testset <- new_datap_wamp
testset$req.minv <- NULL

  physical_reduced=trainingset
  physical_reduced_removereqmin=physical_reduced #new variable introduced here cause used later as data in the glm.model
  physical_reduced_removereqmin$req.minv <- NULL
  
  physical_reduced_removereqmin=reduce_counters(physical_reduced_removereqmin)
  
  correlations <- cor(physical_reduced_removereqmin) 
  highCorr <- findCorrelation(correlations, cutoff = 0.75)
  low_cor_names=names(physical_reduced_removereqmin[, -highCorr])
  low_cor_data=physical_reduced_removereqmin[(names(physical_reduced_removereqmin) %in% low_cor_names)]
  
  fmla=as.formula(paste('req.minv~',paste(names(low_cor_data),collapse = "+")))
  
  glm.modelinit=glm(fmla, data=physical_reduced)
  glm_model_final <- step(glm.modelinit, direction = 'both',test='F')
  
  
  sim=as.matrix(predict(glm_model_final,newdata=testset,type='response'))
  
  for(j in 1:dim(testset)[1])
  {
    
    newsim[j]=sim[j]
    newtestset[j]= new_datap_wamp[,1][j]
    
  }
  MEAN=mean(abs(newsim-newtestset)/newtestset)
  c=MEAN*100
  rm(newsim,newtestset)
  c