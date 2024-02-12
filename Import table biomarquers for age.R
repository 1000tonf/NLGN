#Import table
biomarkers <- read.delim("99453_prelevements_biomarqueurs.tsv")
#Select columns of interest
biomarkers_age <- select(biomarkers, pscid, âge_du_participant )
#Transform NULL in NA
biomarkers_age$âge_du_participant[biomarkers_age$âge_du_participant =="NULL"] <- NA
#Transform in numeric (age) or character (pscid)
biomarkers_age$âge_du_participant<- as.numeric(biomarkers_age$âge_du_participant)
biomarkers_age$pscid <- as.character(biomarkers_age$pscid)
#Exclude NA
clean_biomarkers_age <- na.omit(biomarkers_age)
#Histogram
hist(biomarkers_age$âge_du_participant, main = "Age", xlab = "Concentration ng/l", ylab = "Frequencies")
