#Import table
biomarkers <- read.delim("99453_prelevements_biomarqueurs.tsv")
#Select columns of interest
biomarkers_AB_tau <- select(biomarkers, pscid, X99453_analyse_csf_ab42, X99453_analyse_csf_tau_total )
#Transform NULL in NA
biomarkers_AB_tau$X99453_analyse_csf_ab42 [biomarkers_AB_tau$X99453_analyse_csf_ab42 == "NULL"] <- NA
biomarkers_AB_tau$X99453_analyse_csf_tau_total [biomarkers_AB_tau$X99453_analyse_csf_tau_total == "NULL"] <- NA
#Transform in numeric
biomarkers_AB_tau$X99453_analyse_csf_ab42 <- as.numeric(biomarkers_AB_tau$X99453_analyse_csf_ab42)
biomarkers_AB_tau$X99453_analyse_csf_tau_total<- as.numeric(biomarkers_AB_tau$X99453_analyse_csf_tau_total)
#Exclude NA
clean_biomarkers_AB_tau <- na.omit(biomarkers_AB_tau)
#Histograms
hist(biomarkers_AB_tau$X99453_analyse_csf_ab42, main = "Abeta 42", xlab = "Concentration ng/l", ylab = "Frequencies")
hist(biomarkers_AB_tau$X99453_analyse_csf_tau_total, main = "Tau", xlab = "Concentration ng/l", ylab = "Frequencies")
