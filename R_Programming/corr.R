corr <- function(directory, threshold = 0) {
        
        # Lê os dados de todos os arquivos/sensores
        old.dir <- getwd()
        setwd(directory)
        all_files <- list.files(path = directory)
        setwd(old.dir)
        result <- data.frame()
        
        # -- Calcula o número de casos completos encontrados
        # source("complete.R")
        s <- complete(directory)
        print("Cheguei aqui.")
        print(c("Threshold é:", threshold))
        print(class(s))
        # Calcula a correlação entre nitratos e sulfatos
        for (element in s) {
                print(class(element))
                if (threshold < element["nobs"]) {
                        alpha <- read.csv(all_files[each["ID"]])
                        beta <- alpha[, c("nitrate", "sulfate")]
                        zeta <- cor(beta)
                        result <- rbind(result, c(beta[1], zeta))
                }
        }
        result
}