complete <- function(directory, id = 1:322) {
        
        old.dir <- getwd()
        setwd(directory)
        all_files <- list.files(path = directory)
        result <- data.frame()
        for (each in all_files[id]) {
                x <- read.csv(each)
                y <- x[complete.cases(x), "ID"]
                zeta <- length(y)
                result <- rbind(result, c(x[1,4], zeta))
        }
        setwd(old.dir)
        result
        `colnames<-`(result, c("id", "nobs"))
}