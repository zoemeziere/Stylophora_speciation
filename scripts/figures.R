### Scripts used to generate all figures

#### Load required packages ####

library(SNPRelate)
library(vcfR)
library(adegenet)
library(ggplot2)
library(ape)
library(tidyverse)
library(tidyr)
library(dartR)
library(ozmaps)
library(sf)
library(dplyr)
library(scatterpie)
library(ggrepel)
library(hierfstat)


#### Load VCF file, metadata and convert files  ####

Stylo_vcf <- readData("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/PCA/vcf", format = "VCF", include.unknown = TRUE, FAST = TRUE)

# Coordinates

sites_coordinates <- read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Maps/sites_coordinates.csv", header = TRUE)
Moore_coordinates <- read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Maps/Moore_coordinates.csv", header = TRUE)
Moore_coordinates_nodepth<- read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Maps/Moore_coordinates_nodepth.csv", header = TRUE)
clusters_coords <- read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Maps/EcoCluster_coord.csv", header = TRUE)

# Metadata for whole dataset

Stylo_metadata <- read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/metadata/Stylo_clusters_metadata.csv")
Stylo_clusters_metadata <- read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/metadata/Stylo_clusters_metadata.csv")
Stylo_nohyb_metadata <- subset(Stylo_clusters_metadata, Cluster != 'Hyb')

Stylo_genlight <- gl.read.vcf("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/PCA/Stylo_sf095_noclones_ld.vcf")
Stylo_genlight$pop <- as.factor(Stylo_clusters_metadata$Sample_name)
Stylo_genlight$ind.names <- Stylo_clusters_metadata$Sample_name
Stylo_genind <- gl2gi(Stylo_genlight)

Stylo_nohyb_genlight <- popsub(Stylo_genlight, sublist = Stylo_nohyb_metadata$Sample_name)
Stylo_nohyb_genind <- gl2gi(Stylo_nohyb_genlight)
Stylo_nohyb_hier <- genind2hierfstat(Stylo_nohyb_genind)
Stylo_nohyb_hier$pop <- Stylo_nohyb_metadata$Cluster

# By taxa

cluster1_genlight <- gl.read.vcf("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/vcf_files/Stylo_sf095_noclones_cluster1_ld.vcf")
cluster1_genlight$pop <- as.factor(cluster1_genlight$ind.names)
cluster2_genlight <- gl.read.vcf("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/vcf_files/Stylo_sf095_noclones_cluster2_ld.vcf")
cluster3_genlight <- gl.read.vcf("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/vcf_files/Stylo_sf095_noclones_cluster3_ld.vcf")
cluster4_genlight <- gl.read.vcf("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/vcf_files/Stylo_sf095_noclones_cluster4_ld.vcf")
cluster5_genlight <- gl.read.vcf("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/vcf_files/Stylo_sf095_noclones_cluster5_ld.vcf")

# By geographic regions

south_metadata  <- subset(Stylo_clusters_metadata, EcoClusterID == 'Offshore South GBR')
north_metadata  <- subset(Stylo_clusters_metadata, EcoClusterID == 'Offshore North GBR')
inshore_central_metadata <- subset(Stylo_clusters_metadata, EcoClusterID == 'Inshore Central GBR')
offshore_central_metadata <- subset(Stylo_clusters_metadata, EcoClusterID == 'Offshore Central GBR')
ts_metadata <- subset(Stylo_clusters_metadata, EcoClusterID == 'Torres Strait')

south_genlight <- popsub(Stylo_genlight, sublist = south_metadata$Sample_name)
north_genlight <- popsub(Stylo_genlight, sublist = north_metadata$Sample_name)
inshore_central_genlight <- popsub(Stylo_genlight, sublist = inshore_central_metadata$Sample_name)
offshore_central_genlight <- popsub(Stylo_genlight, sublist = offshore_central_metadata$Sample_name)
ts_genlight <- popsub(Stylo_genlight, sublist = ts_metadata$Sample_name)

south_genind <- gl2gi(south_genlight)
north_genind <- gl2gi(north_genlight)
inshore_central_genind <- gl2gi(inshore_central_genlight)
offshore_central_genind <- gl2gi(offshore_central_genlight)
ts_genind <- gl2gi(ts_genlight)

heron_metadata  <- subset(Stylo_clusters_metadata, locality == 'Heron')
heron_genlight <- popsub(Stylo_genlight, sublist = heron_metadata$Sample_name)
heron_genind <- gl2gi(heron_genlight)

