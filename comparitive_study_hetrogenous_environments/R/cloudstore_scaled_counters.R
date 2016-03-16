set.seed(101)
#mydatap_tomcat_old<-read.csv("C:\\Users\\umroot\\Desktop\\pcountersforv.csv")

#glm.modelx=glm(mydatap_tomcat_old$req.minp~mydatap_tomcat_old$IO.Read.Bytes.sec)


#+mydatap_tomcat_old$IO.Read.Operations.sec+mydatap_tomcat_old$IO.Data.Bytes.sec
#+mydatap_tomcat_old$IO.Data.Operations.sec+mydatap_tomcat_old$IO.Other.Bytes.sec+mydatap_tomcat_old$Page.Faults.sec)

#summary(glm.modelx)

glm.modelx=glm(mydatap_tomcat_old$req.minp~mydatap_tomcat_old$java_..User.Time)
glm.modely=glm(mydatav_tomcat_modforoldp$req.minv~mydatav_tomcat_modforoldp$java_..User.Time)
jut=(((mydatav_tomcat_modforoldp$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]
summary(jut)


glm.modelx=glm(mydatap_tomcat_old$req.minp~mydatap_tomcat_old$java_..Privileged.Time)
glm.modely=glm(mydatav_tomcat_modforoldp$req.minv~mydatav_tomcat_modforoldp$java_..Privileged.Time)
jpt=(((mydatav_tomcat_modforoldp$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]
summary(jpt)


#wpfs=(mydatav_tomcat_modforoldp$wamp_Page.Faults.sec)*(coef(glm.modelx)[2]*mydatav_tomcat_modforoldp$req.minv+coef(glm.modelx)[1])/
#(coef(glm.modelx)[2]*mydatap_tomcat_old$req.minp+coef(glm.modelx)[1])


glm.modelx=glm(mydatap_tomcat_old$req.minp~mydatap_tomcat_old$java_Private.Bytes)
glm.modely=glm(mydatav_tomcat_modforoldp$req.minv~mydatav_tomcat_modforoldp$java_Private.Bytes)
jpb=(((mydatav_tomcat_modforoldp$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]
summary(jpb)

#wioobs=(mydatav_tomcat_modforoldp$wamp_IO.Other.Bytes.sec)*(coef(glm.modelx)[2]*mydatav_tomcat_modforoldp$req.minv+coef(glm.modelx)[1])/
#  (coef(glm.modelx)[2]*mydatap_tomcat_old$req.minp+coef(glm.modelx)[1])


glm.modelx=glm(mydatap_tomcat_old$req.minp~mydatap_tomcat_old$java_IO.Write.Bytes.sec)
glm.modely=glm(mydatav_tomcat_modforoldp$req.minv~mydatav_tomcat_modforoldp$java_IO.Write.Bytes.sec)
jiowb=(((mydatav_tomcat_modforoldp$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]


#mwsp=(mydatav_tomcat_modforoldp$mysql_Working.Set.Peak)*(coef(glm.modelx)[2]*mydatav_tomcat_modforoldp$req.minv+coef(glm.modelx)[1])/
#  (coef(glm.modelx)[2]*mydatap_tomcat_old$req.minp+coef(glm.modelx)[1])


#glm.modelx=glm(mydatap_tomcat_old$req.minp~mydatap_tomcat_old$IO.Other.Bytes.sec)
#ioobs=(mydatav_tomcat_modforoldp$IO.Other.Bytes.sec)*(coef(glm.modelx)[2]*mydatav_tomcat_modforoldp$req.minv+coef(glm.modelx)[1])/
# (coef(glm.modelx)[2]*mydatap_tomcat_old$req.minp+coef(glm.modelx)[1])


glm.modelx=glm(mydatap_tomcat_old$req.minp~mydatap_tomcat_old$mysql_..User.Time)
glm.modely=glm(mydatav_tomcat_modforoldp$req.minv~mydatav_tomcat_modforoldp$mysql_..User.Time)
mut=(((mydatav_tomcat_modforoldp$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]


glm.modelx=glm(mydatap_tomcat_old$req.minp~mydatap_tomcat_old$mysql_Page.Faults.sec)
glm.modely=glm(mydatav_tomcat_modforoldp$req.minv~mydatav_tomcat_modforoldp$mysql_Page.Faults.sec)
mpfs=(((mydatav_tomcat_modforoldp$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]

glm.modelx=glm(mydatap_tomcat_old$req.minp~mydatap_tomcat_old$mysql_Private.Bytes)
glm.modely=glm(mydatav_tomcat_modforoldp$req.minv~mydatav_tomcat_modforoldp$mysql_Private.Bytes)
mpb=(((mydatav_tomcat_modforoldp$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]

glm.modelx=glm(mydatap_tomcat_old$req.minp~mydatap_tomcat_old$mysql_IO.Other.Bytes.sec)
glm.modely=glm(mydatav_tomcat_modforoldp$req.minv~mydatav_tomcat_modforoldp$mysql_IO.Other.Bytes.sec)
mioobs=(((mydatav_tomcat_modforoldp$req.minv-coef(glm.modely)[1])/coef(glm.modely)[2])*coef(glm.modelx)[2])+coef(glm.modelx)[1]




#myiodos=(mydatav_tomcat_modforoldp$mysql_IO.Data.Operations.sec)*(coef(glm.modelx)[2]*mydatav_tomcat_modforoldp$req.minv+coef(glm.modelx)[1])/
#  (coef(glm.modelx)[2]*mydatap_tomcat_old$req.minp+coef(glm.modelx)[1])


glm.modelz=glm(mydatap_tomcat_old$req.minp~jut+jpt+jpb+jiowb+mut+mpfs+mpb+mioobs)



step <- step(glm.modelz)
summary(step)

newmean <- c()

predict=as.matrix(predict(step,mydatav_tomcat_modforoldp))

p = as.data.frame(predict)
#rm=rmse(p,mydatav_tomcat_modforoldp$req.minv)
#req=as.data.frame(mydatav_tomcat_modforoldp$req.minv)


#sim=as.matrix(predict(glm_model_final,newdata=testset))
#mean1=mean(predict)

#MEAN=mean((abs(as.matrix(p)-mydatav_tomcat_modforoldp$req.minv[,1]))/mydatav_tomcat_modforoldp$req.minv[,1])

#(sum(abs((newtestset-)/newtestset))/dim(testset)[1])

pnew <- c()
newset <- c()

for(j in 1:dim(as.matrix(mydatav_tomcat_modforoldp$req.minv))[1])
{
  
  pnew[j]=p[,1][j]
  newset[j]=mydatav_tomcat_modforoldp$req.minv[j]
  
  
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

#plot(mydatav_tomcat_modforoldp$req.minv,pnew)
#abline(0,1)

