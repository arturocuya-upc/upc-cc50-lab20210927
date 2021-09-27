casas <- read.csv("/cloud/project/BostonHousing.csv")
View(casas)

casas.z <- scale(casas)
View(casas.z)

casas.mean <- scale(casas, center=TRUE, scale=FALSE)
View(casas.mean)

casas.sd <- scale(casas, center=FALSE, scale=TRUE)
View(casas.sd)

normalizar.cols <- function(df, cols) {
  nombres <- names(df)
  for (col in cols) {
    nombre <- paste(nombres[col], "z", sep=".")
    df[nombre] <- scale(df[,col])
  }
  df
}

casas <- normalizar.cols(casas, c(1,3,5:8))
