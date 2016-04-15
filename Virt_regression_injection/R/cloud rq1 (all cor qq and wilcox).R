
#Cloudscale-------------
{
  par(mfrow=c(3,2))
  
  qqplot(mydatap_tomcat_old$java_..User.Time,mydatav_tomcat_modforoldp$java_..User.Time, xlab = 'Web Server CPU User Time(Physical)'
         , ylab='Web Server CPU User Time(Virtual)')
  abline(0,1)
  qqplot(mydatap_tomcat_old$mysql_..User.Time,mydatav_tomcat_modforoldp$mysql_..User.Time,xlab = 'DB Server CPU User Time(Physical)'
         , ylab='DB Server CPU User Time(Virtual)')
  abline(0,1)
  
  
  qqplot(mydatap_tomcat_old$java_IO.Data.Operations.sec,mydatav_tomcat_modforoldp$java_IO.Data.Operations.sec,xlab = 'Web Server Disk IO Data Operations/sec(Physical)'
         , ylab='Web Server Disk IO Data Operations/sec(Virtual)')
  abline(0,1)
  qqplot(mydatap_tomcat_old$mysql_IO.Data.Operations.sec,mydatav_tomcat_modforoldp$mysql_IO.Data.Operations.sec, xlab = 'DB Server Disk IO Data Operations/sec(Physical)'
         , ylab='DB Server Disk IO Data Operations/sec(Virtual)')
  abline(0,1)
  
  
  qqplot(mydatap_tomcat_old$java_Working.Set,mydatav_tomcat_modforoldp$java_Working.Set,xlab = 'Web Server Memory Working Set(Physical)'
         , ylab='Web Server Memory Working Set(Virtual)')
  abline(0,1)
  qqplot(mydatap_tomcat_old$mysql_Working.Set,mydatav_tomcat_modforoldp$mysql_Working.Set,xlab = 'DB Server Memory Working Set(Physical)'
         , ylab='DB Server Memory Working Set(Virtual)')
  abline(0,1)
  
  #------------------------
  
  cor(mydatap_tomcat_old$java_..User.Time,mydatav_tomcat_modforoldp$java_..User.Time, method='spearman')
  cor(mydatap_tomcat_old$mysql_..User.Time,mydatav_tomcat_modforoldp$mysql_..User.Time,method='spearman')
  cor.test(mydatap_tomcat_old$java_..User.Time,mydatav_tomcat_modforoldp$java_..User.Time, method='spearman',exact=FALSE)$p.value
  cor.test(mydatap_tomcat_old$mysql_..User.Time,mydatav_tomcat_modforoldp$mysql_..User.Time,method='spearman',exact=FALSE)$p.value
  
  cor(mydatap_tomcat_old$java_IO.Data.Operations.sec,mydatav_tomcat_modforoldp$java_IO.Data.Operations.sec,method='spearman')
  cor(mydatap_tomcat_old$mysql_IO.Data.Operations.sec,mydatav_tomcat_modforoldp$mysql_IO.Data.Operations.sec,method='spearman')
  cor.test(mydatap_tomcat_old$java_IO.Data.Operations.sec,mydatav_tomcat_modforoldp$java_IO.Data.Operations.sec,method='spearman')$p.value
  cor.test(mydatap_tomcat_old$mysql_IO.Data.Operations.sec,mydatav_tomcat_modforoldp$mysql_IO.Data.Operations.sec,method='spearman')$p.value
  
  cor(mydatap_tomcat_old$java_Working.Set,mydatav_tomcat_modforoldp$java_Working.Set,method='spearman')
  cor(mydatap_tomcat_old$mysql_Working.Set,mydatav_tomcat_modforoldp$mysql_Working.Set,method='spearman')
  cor.test(mydatap_tomcat_old$java_Working.Set,mydatav_tomcat_modforoldp$java_Working.Set,method='spearman',exact=FALSE)$p.value
  cor.test(mydatap_tomcat_old$mysql_Working.Set,mydatav_tomcat_modforoldp$mysql_Working.Set,method='spearman',exact=FALSE)$p.value
}

#-------------------------------------------------------END-----------------------------------------------

wilcox.test(mydatap_tomcat_old$java_..User.Time,mydatav_tomcat_modforoldp$java_..User.Time)
wilcox.test(mydatap_tomcat_old$mysql_..User.Time,mydatav_tomcat_modforoldp$mysql_..User.Time)

wilcox.test(mydatap_tomcat_old$java_IO.Data.Operations.sec,mydatav_tomcat_modforoldp$java_IO.Data.Operations.sec)
wilcox.test(mydatap_tomcat_old$mysql_IO.Data.Operations.sec,mydatav_tomcat_modforoldp$mysql_IO.Data.Operations.sec)
  
wilcox.test(mydatap_tomcat_old$java_Working.Set,mydatav_tomcat_modforoldp$java_Working.Set)
wilcox.test(mydatap_tomcat_old$mysql_Working.Set,mydatav_tomcat_modforoldp$mysql_Working.Set)