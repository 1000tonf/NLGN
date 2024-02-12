library(dbplyr)
library(ggplot2)

mean(NLGN1_GNYGLLDLIQALR_join$X99453_analyse_csf_ab42) #325.14
sd(NLGN1_GNYGLLDLIQALR_join$X99453_analyse_csf_ab42) #129.85

threshold_AB = 455
threshold_Tau = 350



clean_biomarkers_AB_tau["AB_positive"] = clean_biomarkers_AB_tau["X99453_analyse_csf_ab42"]> threshold_AB
clean_biomarkers_AB_tau["Tau_positive"] = clean_biomarkers_AB_tau["X99453_analyse_csf_tau_total"]> threshold_Tau

clean_biomarkers_AB_tau$pscid<- as.character(clean_biomarkers_AB_tau$pscid)
left_NLGN1_GNYGLLDLIQALR <- left_join(NLGN1_GNYGLLDLIQALR_reads, clean_biomarkers_AB_tau, by = c("Patient.Samples"="pscid"))
right_NLGN1_GNYGLLDLIQALR <- right_join(NLGN1_GNYGLLDLIQALR_reads, clean_biomarkers_AB_tau, by = c("Patient.Samples"="pscid"))

#AB
ggplot(NLGN1_GNYGLLDLIQALR_join, aes(x = NLGN1_GNYGLLDLIQALR_join$AB_positive, y = NLGN1_GNYGLLDLIQALR_join$GNYGLLDLIQALR)) +
  geom_boxplot(width = 0.3) + geom_jitter(size = 2, width = 0.2) +
  labs(x = "AB_positive", y = "Peptide Value", title = "AB positive vs negative") +
  scale_fill_manual(values = c("FALSE" = "red", "TRUE" = "green")) +
  theme_minimal()+
  facet_wrap(~Patient.diagnostic)

#Tau
ggplot(NLGN1_GNYGLLDLIQALR_join, aes(x = NLGN1_GNYGLLDLIQALR_join$Tau_positive, y = NLGN1_GNYGLLDLIQALR_join$GNYGLLDLIQALR)) +
  geom_boxplot(width = 0.3) + geom_jitter(size = 2, width = 0.2) +
  labs(x = "Tau_positive", y = "Peptide Value", title = "Tau positive vs negative") +
  scale_fill_manual(values = c("FALSE" = "red", "TRUE" = "green")) +
  theme_minimal() +
  facet_wrap(~Patient.diagnostic)
