library(data.table)
energyWithoutQuestionMark <- fread(input = "household_power_consumption.txt", sep = ";", na.strings = "?")
energyDateFiltered <- energyWithoutQuestionMark[energyWithoutQuestionMark$Date == "1/2/2007" | energyWithoutQuestionMark$Date == "2/2/2007", ]
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(energyDateFiltered$Global_active_power), freq = TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()