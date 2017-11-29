best <- function(state = character(length = 2L),
                 outcome) {
        
        raw_data <- read.csv("outcome-of-care-measures.csv",
                             colClasses = "character",
                             stringsAsFactors = FALSE)
        
        valid_state_names = unique(raw_data[, 7])
        valid_outcome_names = c("heart attack", 
                                "heart failure",
                                "pneumonia")
        
        if (!is.element(state, valid_state_names)) {
                stop("invalid state")
        }
        else if (!is.element(outcome, valid_outcome_names)) {
                stop("invalid outcome")
        }
        
        
        subset_data <- subset.data.frame(raw_data, 
                                         State == state,
                                         select = c(2, 11, 17, 23))
        
        colnames(subset_data) <- c("hospital",
                                   "heart attack",
                                   "heart failure",
                                   "pneumonia")
        
        subset_data <- subset_data[complete.cases(subset_data),]
        
        subset_data[, 2] <- as.numeric(subset_data[, 2])
        subset_data[, 3] <- as.numeric(subset_data[, 3])
        subset_data[, 4] <- as.numeric(subset_data[, 4])
        
        subset_data <- subset_data[order(subset_data[outcome]),]
        
        subset_data[1,1]

}