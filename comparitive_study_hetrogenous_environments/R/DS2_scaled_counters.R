set.seed(101)
#mydatap_wamp_mod<-read.csv("C:\\Users\\umroot\\Desktop\\pcountersforv.csv")

#glm.modelx=glm(mydatap_wamp_mod$req.minp~mydatap_wamp_mod$IO.Read.Bytes.sec)


#+mydatap_wamp_mod$IO.Read.Operations.sec+mydatap_wamp_mod$IO.Data.Bytes.sec
#+mydatap_wamp_mod$IO.Data.Operations.sec+mydatap_wamp_mod$IO.Other.Bytes.sec+mydatap_wamp_mod$Page.Faults.sec)

#summary(glm.modelx)

glm.modelx=glm(mydatap_wamp_mod$req.minp~mydatap_wamp_mod$wamp_Virtual.Bytes)
glm.modely=glm(mydatav_wamp_mod$req.minv~mydatav_wamp_mod$wamp_Virtual.Bytes)

wvb=(((mydatav_wamp_mod$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]


glm.modelx=glm(mydatap_wamp_mod$req.minp~mydatap_wamp_mod$wamp_Page.Faults.sec)
glm.modely=glm(mydatav_wamp_mod$req.minv~mydatav_wamp_mod$wamp_Page.Faults.sec)

wpfs=(((mydatav_wamp_mod$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]


#wpfs=(mydatav_wamp_mod$wamp_Page.Faults.sec)*(coef(glm.modelx)[2]*mydatav_wamp_mod$req.minv+coef(glm.modelx)[1])/
(coef(glm.modelx)[2]*mydatap_wamp_mod$req.minp+coef(glm.modelx)[1])


glm.modelx=glm(mydatap_wamp_mod$req.minp~mydatap_wamp_mod$wamp_IO.Other.Bytes.sec)
glm.modely=glm(mydatav_wamp_mod$req.minv~mydatav_wamp_mod$wamp_IO.Other.Bytes.sec)

wioobs=(((mydatav_wamp_mod$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]

#wioobs=(mydatav_wamp_mod$wamp_IO.Other.Bytes.sec)*(coef(glm.modelx)[2]*mydatav_wamp_mod$req.minv+coef(glm.modelx)[1])/
#  (coef(glm.modelx)[2]*mydatap_wamp_mod$req.minp+coef(glm.modelx)[1])


glm.modelx=glm(mydatap_wamp_mod$req.minp~mydatap_wamp_mod$mysql_Working.Set.Peak)
glm.modely=glm(mydatav_wamp_mod$req.minv~mydatav_wamp_mod$mysql_Working.Set.Peak)
mwsp=(((mydatav_wamp_mod$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]


#mwsp=(mydatav_wamp_mod$mysql_Working.Set.Peak)*(coef(glm.modelx)[2]*mydatav_wamp_mod$req.minv+coef(glm.modelx)[1])/
#  (coef(glm.modelx)[2]*mydatap_wamp_mod$req.minp+coef(glm.modelx)[1])


#glm.modelx=glm(mydatap_wamp_mod$req.minp~mydatap_wamp_mod$IO.Other.Bytes.sec)
#ioobs=(mydatav_wamp_mod$IO.Other.Bytes.sec)*(coef(glm.modelx)[2]*mydatav_wamp_mod$req.minv+coef(glm.modelx)[1])/
# (coef(glm.modelx)[2]*mydatap_wamp_mod$req.minp+coef(glm.modelx)[1])


glm.modelx=glm(mydatap_wamp_mod$req.minp~mydatap_wamp_mod$mysql_IO.Data.Operations.sec)
glm.modely=glm(mydatav_wamp_mod$req.minv~mydatav_wamp_mod$mysql_IO.Data.Operations.sec)

myiodos=(((mydatav_wamp_mod$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]

#myiodos=(mydatav_wamp_mod$mysql_IO.Data.Operations.sec)*(coef(glm.modelx)[2]*mydatav_wamp_mod$req.minv+coef(glm.modelx)[1])/
#  (coef(glm.modelx)[2]*mydatap_wamp_mod$req.minp+coef(glm.modelx)[1])


glm.modelz=glm(mydatap_wamp_mod$req.minp~wvb+wpfs+wioobs+myiodos)



step <- step(glm.modelz)
summary(step)

newmean <- c()

predict=as.matrix(predict(step,mydatav_wamp_mod))

p = as.data.frame(predict)
#rm=rmse(p,mydatav_wamp_mod$req.minv)
#req=as.data.frame(mydatav_wamp_mod$req.minv)


#sim=as.matrix(predict(glm_model_final,newdata=testset))
#mean1=mean(predict)

#MEAN=mean((abs(as.matrix(p)-mydatav_wamp_mod$req.minv[,1]))/mydatav_wamp_mod$req.minv[,1])

#(sum(abs((newtestset-)/newtestset))/dim(testset)[1])

pnew <- c()
newset <- c()

for(j in 1:dim(as.matrix(mydatav_wamp_mod$req.minv))[1])
{
  
  pnew[j]=p[,1][j]
  newset[j]=mydatav_wamp_mod$req.minv[j]
  
  
  # MSE[i]=rmse(newsim,newtestset)
  #percentageerror[i]=(MSE[i]/testset[,1][i])*100
  
  #matrix[i]=(sim[i]-testset[,1][i])^2
  #append(matrix,sqe)
  #totaltestset=dim(testset)[1]
  #meansquareerror[i]=(sum(matrix))/totaltestset
  
}
new_mean=mean((abs(pnew-newset))/newset)
new_mean*100

rm(pnew,newset)

#plot(mydatav_wamp_mod$req.minv,pnew)
#abline(0,1)

