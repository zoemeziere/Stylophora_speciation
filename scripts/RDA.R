#Environmental matrix
Spis_env_all_select <- as.data.frame(read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Habitat/env_data/Spis_env_all_select.csv", header = TRUE))

Stylo_metadata_rda <- Stylo_metadata[!(Stylo_metadata$Cluster=="Hyb"),]
Stylo_metadata_rda <- Stylo_metadata_rda[!(Stylo_metadata_rda$EcoLocationID_short=="ONLI_FR2S" | 
                                             Stylo_metadata_rda$EcoLocationID_short=="ONLI_BA1S" | 
                                             Stylo_metadata_rda$EcoLocationID_short=="TSDU_BA3S" | 
                                             Stylo_metadata_rda$EcoLocationID_short=="CBHE_LA2S"),]
Spis_env_individuals_all <- cbind(sample_name = Stylo_metadata_rda$Sample_name, Site_code = Stylo_metadata_rda$EcoLocationID_short)
Spis_env_individuals_all <- merge(Spis_env_individuals_all, Spis_env_all_select, by = "Site_code", all.x=T)
Spis_env_individuals_all <- Spis_env_individuals_all %>% arrange(sample_name)
Spis_env_individuals_std_all <- decostand(Spis_env_individuals_all[,6:21], method = "standardize")
Spis_env_individuals_std_all<- Spis_env_individuals_std_all[ , colSums(is.na(Spis_env_individuals_std_all))==0]

#Genotypes matrix
Stylo_genlight_rda <- Stylo_genlight
ind_to_drop <- c("Spis_CBHE_292", "Spis_DUN_1172", "Spis_DUN_1174", 
                 "Spis_ONLI_465", "Spis_ONLI_467", "Spis_ONLI_468", 
                 "Spis_ONLI_810", "Spis_ONLI_814", "Spis_ONLI_815", 
                 "Spis_ONLI_817", "Spis_ONLI_820", "Spis_ONLI_822", 
                 "Spis_ONLI_823", "Spis_ONMO_376", "Spis_ONMO_378", "Spis_ONMO_380")
Stylo_genlight_rda <- gl.drop.ind(Stylo_genlight_rda, ind_to_drop)
Stylo_genind_rda <- gl2gi(Stylo_genlight_rda)
Stylo_genind_rda$tab <- Stylo_genind_rda$tab[ , colSums(is.na(Stylo_genind_rda$tab))==0]
Stylo_genind_rda$tab <- decostand(Stylo_genind_rda$tab, method = "hellinger")

#Condition matrix
coordinates_all <- cbind(Spis_env_individuals_all$lat, Spis_env_individuals_all$lon)
dbmem_vectors <- dbmem(coordinates_all)

prda_spis_genomic <- rda(formula = Stylo_genind_rda$tab ~ . + Condition(dbmem_vectors$MEM1, dbmem_vectors$MEM2, dbmem_vectors$MEM3), data = Spis_env_individuals_std_all)
prda_spis_genomic_fwdsel <- ordiR2step(rda(formula = Stylo_genind_rda$tab ~ 1 + Condition(dbmem_vectors$MEM1, dbmem_vectors$MEM2, dbmem_vectors$MEM3), data = Spis_env_individuals_std_all), 
                                       scope = formula(prda_spis_genomic), direction = "forward", R2scope = TRUE, pstep = 1000, trace = FALSE)

prda_spis_genomic_sign <- rda(formula = Stylo_genind_rda$tab ~ Condition(dbmem_vectors$MEM1, dbmem_vectors$MEM2, dbmem_vectors$MEM3) + 
                                temp_mean + Secchi_max + EpiPAR_sg_max + temp_median + Depth + 
                                speed_mean + speed_median + Secchi_mean + EpiPAR_sg_median + 
                                EpiPAR_sg_mean + Secchi_median + temp_daily_range, data = Spis_env_individuals_std_all)

RsquareAdj(prda_spis_genomic_sign) 
anova.cca(prda_spis_genomic_sign, step = 1000)
anova.cca(prda_spis_genomic_sign, step = 1000, by = "term")
anova.cca(prda_spis_genomic_sign, step = 1000, by = "axis")
anova.cca(prda_spis_genomic_sign, step = 1000, by = "margin")

ii=summary(prda_spis_genomic_fwdsel)
st=as.data.frame(ii$sites[,1:2])
sp=as.data.frame(ii$species[,1:2])
yz=as.data.frame(ii$biplot[,1:2])

ggplot() +
  geom_point(data = st, aes(RDA1,RDA2, col= Stylo_metadata_rda$Cluster), size=6, alpha=0.5, stroke=0) +
  scale_colour_manual(values = c("#8a67c1", "#bf557c", "#2da0a1", "#c16d37", "#729c45")) +
  #scale_colour_manual(values = c("#a82552", "#4e8440", "#8b8b00", "#763138", "#5ac7ac", "#438d7d", "#99c648", "#c0632d", "#b62536", "#d89432", "#796c32")) +
  geom_segment(data = yz,aes(x = 0, y = 0, xend = RDA1, yend = RDA2), 
               arrow = arrow(length = unit(0.1,"cm"), type = "open"),linetype=1, size=0.3) +
  geom_text(data = yz,aes(RDA1,RDA2,label=row.names(yz)), position = position_nudge(y = 0.1), size=2) +
  labs(x=paste("RDA 1 (", format(100 *ii$cont[[1]][2,1], digits=3), "%)", sep=""),
       y=paste("RDA 2 (", format(100 *ii$cont[[1]][2,2], digits=3), "%)", sep="")) +
  theme_bw() +
  theme(axis.text=element_text(size=10), axis.title=element_text(size=10))
