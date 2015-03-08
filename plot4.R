# read the csv file, we need to read data for dates
# 2007-02-01 and 2007-02-02
init<-function ()
{
df=read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE,nrows = 120000)
df2=df[50000:120000,]
#df2=df
date1<-as.Date("2007/02/01")
date2<-as.Date("2007/02/02")
df2$Date2<-as.Date(df2$Date, "%d/%m/%Y")
df3<-df2[(df2$Date2>=date1 & df2$Date2<=date2),]
return (df3)
}

#plot 4

doplot<-function(width){
#	df3<-init()
	par(lwd=width)
	temp<-paste(df3$Date,df3$Time)
	df3$Time2<-strptime(temp,format="%d/%m/%Y %H:%M:%S")
	
	png(filename = "plot4.png", width = 480, height = 480,bg = "transparent", type="cairo-png")
	# set the layout: 2*2 
	par(mfrow=c(2,2))
	# plot the top left chart by manually adding the lines to an empty chart, 2 steps
	plot(df3$Time2,df3$Global_active_power, ylab="Global Active Power", xlab="",type="n")
	lines(df3$Time2,df3$Global_active_power)
	
	# plot the top right chart, use lines functions to manually add the line
	plot(df3$Time2,df3$Voltage, ylab="Voltage",xlab="datetime", type="n")
	lines(df3$Time2,df3$Voltage, col="black")
	
	# plot the bottom left chart, use lines functions to manually add the 3 sub meter charts
	plot(df3$Time2,df3$Sub_metering_1, ylab="Energy sub metering",xlab="", type="n")
	lines(df3$Time2,df3$Sub_metering_1, col="black")
	lines(df3$Time2,df3$Sub_metering_2, col="red")
	lines(df3$Time2,df3$Sub_metering_3, col="blue")
	# add the legend
	legend( "topright",lty=1, bty = "n", cex=0.9, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	
	# plot the bottom right chart
	plot(df3$Time2,df3$Global_reactive_power, ylab="Global_reactive_power",xlab="datetime", type="n",)
	lines(df3$Time2,df3$Global_reactive_power, col="black",lwd = 1)
	
	# close the png device/write to file
	dev.off()
}

doplot(1)

