complete <- function(directory, id = 1:322) {
        
        all_files <- list.files(path = directory)
        result <- data.frame()
        for (each in all_files[id]) {
                x <- read.csv(each)
                y <- x[complete.cases(x), "ID"]
                zeta <- length(y)
                result <- rbind(result, c(y[1], zeta))
        }
        result
        `colnames<-`(result, c("id", "nobs"))
}