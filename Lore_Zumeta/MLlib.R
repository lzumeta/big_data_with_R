library(sparklyr)
library(ggplot2)
library(dplyr)
sc <- spark_connect(master = "local", version = "1.6.2")
iris_tbl <- copy_to(sc, iris, "iris", overwrite = TRUE)
iris_tbl

# K-Means Clustering
kmeans_model <- iris_tbl %>%
  select(Petal_Width, Petal_Length) %>%
  ml_kmeans(centers = 3)

# print our model fit
print(kmeans_model)