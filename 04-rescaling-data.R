#install.packages("scales")
library(scales)

estudiantes <- read.csv("/cloud/project/data-conversion.csv")
estudiantes$Income.rescaled <- rescale(estudiantes$Income)

rescalar.cols <- function(df, cols) {
  nombres <- names(df)
  for (col in cols) {
    nombre <- paste(nombres[col], "rescaled", sep=".")
    df[nombre] <- rescale(df[,col])
  }
  df
}

estudiantes <- rescalar.cols(estudiantes, c(1,4))

View(estudiantes)
