library(dbplyr)
readslist <- list("NLGN2_TLLALFTDHQWVAPAVATAK.csv", "NLGN2_GGGGPGGGAPGGPGLGLGSLGEER.csv", "NLGN2_FPVVNTAYGR.csv", 
                  "NLGN2_ELVDQDVQPAR.csv", "NLGN2_ELNNEILGPVVQFLGVPYATPPLGAR.csv", "NLGN1_GNYGLLDLIQALR.csv") 

for (i in readslist) {
name <- paste(gsub(".csv","", i),"reads", sep = "_")
value <- read.csv(i)
assign(name, value)
rm(i, name, value)
}




