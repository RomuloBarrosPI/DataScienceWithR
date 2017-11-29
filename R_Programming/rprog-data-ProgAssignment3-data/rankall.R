rankall <- function(outcome, num = "best") {
        
        raw_data <- read.csv("outcome-of-care-measures.csv",
                             colClasses = "character")
        
        valid_state_names = unique(raw_data[, 7])
        valid_outcome_names = c("heart attack", 
                                "heart failure",
                                "pneumonia")

        if (!is.element(outcome, valid_outcome_names)) {
                stop("invalid outcome")
        }
        
        subset_data <- subset.data.frame(raw_data, 
                                         select = c(2, 7, 11, 17, 23))
        
        colnames(subset_data) <- c("hospital",
                                   "state",
                                   "heart attack",
                                   "heart failure",
                                   "pneumonia")
        
        suppressWarnings(subset_data[, 3] <- as.numeric(subset_data[, 3]))
        suppressWarnings(subset_data[, 4] <- as.numeric(subset_data[, 4]))
        suppressWarnings(subset_data[, 5] <- as.numeric(subset_data[, 5]))
        
        subset_data <- subset_data[complete.cases(subset_data),]
        
        subset_data <- subset_data[order(subset_data[outcome], 
                                         subset_data[, 2]), ]
        
        if (!is.numeric(num)) {
                if (num == "worst") {
                        num <- nrow(subset_data)
                }
                else {
                        num <- 1
                }
        }
        
        if (is.numeric(num) && num > nrow(subset_data)) {
                return(NA)
        }
        
        subset_data[num,1]
        
}