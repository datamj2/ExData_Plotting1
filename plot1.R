plot1 <- function() {
        
        fname<-"household_power_consumption_subset.txt"
        
        if (file.exists(fname)) {
                data2<-read.table(fname,header=TRUE,sep=";")
        } else  {
                download.file(url, "destfile.zip")
                unzip("destfile.zip")
                data1<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
                data2<-subset(data1,Date=="1/2/2007")
                data2b<-subset(data1,Date=="2/2/2007")
                data2<-rbind(data2,data2b)
                write.table(data2,fname,sep=";")
        }
        
        png('plot1.png', width=480, height=480)
        hist(as.numeric(as.character(data2$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
        dev.off()
        
}