a1 <- function() {
  library(dplyr)
  LOCAL_FILE = "household_power_consumption.txt"  
  
  classes <- c("Date", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric")
  
  data1 <- read.table(LOCAL_FILE, header=TRUE, sep=";", colClasses=classes, na.strings=c("?") )
    
  Day1 <- filter(data1, Date=="1/2/2007")
  Day2 <- filter(data1, Date=="2/2/2007")
  
  DayUnion <- rbind(Day1, Day2)
  
  dev.copy(png,'Plot1.png')
  
  hist(DayUnion$Global_active_power[ !DayUnion$Global_active_power=='?'], 
       col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  dev.off()
  
}
