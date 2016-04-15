datapheat=as.data.frame(mydatap_wamp_mod)
datavheat=as.data.frame(mydatav_wamp_mod)

names(datavheat)[1] <- "reqmin"
names(datapheat)[1] <- "reqmin"

names(datavheat)
names(datapheat)

#-------------------------------------
cor_diff <- data.frame()

datapheat$wamp_ID.Process <- NULL
datapheat$mysql_ID.Process <- NULL
datapheat$wamp_Creating.Process.ID <- NULL
datapheat$mysql_Creating.Process.ID <- NULL
datapheat$wamp_Priority.Base <- NULL
datapheat$mysql_Priority.Base <- NULL
datapheat$wamp_Elapsed.Time <- NULL
datapheat$mysql_Elapsed.Time <- NULL
datapheat$mysql_Virtual.Bytes.Peak <- NULL
datapheat$mysql_Working.Set.Peak <- NULL
datapheat$mysql_Page.File.Bytes.Peak <- NULL
#datapheat$wamp_IO.Write.Operations.sec <- NULL
datapheat$wamp_IO.Read.Operations.sec <- NULL

datavheat$wamp_ID.Process <- NULL
datavheat$mysql_ID.Process <- NULL
datavheat$wamp_Creating.Process.ID <- NULL
datavheat$mysql_Creating.Process.ID <- NULL
datavheat$wamp_Priority.Base <- NULL
datavheat$mysql_Priority.Base <- NULL
datavheat$wamp_Elapsed.Time <- NULL
datavheat$mysql_Elapsed.Time <- NULL
datavheat$mysql_Virtual.Bytes.Peak <- NULL
datavheat$mysql_Working.Set.Peak <- NULL
datavheat$mysql_Page.File.Bytes.Peak <- NULL
#datavheat$wamp_IO.Write.Operations.sec <- NULL
datavheat$wamp_IO.Read.Operations.sec <- NULL


cor_p_wamp=cor(datapheat, method='spearman')
cor_v_wamp=cor(datavheat, method='spearman')
cor_diff=abs(cor_p_wamp-cor_v_wamp)
#cor_diff$priority.base

#cor_diff=cor_diff[,complete.cases(cor_diff)] 

a <- list(
  title="",
  autotick = FALSE,
  ticks = "outside",
  tick0 = 0,
  #dtick = 0.25,
  ticklen = 5,
  tickwidth = 2,
  tickcolor = toRGB("blue")
)

b <- list(
  title="",
  autotick = FALSE,
  ticks = "outside",
  tick0 = 0,
  #dtick = 0.25,
  ticklen = 5,
  tickwidth = 2,
  tickcolor = toRGB("blue")
)

mar <- list(
  b=40,
  l=280,
  r=280,
  t=40
)

#mar <- list(
#  b=40,
#  l=280,
#  r=280,
#  t=40
#)

p=plot_ly(z = cor_diff, colorscale = "Greys", type = "heatmap" ,x=names(datavheat),y=names(datapheat)) %>% layout(xaxis = a, yaxis = b, margin=mar,autoexpand=TRUE)
p

#------CLOUDSTORE--------------------------

datapheat2=as.data.frame(mydatap_tomcat_old)
datavheat2=as.data.frame(mydatav_tomcat_modforoldp)

names(datavheat2)[1] <- "reqmin"
names(datapheat2)[1] <- "reqmin"

names(datavheat2)
names(datapheat2)
#------------------------
cor_p_diff2 <- data.frame()
datap_tomcat=datavheat2
datav_tomcat=datapheat2

datap_tomcat$java_ID.Process <- NULL
datap_tomcat$mysql_ID.Process <- NULL
datap_tomcat$java_Creating.Process.ID <- NULL
datap_tomcat$mysql_Creating.Process.ID <- NULL
datap_tomcat$java_Priority.Base <- NULL
datap_tomcat$mysql_Priority.Base <- NULL
datap_tomcat$java_Elapsed.Time <- NULL
datap_tomcat$mysql_Elapsed.Time <- NULL
datap_tomcat$mysql_Virtual.Bytes.Peak <- NULL
datap_tomcat$mysql_Working.Set.Peak <- NULL
datap_tomcat$mysql_Page.File.Bytes.Peak <- NULL


datav_tomcat$java_ID.Process <- NULL
datav_tomcat$mysql_ID.Process <- NULL
datav_tomcat$java_Creating.Process.ID <- NULL
datav_tomcat$mysql_Creating.Process.ID <- NULL
datav_tomcat$java_Priority.Base <- NULL
datav_tomcat$mysql_Priority.Base <- NULL
datav_tomcat$java_Elapsed.Time <- NULL
datav_tomcat$mysql_Elapsed.Time <- NULL
datav_tomcat$mysql_Virtual.Bytes.Peak <- NULL
datav_tomcat$mysql_Working.Set.Peak <- NULL
datav_tomcat$mysql_Page.File.Bytes.Peak <- NULL

names(datap_tomcat)
names(datav_tomcat)

cor_p_tomcat=cor(datap_tomcat,method= 'spearman')
cor_v_tomcat=cor(datav_tomcat,method='spearman')
cor_delta=abs(cor_p_tomcat-cor_v_tomcat)

#plot_ly(z = cor_diff2, colorscale = "Hot", type = "heatmap", xmap = mydatap_wamp_mod) 


a <- list(
  title="",
  autotick = FALSE,
  ticks = "outside",
  tick0 = 0,
  #dtick = 0.25,
  ticklen = 5,
  tickwidth = 2,
  tickcolor = toRGB("blue")
)

b <- list(
  title="",
  autotick = FALSE,
  ticks = "outside",
  tick0 = 0,
  #dtick = 0.25,
  ticklen = 5,
  tickwidth = 2,
  tickcolor = toRGB("blue")
)

mar <- list(
  b=40,
  l=280,
  r=280,
  t=40
)

p2=plot_ly(z = cor_diff2,colorscale = "Greys" ,type = "heatmap" ,x=names(datap_tomcat),y=names(datav_tomcat)) %>% layout(xaxis = a, yaxis = b, margin=mar,autoexpand=TRUE)
p2
