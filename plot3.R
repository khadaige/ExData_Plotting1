## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2007-02-01 to 2007-02-02
## 3. generate a histogram of global active power(kilowatts)
## Assumes household_power_consumption.txt file is located in the working directory

## read data
powerconsumption <- read.table("/Users/khadija/Desktop/ Exploratory Data Analysis/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

powerconsumption$Date <- as.Date(powerconsumption$Date, format="%d/%m/%Y")

## Subsetting the data
subsetPower<- subset(powerconsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
datetime <- paste(as.Date(subsetPower$Date), subsetPower$Time)
subsetPower$Datetime <- as.POSIXct(datetime)

## Plot 3
with(subsetPower, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red', type="l")
        lines(Sub_metering_3~Datetime,col='Blue', type="l")
})
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1, col=c("black", "red", "blue"), cex = 0.5)        

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
