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
png(file = "plot4.png")
par(mfrow = c(2, 2))
plot(df$Time,df$Global_active_power,type="n",ylab="Global Active Power",
     xlab=NA)
lines(df$Time,df$Global_active_power,lty=1)
plot(df$Time,df$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(df$Time,df$Voltage,lty=1,lwd=0.5)
plot(df$Time,df$Sub_metering_1,type="n",ylab="Energy sub metering",xlab=NA)
lines(df$Time,df$Sub_metering_1,col="black")
lines(df$Time,df$Sub_metering_2,col="red")
lines(df$Time,df$Sub_metering_3,col="blue")
legend("topright",bty="n",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(df$Time,df$Global_reactive_power,type="n",xlab="datetime",ylab=
        "Global_reactive_power")
lines(df$Time,df$Global_reactive_power,lty=1,lwd=0.5)
dev.off()