Davies_metadata  <- subset(Stylo_clusters_metadata, locality == 'Davies')
Davies_genlight <- popsub(Stylo_genlight, sublist = Davies_metadata$Sample_name)
Davies_genind <- gl2gi(Davies_genlight)

Lizard_metadata  <- subset(Stylo_clusters_metadata, locality == 'Lizard')
Lizard_genlight <- popsub(Stylo_genlight, sublist = Lizard_metadata$Sample_name)
Lizard_genind <- gl2gi(Lizard_genlight)

Moore_metadata  <- subset(Stylo_clusters_metadata, locality == 'Moore')
Moore_genlight <- popsub(Stylo_genlight, sublist = Moore_metadata$Sample_name)
Moore_genind <- gl2gi(Moore_genlight)

#### Figure 1 ####

setEPS()
postscript("/Users/zoemeziere/Documents/PhD/Chapter1_writting/Figures/GBRmap.ps")
ggplot(data = gbr_feat) +
  theme_bw() +
  theme(axis.title.x = element_blank(), axis.title.y = element_blank(), 
        axis.text.x = element_text(size=8), axis.text.y = element_text(size=8)) +
  geom_sf(lwd = 0.01, fill = "grey") +
  coord_sf(xlim = c(142, 155), ylim = c(-25, -9)) +
  annotation_scale(location = "bl", width_hint = 0.5) +
  annotation_north_arrow(location = "bl", which_north = "true",
                         pad_x = unit(0.25, "in"), pad_y = unit(0.4, "in"),
                         style = north_arrow_fancy_orienteering) +
  geom_point(data = sites_coordinates, mapping = aes(x = Long, y = Lat), alpha = 1, size = 4, colour = "Brown3") 
  #geom_text_repel(data = sites_coordinates, mapping = aes(x = Long, y = Lat, label = Site),  hjust = 0, vjust = 0)
dev.off()

ggplot(data = gbr_feat) +
  theme_void() +
  geom_sf(lwd = 0.01, fill = "grey") +
  coord_sf(xlim = c(146.15, 146.33), ylim = c(-16.83, -16.95)) +
  geom_point(data = Moore_coordinates_nodepth, mapping = aes(x = Long, y = Lat), size = 5, colour = "grey20") 
  #geom_text_repel(data = Moore_coordinates_nodepth, mapping = aes(x = Long, y = Lat, label = Habitat),  hjust = 0, vjust = 0, size = 4)

#### Figure 2A ####

PCA_all <- glPca(Stylo_genlight, parallel= TRUE) 
PCA_all.df <- as.data.frame(PCA_all$scores)
PC=1:10
pve_all <- data.frame(PC, 100*PCA_all$eig[1:10]/sum(PCA_all$eig[1:10]))

ggplot(pve_all, aes(PC, pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..)) + 
  geom_bar(stat = "identity") +
  ylab("Percentage variance explained") + 
  ylim(0,50) +
  theme_light() 

