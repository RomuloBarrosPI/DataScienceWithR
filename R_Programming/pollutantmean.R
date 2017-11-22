pollutantmean <- function(directory, pollutant, id = 1:322) {
        
        old.dir <- getwd()
        setwd(directory)
        all_files <- list.files(path = directory)
        x <- data.frame()
        for (each in all_files[id]) {
                x <- rbind(x, read.csv(each))
        }
        setwd(old.dir)
        mean(na.exclude(x[[pollutant]]))
}
