library(dplyr)
library(rlist)
library(pipeR)
library(pbmcapply) 
library(MASS)
library(coin)
library(plyr)
library(ggplot2)
library(seqinr)
library(SpatialExtremes)
library(preprocessCore)
library(DiffScan)
library(tidyr)
# Remember to load Qmax_null.rds

# Imput data for console and build the dataframe or reading a file 
#DATA_original <- as.data.frame(R1)
#DATA_original$R2 <- R2
set.seed(123)
DATA_original <- read.table("File_with_reactivities.txt")
DATA <- DATA_original

# If Data have has NAs
# 2 options. It gives the same result but test both and comapre

DATA[is.na(DATA)] <- 0 # moving NAs to 0
DATA <- DATA %>% drop_na() # Testing removing NAs

# A1, A2, ... are replicas from the same condition. B1, B2, ... are replicas
# from the same condition... 
# Be careful and anotate which conditions are A and B.
r = list(RNA1 = tibble(A1 = DATA$Column1, A2 = DATA$Column2,
                       B1 = DATA$Column3, B2 = DATA$Column4))

# If you use other names in list, change them to A1, A2, ...
# names(r[["RNA1"]]) = c('A1', 'A2', 'B1', 'B2')

Initiation = init(r, qc_ctrl = F, ncores = 1)

Norm = normalize(Initiation, ncores = 1)

res = scan(Norm$r, seed = 123, alpha = 0.05, ncores = 1)