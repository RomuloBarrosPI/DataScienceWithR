pollutantmean <- function(directory, pollutant, id = 1:322) {
        
        all_files <- list.files(path = directory)
        x <- data.frame()
        for (each in all_files[id]) {
                x <- rbind(x, read.csv(each))
        }
        mean(na.exclude(x[[pollutant]]))
}