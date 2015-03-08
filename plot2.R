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


#plot2
df3<-init()
df3$temp<-paste(df3$Date,df3$Time)
df3$Time2<-strptime(df3$temp,format="%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480,bg = "transparent", type="cairo-png" )
plot(df3$Time2,df3$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="",type="n")
lines(df3$Time2,df3$Global_active_power)
dev.off()

