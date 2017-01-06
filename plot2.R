plot2 <- function() {
        # NOTE: this function will look for "household_power_consumption.txt" in the working directory 
        # and download if not found. It will then load, subset and save the data in "household_power_consumption_subset.txt"
        # for use by any of the "plot" functions. 
        
        
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
        
        datat=(strptime(paste(as.character(data2[,1]),as.character(data2[,2])),"%d/%m/%Y %H:%M:%S"))
        
        png('plot2.png', width=480, height=480)
        plot(datat,as.numeric(as.character(data2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
        dev.off()
        
}