x <- list(2, "a", "b", TRUE)
x[[1]]
class(x)

x <- 1:4
y <- 2
x + y

x <- c(1, 3, 5)
y <- c(3, 2, 10)
z <- rbind(x, y)

class(z)
dim(z)
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x > 10] == 4
x
names(hw1_data)
hw1_data[47,]$Ozone
nrow(hw1_data)
nas <- is.na(hw1_data$Ozone)
sum(is.na(hw1_data$Ozone))
clear()

mean(!is.na(hw1_data$Ozone))

u <- hw1_data$Ozone > 31
t <- hw1_data$Temp > 90
mysubset <- subset(hw1_data, 
                 hw1_data$Ozone > 31 & hw1_data$Temp > 90)
max(hw1_data$Ozone[hw1_data$Month == 5], na.rm=TRUE)

x <- c(4, TRUE)
class(x)

x <- 4L
class(x)

x <- c(4, "a", T)
class(x)
x <- list(2, "a", "b", TRUE)
x[[1]]
class(x[[1]])
x <- 1:4
y <- 2:3
x + y
class(x + y)

hw1_data[1:2,]
