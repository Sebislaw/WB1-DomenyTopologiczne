# Install packages ----
# install.packages("remotes")
# install.packages("strawr")

# Libraries ----
library(strawr)
library(ggplot2)

# Data from https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE63525
# GSE63525_GM12878_diploid_maternal.hic
# macierzyński fragment DNA z chromosomu diploidalnego (część DNA od matki)?
hic.data.frame <- strawr::straw("KR",
"C:/Users/Sebastian/Desktop/Semestr_4/Warsztaty badawcze 1/Projekt/repo/FirstTest/GSE63525_GM12878_diploid_maternal.hic",
"11", "11", "BP", 10000)

ggplot(hic.data.frame, aes(x = x, y = y, fill = counts)) +
  geom_tile() +
  theme_void() + guides(fill="none")
