fnSig = "pcbc-stemsig.tsv"
rnasig <- read.delim(fnSig, header = FALSE, row.names = 1 ) %>% as.matrix() %>% drop()
load("pcbc-stemsig.p219.Rda")
#usethis::use_data(rnasig,mm,internal = T,compress = "xz",overwrite = T)
