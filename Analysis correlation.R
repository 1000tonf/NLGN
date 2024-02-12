library(dplyr)

clean_biomarkers_AB_tau$pscid<- as.character(clean_biomarkers_AB_tau$pscid)
NLGN1_GNYGLLDLIQALR_join <- inner_join(NLGN1_GNYGLLDLIQALR_reads, clean_biomarkers_AB_tau, by = c("Patient.Samples"="pscid"))

plot(NLGN1_GNYGLLDLIQALR_join$X99453_analyse_csf_ab42, NLGN1_GNYGLLDLIQALR_join$GNYGLLDLIQALR, main = "GNYGLLDLIQALR", xlab = "Abeta concentration", ylab = "Peptide concentration")
lm_model <- lm(NLGN1_GNYGLLDLIQALR_join$GNYGLLDLIQALR ~ NLGN1_GNYGLLDLIQALR_join$X99453_analyse_csf_ab42)
abline(lm_model, col="red")

summary_lm <- summary(lm_model)
print(summary_lm$r.squared)

