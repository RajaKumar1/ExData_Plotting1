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


# plot1: plot the histogram to the plot1.png file
df3<-init()
png(filename = "plot1.png", width = 480, height = 480,bg = "transparent")
hist(as.double(df3$Global_active_power),breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

# lessons
# datetime, stringasfactors=false