ggplot(PCA_all.df, aes(PC1, PC2, col = Stylo_clusters_metadata$Cluster)) + 
  geom_point(stroke= 0, size=8, alpha=0.5, show.legend = TRUE) +
  scale_colour_manual(values = c("#8a67c1", "#ca586e", "#2da0a1", "#c16d37", "#729c45", "#b99a2d")) +
  coord_equal() + theme_bw() + theme(legend.position = "none", axis.text=element_text(size=16), axis.title=element_text(size=16)) +
  labs(x= paste0("PC1 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[1], 3), "%)"),
       y = paste0("PC2 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[2], 3), "%)"))

#### Figure 2B ####
australia <- ozmaps::ozmap_states
qld <- australia %>% filter(NAME == "Queensland")
clusters_coords$total <- rowSums(clusters_coords[,c("Cluster1","Cluster2","Cluster3","Cluster4","Cluster5")])
clusters_coords <- drop_na(clusters_coords) 
clusters_coords$radius <- c("0.5", "0.6", "0.7", "0.8", "0.7", "0.6")
clusters_coords <- clusters_coords[1:6,]

ggplot(data = gbr_feat) +
  theme_bw() +
  theme(axis.title.x = element_blank(), axis.title.y = element_blank(), 
        legend.position = "none", axis.text=element_text(size=20)) +
  geom_sf(lwd = 0.01, fill = "grey") +
  coord_sf(xlim = c(142, 155), ylim = c(-25, -9)) +
  annotation_scale(location = "bl", width_hint = 0.5) +
  annotation_north_arrow(location = "bl", which_north = "true",
                         pad_x = unit(0.25, "in"), pad_y = unit(0.4, "in"),
                         style = north_arrow_fancy_orienteering) +
  scale_x_continuous(breaks = seq(142, 154, by =3)) +
  geom_scatterpie(data=as.data.frame(clusters_coords), aes(x=Long, y=Lat), cols= c("Cluster1","Cluster2","Cluster3","Cluster4","Cluster5"), color=NA, pie_scale = 5) +
  scale_fill_manual(values = c("#8a67c1", "#bf557c", "#2da0a1", "#c16d37", "#729c45")) 

#### Figure 2C ####
K6_admixture <- read.table("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Admixture/all/Stylo_sf095_noclones_ld.6.Q")

K6_all <- cbind(Stylo_clusters_metadata, K6_admixture)
K6_all <- gather(K6_all, key="V", value="probK6", 22:27)

K6cols <- c("V1" = "#7a4988", "V2" = "#729c45", "V3" = "#2da0a1", "V4" = "#bf557c", "V5" = "#8a67c1", "V6" = "#c16d37")

K6_all_plot <-
  ggplot(K6_all, aes(factor(Sample_name), probK6, fill = factor(V))) +
  geom_col(position='dodge') +
  scale_fill_manual(values = K6cols) +
  facet_grid(~fct_inorder(Stylo_clusters_metadata$Cluster), switch = "x", scales = "free", space = "free") +
  theme_minimal(base_size =20) + labs(title = "K=6", y = "Ancestry proportion", x = "") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_discrete(expand = expand_scale(add = 1)) +
  theme(
    panel.spacing.x = unit(0.1, "lines"),
    axis.text.x = element_blank(),
    panel.grid = element_blank(),
    legend.position="none",
    plot.margin = unit(c(0, 0, 0, 0), "null"),
    strip.clip = "off")  

#### Figure 3 ####

fst_between_pops <- read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Diversity/fst_pops_ordered.csv", header = TRUE)
plot_M <- ggplot(data = fst_between_pops, aes(x=Fst, y=M, color=Cluster_same)) +
  geom_point(size=8, alpha=0.6) +
  scale_color_manual(values=c('#003568', '#7a0f00')) +
  theme_bw(base_size = 20) +
  ylab("Estimated migration rate") +
  theme(legend.position = "none")

plot_T <- ggplot(data = fst_between_pops, aes(x=Fst, y=T, color=Cluster_same)) +
  geom_point(size=8, alpha=0.6) +
  scale_color_manual(values=c('#003568', '#7a0f00')) +
  theme_bw(base_size = 20) +
  ylab("Estimated divergence time") +
  theme(legend.position = "none")

plots <- plot_M + plot_T + plot_layout(nrow  = 2)
ggsave(file="plotsMT.svg", plot=plots, width=6, height=7)

fst_between_pops <- data.frame(fst_between_pops)
fst_between_pops$Cluster_sympatry_ordered = factor(fst_between_pops$Cluster_sympatry, levels=c('C1_allopatry','C2_allopatry','C3_allopatry','C4_allopatry', 'C5_allopatry', 
                                                                                               'C1-C2_allopatry', 'C1-C3_allopatry', 'C1-C3_sympatry', 'C1-C4_allopatry', 'C1-C4_sympatry','C1-C5_allopatry', 'C1-C5_sympatry', 'C2-C3_allopatry', 
                                                                                               'C2-C4_allopatry', 'C2-C4_sympatry','C2-C5_allopatry', 'C3-C4_allopatry', 'C3-C4_sympatry', 'C3-C5_allopatry', 'C3-C5_sympatry','C4-C5_allopatry', 'C4-C5_sympatry'))

fst_between_pops$Cluster_ordered = factor(fst_between_pops$Cluster, levels=c('C1-C1','C2-C2','C3-C3',
                                                                             'C5-C5','C4-C4','C1-C2',
                                                                             'C4-C5','C2-C3','C1-C3',
                                                                             'C2-C5','C3-C4','C2-C4',
                                                                             'C1-C4','C3-C5','C1-C5'))
fst_between_pops$dadi <- 'no'
fst_between_pops$dadi[which(fst_between_pops$Pair=='Cluster4_Heron-Cluster5_Heron'|
                              fst_between_pops$Pair=='Cluster1_Lizard-Cluster2_Masig'|
                              fst_between_pops$Pair=='Cluster1_Heron-Cluster5_Heron'| 
                              fst_between_pops$Pair=='Cluster1_Lady Musgrave-Cluster5_Lady Musgrave'|
                              fst_between_pops$Pair=='Cluster1_Chicken-Cluster3_Chicken'|
                              fst_between_pops$Pair=='Cluster1_Moore-Cluster3_Moore'|
                              fst_between_pops$Pair=='Cluster5_Heron-Cluster5_Lady Musgrave'|
                              fst_between_pops$Pair=='Cluster2_Aukane-Cluster2_Masig'|
                              fst_between_pops$Pair=='Cluster1_Heron-Cluster1_Lizard'|
                              fst_between_pops$Pair=='Cluster3_Chicken-Cluster3_Moore')] <- 'yes'

fstplot<- fst_between_pops %>%
  mutate(name = fct_reorder(Cluster_ordered, Fst)) %>%
  ggplot(aes(x=Fst, y=Cluster_ordered, color=Cluster_same)) + 
  geom_point(size=8, alpha=0.6) + 
  scale_color_manual(values=c('#003568', '#7a0f00')) +
  theme_bw(base_size = 20) +
  xlab("Genetic Differentiation (Fst)") +
  theme(axis.title.y = element_blank(), legend.position = "none")

ggsave(file="plotfst.svg", plot=fstplot, width=9, height=7)

### FIGURE 4 ###

spis_env_matrix_noTS <- as.data.frame(read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Habitat/env_data/Spis_env_abundance_noTS.csv", header = TRUE))
spis_env_matrix_noTS <- spis_env_matrix_noTS[!(spis_env_matrix$Cluster=="Torres Strait"),]
spis_env_matrix_noTS <- spis_env_matrix_noTS[rowSums(is.na(spis_env_matrix_noTS))==0,]
spis_env_matrix_noTS_std <- decostand(spis_env_matrix_noTS[,6:91],method = "standardize")
spis_env_matrix_noTS <- cbind(spis_env_matrix_noTS_std, spis_env_matrix_noTS$Reef, spis_env_matrix_noTS$Zone)

spis_abundance_matrix <- as.data.frame(read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Habitat/env_data/Spis_abundance.csv", header = TRUE))
spis_abundance_matrix <- drop_na(spis_abundance_matrix)
spis_abundance_matrix_noTS <- spis_abundance_matrix[1:53,]
spis_abundance_matrix_noTS <- spis_abundance_matrix_noTS[!(spis_abundance_matrix_noTS$Site_code=="CBHE_FL1S" | spis_abundance_matrix_noTS$Site_code=="ONLI_BA1S" | spis_abundance_matrix_noTS$Site_code=="ONLI_FR2S"),]
spis_abundance_matrix_noTS <- decostand(spis_abundance_matrix_noTS[,2:6], method = "hellinger")
spis_abundance_matrix_noTS <- spis_abundance_matrix_noTS[,c("Cluster1", "Cluster3", "Cluster4", "Cluster5")]

spis_env_matrix_noTS_select <- subset(spis_env_matrix_noTS, select = c(Depth,`spis_env_matrix_noTS$Zone`,temp_mean,temp_max,temp_daily_range,speed_mean,
                                                                       EpiPAR_sg_mean,EpiPAR_sg_max,Secchi_mean,
                                                                       Secchi_max,ubed90_median, `spis_env_matrix_noTS$Reef`))
spis_env_matrix_noTS_select <- spis_env_matrix_noTS_select %>% 
  rename(Habitat = `spis_env_matrix_noTS$Zone`,
    Temp_daily_range = temp_daily_range,
    Mean_light_intensity = EpiPAR_sg_mean)
  
prda_spis_abundance_noTS <- rda(formula = spis_abundance_matrix_noTS ~ . + Condition(`spis_env_matrix_noTS$Reef`), data = spis_env_matrix_noTS_select)
RsquareAdj(prda_all_fwdsel) 

prda_all_fwdsel <- ordiR2step(rda(formula = spis_abundance_matrix_noTS ~ 1 + Condition(`spis_env_matrix_noTS$Reef`), data = spis_env_matrix_noTS_select),
                              scope = formula(prda_spis_abundance_noTS), 
                              direction = "forward",
                              R2scope = TRUE, 
                              pstep = 1000, trace = FALSE)

finalpRDA <- rda(formula = spis_abundance_matrix_noTS ~ Condition(`spis_env_matrix_noTS$Reef`) + 
               Habitat + Temp_daily_range + Secchi_max + 
               Mean_light_intensity, data = spis_env_matrix_noTS_select)
RsquareAdj(finalpRDA) 
anova.cca(final, step = 1000, by = "term")
anova.cca(final, step = 1000, by = "axis")
anova.cca(final, step = 1000, by = "margin")

clusters <- c(1,3,4,5)

ii=summary(finalpRDA)
st=as.data.frame(ii$sites[,1:2])
sp=as.data.frame(ii$species[,1:2])
yz=as.data.frame(ii$biplot[,1:2])
plot <- ggplot() +
  geom_point(data = st,aes(RDA1,RDA2),size=2, color="grey") +
  geom_point(data = sp,aes(RDA1,RDA2),size=10, stroke = 4, shape=21, color= c("Cluster1"="#8a67c1", "Cluster3"="#2da0a1", "Cluster4"="#c16d37", "Cluster5"="#729c45")) +
  #geom_text(data = sp, aes(RDA1,RDA2,label=row.names(sp)), position = position_nudge(y = -0.05), size=8) +
  geom_segment(data = yz,aes(x = 0, y = 0, xend = RDA1, yend = RDA2), 
               arrow = arrow(angle=22.5,length = unit(0.35,"cm"),
                             type = "open"),linetype=1, size=0.6) +
  geom_text(data = yz,aes(RDA1,RDA2,label=row.names(yz)), position = position_nudge(y= 0.1, x= -0.1), size=8) +
  labs(x=paste("RDA 1 (", format(100 *ii$cont[[1]][2,1], digits=3), "%)", sep=""),
       y=paste("RDA 2 (", format(100 *ii$cont[[1]][2,2], digits=3), "%)", sep="")) +
  geom_hline(yintercept=0,linetype=3,size=0.5) + 
  geom_vline(xintercept=0,linetype=3,size=0.5) +
  theme_bw() +
  theme(axis.text=element_text(size=20), axis.title=element_text(size=20))

ggsave(file="prda.svg", plot=plot, width=10, height=7)

#### Figure 4 ####

#### Figure 5 ####

#Environmental matrix
Spis_env_all_select <- as.data.frame(read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Habitat/env_data/Spis_env_all_select.csv", header = TRUE))
Spis_env_all_select2 <- as.data.frame(read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Habitat/env_data/Spis_env_all_select2.csv", header = TRUE))

Stylo_metadata_rda <- Stylo_metadata[!(Stylo_metadata$Cluster=="Hyb"),]
Stylo_metadata_rda <- Stylo_metadata_rda[!(Stylo_metadata_rda$EcoLocationID_short=="ONLI_FR2S" | 
                                             Stylo_metadata_rda$EcoLocationID_short=="ONLI_BA1S" | 
                                             Stylo_metadata_rda$EcoLocationID_short=="TSDU_BA3S" | 
                                             Stylo_metadata_rda$EcoLocationID_short=="CBHE_LA2S"),]
Spis_env_individuals_all <- cbind(sample_name = Stylo_metadata_rda$Sample_name, Site_code = Stylo_metadata_rda$EcoLocationID_short)
Spis_env_individuals_all <- merge(Spis_env_individuals_all, Spis_env_all_select2, by = "Site_code", all.x=T)
Spis_env_individuals_all <- Spis_env_individuals_all %>% arrange(sample_name)
Spis_env_individuals_std_all <- decostand(Spis_env_individuals_all[,6:15], method = "standardize")
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
                                temp_mean + Secchi_mean + EpiPAR_sg_mean + Depth + 
                                speed_mean + speed_median, data = Spis_env_individuals_std_all)

RsquareAdj(prda_spis_genomic_sign) 
anova.cca(prda_spis_genomic_sign, step = 1000)
anova.cca(prda_spis_genomic_sign, step = 1000, by = "term")
anova.cca(prda_spis_genomic_sign, step = 1000, by = "axis")
anova.cca(prda_spis_genomic_sign, step = 1000, by = "margin")

ii=summary(prda_spis_genomic_fwdsel)
st=as.data.frame(ii$sites[,1:2])
sp=as.data.frame(ii$species[,1:2])
yz=as.data.frame(ii$biplot[,1:2])

pdf("RDA_genotypes_all_taxa2.pdf", width = 10, height = 5)
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
dev.off()


