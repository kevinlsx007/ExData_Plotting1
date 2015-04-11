data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", 
                   skip=grep("1/2/2007", readLines("household_power_consumption.txt")), 
                   nrows=2879)
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                    "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                    "Sub_metering_3")
df <- data
times<-paste(df$Date,df$Time)
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- strptime(times, "%d/%m/%Y %H:%M:%S")
png(file = "plot3.png",bg="transparent")
plot(df$Time,df$Sub_metering_1,type="n",ylab="Energy sub metering",xlab=NA)
lines(df$Time,df$Sub_metering_1,col="black")
lines(df$Time,df$Sub_metering_2,col="red")
lines(df$Time,df$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1",
        "Sub_metering_2","Sub_metering_3"))
dev.off()
