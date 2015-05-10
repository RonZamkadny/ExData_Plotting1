library(data.table)
energyWithoutQuestionMark <- fread(input = "household_power_consumption.txt", sep = ";", na.strings = "?")
energyDateFiltered <- energyWithoutQuestionMark[energyWithoutQuestionMark$Date == "1/2/2007" | energyWithoutQuestionMark$Date == "2/2/2007", ]
energyDateFiltered$datetime <- paste(energyDateFiltered$Date, energyDateFiltered$Time, sep = " ")
z <- as.POSIXlt(energyDateFiltered$datetime, format = "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_ALL", "English")
png(filename = "plot2.png", width = 480, height = 480)
plot(z,energyDateFiltered$Global_active_power, type = "l", main = "", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()