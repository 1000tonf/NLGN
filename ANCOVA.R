library(dplyr)
NLGN1_GNYGLLDLIQALR_reads$Patient.diagnostic[NLGN1_GNYGLLDLIQALR_reads$Patient.diagnostic == "Cognitivement_sain_(CS)"]<-"cognitivement_sain_(cs)"
Peptide_Age <- inner_join(NLGN1_GNYGLLDLIQALR_reads, clean_biomarkers_age, by= c("Patient.Samples" = "pscid"))


ancova_model <- lm(`GNYGLLDLIQALR` ~ `Patient.diagnostic` + `âge_du_participant`, data = Peptide_Age)

summary(ancova_model)

library(ggplot2)

Peptide_Age_CS_AD <- filter(Peptide_Age, Patient.diagnostic == "cognitivement_sain_(cs)"|Patient.diagnostic == "démence_de_type_alzheimer-légère")
Peptide_Age_CS <- filter(Peptide_Age, Patient.diagnostic == "cognitivement_sain_(cs)")
Peptide_Age_AD <- filter(Peptide_Age, Patient.diagnostic == "démence_de_type_alzheimer-légère")

plot <- ggplot() + 
  xlab("Age") +
  ylab("Peptide") +
  theme_minimal()

plot <- plot + geom_point(data = Peptide_Age_CS_AD, aes(x = `âge_du_participant`, y = `GNYGLLDLIQALR`, color = `Patient.diagnostic` ), alpha = 0.5)

# Fit a linear regression model for the group
lm_model <- lm(`GNYGLLDLIQALR` ~ `âge_du_participant`, data = Peptide_Age_CS)
# Add data points
plot <- plot + geom_smooth(data = Peptide_Age_CS, aes(x = `âge_du_participant`, y = `GNYGLLDLIQALR`), method = "lm", se = FALSE, color = "black")

# Fit a linear regression model for the group
lm_model <- lm(`GNYGLLDLIQALR` ~ `âge_du_participant`, data = Peptide_Age_AD)
# Add data points
plot <- plot + geom_smooth(data = Peptide_Age_AD, aes(x = `âge_du_participant`, y = `GNYGLLDLIQALR`), method = "lm", se = FALSE, color = "black")


