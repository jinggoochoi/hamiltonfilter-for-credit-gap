library("neverhpfilter");
library("tis");
library("data.table");
setwd("d:/LW_replication");
data.start   <- c(1962,4)
data <- read.table("cgap.csv",
                   sep=',',header=TRUE,stringsAsFactors=FALSE, na.strings=".")
hhcgap <- as.data.frame(data[,1:2])
cocgap <- as.data.frame(data[,c('X','coc')])
pvtgap <- as.data.frame(data[,c('X','pvt')])

hhc<-as.xts(hhcgap,order.by=as.Date(hhcgap$X,format="%Y-%m-%d"))
storage.mode(hhc)<-"numeric"
hhc_filter<-yth_filter(hhc$hhc,10,4)
write.table(hhc_filter,'hamilton_hhc_h10.csv', sep = ',', na = '')

coc<-as.xts(cocgap,order.by=as.Date(cocgap$X,format="%Y-%m-%d"))
storage.mode(coc)<-"numeric"
coc_filter<-yth_filter(coc$coc,10,4)
write.table(coc_filter,'hamilton_coc_h10.csv', sep = ',', na = '')

pvt<-as.xts(pvtgap,order.by=as.Date(pvtgap$X,format="%Y-%m-%d"))
storage.mode(pvt)<-"numeric"
pvt_filter<-yth_filter(pvt$pvt,10,4)
write.table(pvt_filter,'hamilton_pvt_h10.csv', sep = ',', na = '')