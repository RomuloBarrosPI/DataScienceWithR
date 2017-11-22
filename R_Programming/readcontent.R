read_and_calculate <- function(directory, files) {
        
        result <- numeric()
        
        for (f in files) {
                filepath <- paste(directory, f, sep = "")
                x <- read.csv(file = filepath)
                x <- (x[!is.na(x), 2:3])
                c <- cor(x[1], x[2], use = "na.or.complete")
                c <- na.exclude(c)
                result <- c(result, c)
        }
        
        return(result)
}

get_targets <- function(directory, threshold = 0) {
        
        complete_obs <- complete(directory)
        cc <- which(complete_obs["nobs"] > threshold)
        all_files <- list.files(path = directory)
        targets <- all_files[cc]
        
        return(targets)
}


corr <- function(directory, threshold = 0) {
        
        if (threshold != 0) {
                target_files <- get_targets(directory, threshold)
        }
        else {
                target_files <- list.files(path = directory)
        }
        
        x <- read_and_calculate(directory, target_files)
        
        return(x)
}