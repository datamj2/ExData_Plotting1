plot3 <- function() {
        x
        fname<-"household_power_consumption_subset.txt"
        
        if (file.exists(fname)) {
                data2<-read.table(fname,header=TRUE,sep=";")
        } else  {
                fname2<-"household_power_consumption.txt"
                if (!file.exists(fname2)) {
                        download.file(url, "destfile.zip")
                        unzip("destfile.zip")
                }
                data1<-read.table(fname2,header=TRUE,sep=";")
                data2<-subset(data1,Date=="1/2/2007")
                data2b<-subset(data1,Date=="2/2/2007")
                data2<-rbind(data2,data2b)
                write.table(data2,fname,sep=";")
        }
        
        column_names=names(data2)
        sm1=as.numeric(as.character(data2$Sub_metering_1))
        sm2=as.numeric(as.character(data2$Sub_metering_2))
        sm3=as.numeric(as.character(data2$Sub_metering_3))
        datat=(strptime(paste(as.character(data2[,1]),as.character(data2[,2])),"%d/%m/%Y %H:%M:%S"))
        
        png('plot3.png', width=480, height=480)
        plot(datat,sm1,type="n",ylab="Energy sub metering",xlab="")
        points(datat,sm1,type="l")
        points(datat,sm2,type="l",col="red")
        points(datat,sm3,type="l",col="blue")
        legend("topright",legend=c(column_names[7],column_names[8],column_names[9]),col=c("black","red","blue"),lty=c(1,1,1))
        dev.off()
}