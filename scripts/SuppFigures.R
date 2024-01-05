#Script for Supplementary Figures

#### Figure S1 ####
setwd("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Admixture/all")

K2_all <- cbind(Stylo_clusters_metadata, read.table("Stylo_sf095_noclones_ld.2.Q"))
K3_all <- cbind(Stylo_clusters_metadata, read.table("Stylo_sf095_noclones_ld.3.Q"))
K4_all <- cbind(Stylo_clusters_metadata, read.table("Stylo_sf095_noclones_ld.4.Q"))
K5_all <- cbind(Stylo_clusters_metadata, read.table("Stylo_sf095_noclones_ld.5.Q"))
K6_all <- cbind(Stylo_clusters_metadata, read.table("Stylo_sf095_noclones_ld.6.Q"))
K7_all <- cbind(Stylo_clusters_metadata, read.table("Stylo_sf095_noclones_ld.7.Q"))
K8_all <- cbind(Stylo_clusters_metadata, read.table("Stylo_sf095_noclones_ld.8.Q"))
K9_all <- cbind(Stylo_clusters_metadata, read.table("Stylo_sf095_noclones_ld.9.Q"))
K10_all <- cbind(Stylo_clusters_metadata, read.table("Stylo_sf095_noclones_ld.10.Q"))

K2_all <- gather(K2_all, key="V", value="probK2", 22:23)
K3_all <- gather(K3_all, key="V", value="probK3", 22:24)
K4_all <- gather(K4_all, key="V", value="probK4", 22:25)
K5_all <- gather(K5_all, key="V", value="probK5", 22:26)
K6_all <- gather(K6_all, key="V", value="probK6", 22:27)
K7_all <- gather(K7_all, key="V", value="probK7", 22:28)
K8_all <- gather(K8_all, key="V", value="probK8", 22:29)
K9_all <- gather(K9_all, key="V", value="probK9", 22:30)
K10_all <- gather(K10_all, key="V", value="probK10", 22:31)

K2cols <- c("V1" = "#2da0a1", "V2" = "#729c45")

K2_all_plot <- ggplot(K2_all, aes(factor(Sample_name), probK2, fill = factor(V))) +
  geom_col(size = 0.1) +
  scale_fill_manual(values = K2cols) +
  facet_grid(~fct_inorder(Stylo_clusters_metadata$Cluster), switch = "x", scales = "free", space = "free") +
  theme_minimal(base_size =15) + labs(title = "K=2", y = "Ancestry proportion", x = "") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_discrete(expand = expand_scale(add = 1)) +
  theme(
    panel.spacing.x = unit(0.1, "lines"),
    axis.text.x = element_blank(),
    plot.title = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid = element_blank(),
    legend.position="none",
    plot.margin = unit(c(0, 0, 0, 0), "null"))

K3cols <- c("V1" = "#2da0a1", "V2" = "#729c45", "V3" = "#8a67c1")

K3_all_plot <-
  ggplot(K3_all, aes(factor(Sample_name), probK3, fill = factor(V))) +
  geom_col(size = 0.1) +
  scale_fill_manual(values = K3cols) +
  facet_grid(~fct_inorder(Stylo_clusters_metadata$Cluster), switch = "x", scales = "free", space = "free") +
  theme_minimal(base_size =15) + labs(title = "K=3", y = "Ancestry proportion", x = "") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_discrete(expand = expand_scale(add = 1)) +
  theme(
    panel.spacing.x = unit(0.1, "lines"),
    axis.text.x = element_blank(),
    plot.title = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid = element_blank(),
    legend.position="none",
    plot.margin = unit(c(0, 0, 0, 0), "null"))

K4cols <- c("V1" = "#729c45", "V2" = "#2da0a1", "V3" = "#7a4988", "V4" = "#8a67c1")

K4_all_plot <-
  ggplot(K4_all, aes(factor(Sample_name), probK4, fill = factor(V))) +
  geom_col(size = 0.1) +
  scale_fill_manual(values = K4cols) +
  facet_grid(~fct_inorder(Stylo_clusters_metadata$Cluster), switch = "x", scales = "free", space = "free") +
  theme_minimal(base_size =15) + labs(title = "K=4", y = "Ancestry proportion", x = "") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_discrete(expand = expand_scale(add = 1)) +
  theme(
    panel.spacing.x = unit(0.1, "lines"),
    axis.text.x = element_blank(),
    plot.title = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid = element_blank(),
    legend.position="none",
    plot.margin = unit(c(0, 0, 0, 0), "null"))

K5cols <- c("V1" = "#bf557c", "V2" = "#8a67c1", "V3" = "#729c45", "V4" = "#7a4988", "V5" = "#2da0a1")

K5_all_plot <-
  ggplot(K5_all, aes(factor(Sample_name), probK5, fill = factor(V))) +
  geom_col(size = 0.1) +
  scale_fill_manual(values = K5cols) +
  facet_grid(~fct_inorder(Stylo_clusters_metadata$Cluster), switch = "x", scales = "free", space = "free") +
  theme_minimal(base_size =15) + labs(title = "K=5", y = "Ancestry proportion", x = "") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_discrete(expand = expand_scale(add = 1)) +
  theme(
    panel.spacing.x = unit(0.1, "lines"),
    axis.text.x = element_blank(),
    plot.title = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid = element_blank(),
    legend.position="none",
    plot.margin = unit(c(0, 0, 0, 0), "null"))

K6cols <- c("V1" = "#7a4988", "V2" = "#729c45", "V3" = "#2da0a1", "V4" = "#bf557c", "V5" = "#8a67c1", "V6" = "#c16d37")

K6_all_plot<- ggplot(K6_all, aes(factor(Sample_name), probK6, fill = factor(V))) +
  geom_col(size = 0.1) +
  scale_fill_manual(values = K6cols) +
  facet_grid(~fct_inorder(Stylo_clusters_metadata$Cluster), switch = "x", scales = "free", space = "free") +
  theme_minimal(base_size =15) + labs(title = "K=6", y = "Ancestry proportion", x = "") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_discrete(expand = expand_scale(add = 1)) +
  theme(
    panel.spacing.x = unit(0.1, "lines"),
    axis.text.x = element_blank(),
    plot.title = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid = element_blank(),
    legend.position="none",
    plot.margin = unit(c(0, 0, 0, 0), "null"))    


K7cols <- c("V1" = "#2da0a1", "V2" = "#7a4988", "V3" = "#bf557c", "V4" = "#c16d37", "V5" = "purple", "V6" = "#8a67c1", "V7"="#729c45")

K7_all_plot<- ggplot(K7_all, aes(factor(Sample_name), probK7, fill = factor(V))) +
  geom_col(size = 0.1) +
  scale_fill_manual(values = K7cols) +
  facet_grid(~fct_inorder(Stylo_clusters_metadata$Cluster), switch = "x", scales = "free", space = "free") +
  theme_minimal(base_size =15) + labs(title = "K=7", y = "Ancestry proportion", x = "") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_discrete(expand = expand_scale(add = 1)) +
  theme(
    panel.spacing.x = unit(0.1, "lines"),
    axis.text.x = element_blank(),
    plot.title = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid = element_blank(),
    legend.position="none",
    plot.margin = unit(c(0, 0, 0, 0), "null"))    

K8cols <- c("V1" = "#2da0a1", "V2" = "#7a4988", "V3" = "#8a67c1", "V4" = "#bf557c", "V5" = "maroon", "V6" = "#729c45", "V7"="purple", "V8"="#c16d37")

K8_all_plot<- ggplot(K8_all, aes(factor(Sample_name), probK8, fill = factor(V))) +
  geom_col(size = 0.1) +
  scale_fill_manual(values = K8cols) +
  facet_grid(~fct_inorder(Stylo_clusters_metadata$Cluster), switch = "x", scales = "free", space = "free") +
  theme_minimal(base_size =15) + labs(title = "K=8", y = "Ancestry proportion", x = "") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_discrete(expand = expand_scale(add = 1)) +
  theme(
    panel.spacing.x = unit(0.1, "lines"),
    axis.text.x = element_blank(),
    plot.title = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid = element_blank(),
    legend.position="none",
    plot.margin = unit(c(0, 0, 0, 0), "null"))

K9cols <- c("V1" = "maroon", "V2" = "plum1", "V3" = "#bf557c", "V4" = "#c16d37", "V5" = "#8a67c1", "V6" = "purple", "V7"="#729c45", "V8"="#2da0a1", "V9"="#7a4988")

K9_all_plot<- ggplot(K9_all, aes(factor(Sample_name), probK9, fill = factor(V))) +
  geom_col(size = 0.1) +
  scale_fill_manual(values = K9cols) +
  facet_grid(~fct_inorder(Stylo_clusters_metadata$Cluster), switch = "x", scales = "free", space = "free") +
  theme_minimal(base_size =15) + labs(title = "K=9", y = "Ancestry proportion", x = "") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_discrete(expand = expand_scale(add = 1)) +
  theme(
    panel.spacing.x = unit(0.1, "lines"),
    axis.text.x = element_blank(),
    plot.title = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid = element_blank(),
    legend.position="none",
    plot.margin = unit(c(0, 0, 0, 0), "null"))

K10cols <- c("V1" = "#c16d37", "V2" = "#8a67c1", "V3" = "#7a4988", "V4" = "darkolivegreen", "V5" = "plum1", "V6" = "#bf557c", "V7"="#729c45", "V8"="purple", "V9"="maroon" ,"V10"="#2da0a1")

K10_all_plot<- ggplot(K10_all, aes(factor(Sample_name), probK10, fill = factor(V))) +
  geom_col(size = 0.1) +
  scale_fill_manual(values = K10cols) +
  facet_grid(~fct_inorder(Stylo_clusters_metadata$Cluster), switch = "x", scales = "free", space = "free") +
  theme_minimal(base_size =15) + labs(title = "K=10", y = "Ancestry proportion", x = "") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_discrete(expand = expand_scale(add = 1)) +
  theme(
    panel.spacing.x = unit(0.1, "lines"),
    axis.text.x = element_blank(),
    plot.title = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid = element_blank(),
    legend.position="none",
    plot.margin = unit(c(0, 0, 0, 0), "null"))

pdf(file = "/Users/zoemeziere/Desktop/FigureS1.pdf", width = 6, height = 10)
K2_all_plot + K3_all_plot + K4_all_plot + K5_all_plot + 
  K6_all_plot + K7_all_plot + K8_all_plot + K9_all_plot + K10_all_plot + plot_layout(nrow  = 10)
dev.off()

PCA_all <- glPca(Stylo_genlight, parallel= TRUE) 
PCA_all.df <- as.data.frame(PCA_all$scores)
PC=1:10
pve_all <- data.frame(PC, 100*PCA_all$eig[1:10]/sum(PCA_all$eig[1:10]))

PC1PC2 <- ggplot(PCA_all.df, aes(PC1, PC2, col = Stylo_clusters_metadata$Cluster)) + 
  geom_point(stroke= 0, size=8, alpha=0.5, show.legend = TRUE) +
  scale_colour_manual(values = c("#8a67c1", "#bf557c", "#2da0a1", "#c16d37", "#729c45", "gold")) +
  theme_bw() + theme(legend.position = "none", axis.text=element_text(size=12), axis.title=element_text(size=16)) +
  labs(x= paste0("PC1 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[1], 3), "%)"),
       y = paste0("PC2 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[2], 3), "%)"))

PC3PC4 <- ggplot(PCA_all.df, aes(PC3, PC4, col = Stylo_clusters_metadata$Cluster)) + 
  geom_point(stroke= 0, size=8, alpha=0.5, show.legend = TRUE) +
  scale_colour_manual(values = c("#8a67c1", "#bf557c", "#2da0a1", "#c16d37", "#729c45", "gold")) +
  theme_bw() + theme(legend.position = "none", axis.text=element_text(size=12), axis.title=element_text(size=16)) +
  labs(x= paste0("PC3 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[3], 3), "%)"),
       y = paste0("PC4 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[4], 3), "%)"))

PC5PC6 <- ggplot(PCA_all.df, aes(PC5, PC6, col = Stylo_clusters_metadata$Cluster)) + 
  geom_point(stroke= 0, size=8, alpha=0.5, show.legend = TRUE) +
  scale_colour_manual(values = c("#8a67c1", "#bf557c", "#2da0a1", "#c16d37", "#729c45", "gold")) +
  theme_bw() + theme(legend.position = "none", axis.text=element_text(size=12), axis.title=element_text(size=16)) +
  labs(x= paste0("PC5 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[5], 3), "%)"),
       y = paste0("PC6 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[6], 3), "%)"))

PC7PC8 <- ggplot(PCA_all.df, aes(PC7, PC8, col = Stylo_clusters_metadata$Cluster)) + 
  geom_point(stroke= 0, size=8, alpha=0.5, show.legend = TRUE) +
  scale_colour_manual(values = c("#8a67c1", "#bf557c", "#2da0a1", "#c16d37", "#729c45", "gold")) +
  theme_bw() + theme(legend.position = "none", axis.text=element_text(size=12), axis.title=element_text(size=16)) +
  labs(x= paste0("PC7 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[7], 3), "%)"),
       y = paste0("PC8 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[8], 3), "%)"))

PC9PC10 <- ggplot(PCA_all.df, aes(PC9, PC10, col = Stylo_clusters_metadata$Cluster)) + 
  geom_point(stroke= 0, size=8, alpha=0.5, show.legend = TRUE) +
  scale_colour_manual(values = c("#8a67c1", "#bf557c", "#2da0a1", "#c16d37", "#729c45", "gold")) +
  theme_bw() + theme(legend.position = "none", axis.text=element_text(size=12), axis.title=element_text(size=16)) +
  labs(x= paste0("PC9 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[9], 3), "%)"),
       y = paste0("PC10 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[10], 3), "%)"))

pdf(file = "/Users/zoemeziere/Desktop/PCA.pdf", width = 10, height = 10)
PC1PC2 + PC3PC4 + PC5PC6 + PC7PC8 + PC9PC10 + plot_layout(nrow= 3, ncol= 2)
dev.off()

####Figure S3####

pdf(file = "/Users/zoemeziere/Desktop/FigureS2A.pdf", width = 10, height = 8)
plot(cv_errors$K, cv_errors$CV, xlim=c(2,15), xlab="Number of populations (K)", ylab="Cross validation error")
lines(cv_errors$K, cv_errors$CV, col = "gray")
dev.off()

pdf(file = "/Users/zoemeziere/Desktop/FigureS2B.pdf", width = 10, height = 8)
plot(cv_errors$K, cv_errors$Log_likelihood, xlim=c(2,15), xlab="Number of populations (K)", ylab="Log Likelihood")
lines(cv_errors$K, cv_errors$Log_likelihood, col = "gray")
dev.off()

#### Figure S5####
heron_metadata  <- subset(Stylo_clusters_metadata, locality == 'Heron')
heron_genlight <- popsub(Stylo_genlight, sublist = heron_metadata$Sample_name)
heron_genind <- gl2gi(heron_genlight)

Davies_metadata  <- subset(Stylo_clusters_metadata, locality == 'Davies')
Davies_genlight <- popsub(Stylo_genlight, sublist = Davies_metadata$Sample_name)
Davies_genind <- gl2gi(Davies_genlight)

Moore_metadata  <- subset(Stylo_clusters_metadata, locality == 'Moore')
Moore_genlight <- popsub(Stylo_genlight, sublist = Moore_metadata$Sample_name)
Moore_genind <- gl2gi(Moore_genlight)

gen_dist_Davies <- pairDist(Davies_genind, grp = Davies_metadata$Sample_name)
df_gene_dist_Davies <- as.data.frame(gen_dist_Davies$data$distance)

gen_dist_Lizard <- pairDist(Lizard_genind, grp = Lizard_metadata$Sample_name)
df_gene_dist_Lizard <- as.data.frame(gen_dist_Lizard$data$distance)

gen_dist_Moore <- pairDist(Moore_genind, grp = Moore_metadata$Sample_name)
df_gene_dist_Moore <- as.data.frame(gen_dist_Moore$data$distance)


Moore <- ggplot(df_gene_dist_Moore, aes(x=df_gene_dist_Moore$`gen_dist_Moore$data$distance`)) + 
  geom_histogram(color="black", fill="grey") +
  theme_light() +
  theme(axis.title = element_blank(), axis.text=element_text(size=15)) 

Heron <- ggplot(df_gene_dist_heron, aes(x=df_gene_dist_heron$`gen_dist_heron$data$distance`)) + 
  geom_histogram(color="black", fill="grey") +
  theme_light() +
  theme(axis.title = element_blank(), axis.text=element_text(size=15)) 

Davies <- ggplot(df_gene_dist_Davies, aes(x=df_gene_dist_Davies$`gen_dist_Davies$data$distance`)) + 
  geom_histogram(color="black", fill="grey") +
  theme_light() +
  theme(axis.title = element_blank(), axis.text=element_text(size=15)) 

grid.arrange(Moore, Heron, Davies, ncol=3)

#### Figure S8####

correlations <- cor(Spis_env_all_select[,5:17])
get_lower_tri<-function(x){
  x[lower.tri(x)] <- NA
  return(x)}
lower_tri <- get_lower_tri(correlations)
melted_correlations <- melt(lower_tri, na.rm = TRUE)

pdf("EnvVriablesCorrelation.pdf", width = 10, height = 5)
ggplot(data = melted_correlations, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  #theme_Publication() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 10, hjust = 1)) +
  coord_fixed()
dev.off()

####Figure S9 ####

correlation_env <- abs(cor(Spis_env_individuals_std_all[,sapply(Spis_env_individuals_std_all,is.numeric)]))
correlation_env[upper.tri(correlation_env)] <- NA
melted_correlation_env <- melt(correlation_env, na.rm = TRUE)

pdf("correlation_heatmap.pdf", width = 8, height = 8)
ggplot(melted_correlation_env, aes(x=Var1, y=Var2, fill= value)) + 
  geom_tile() +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 70, vjust = 1, hjust=1)) +
  scale_fill_gradient2(low = "grey85", high = "grey25", mid = "grey55", 
                       midpoint = 0.5, limit = c(0,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  labs(x="", y="")
dev.off()

### Figure S10####
reef_barchart <- read.csv("/Users/zoemeziere/Desktop/reef_barcharts.csv", header = TRUE)
ggplot(data=reef_barchart, 
       aes(x=factor(EcoLocationID_short), fill=Cluster)) +
  geom_bar() + scale_y_continuous(limits=c(0,21)) +
  scale_fill_manual(values=c("gold", "#8a67c1", "#bf557c", "#2da0a1", "#c16d37", "#729c45")) +
  scale_x_discrete(guide = guide_axis(angle = 45)) +
  theme_base() +
  theme(legend.position="none")
  
reef_barchart_Heron <- reef_barchart[reef_barchart$locality=="Heron",]
pdf(file = "/Users/zoemeziere/Desktop/Heron_barplots.pdf", width = 15, height = 3)
ggplot(data=reef_barchart_Heron) +
  stat_count(mapping = aes(x = Cluster, y = ..count.., fill = Cluster),
             position = position_dodge2(preserve = "single")) + 
  scale_y_continuous(limits=c(0,21)) +
  scale_fill_manual(values=c("#8a67c1", "#c16d37", "#729c45")) +
  facet_grid(.~ EcoLocationID_short) +
  theme_bw() +
  theme(legend.position="none", axis.text.x=element_blank(), axis.ticks.x=element_blank())
dev.off()

reef_barchart_LadyM <- reef_barchart[reef_barchart$locality=="LadyMusgrave",]
pdf(file = "/Users/zoemeziere/Desktop/LadyM_barplots.pdf", width = 5, height = 3)
ggplot(data=reef_barchart_LadyM) +
  stat_count(mapping = aes(x = Cluster, y = ..count.., fill = Cluster),
             position = position_dodge2(preserve = "single")) + 
  scale_fill_manual(values=c("#8a67c1", "#729c45")) +
  facet_grid(.~ EcoLocationID_short) +
  theme_bw() +
  theme(legend.position="none", axis.text.x=element_blank(), axis.ticks.x=element_blank())
dev.off()

reef_barchart_Chicken <- reef_barchart[reef_barchart$locality=="Chicken",]
pdf(file = "/Users/zoemeziere/Desktop/Chicken_barplots.pdf", width = 5, height = 3)
ggplot(data=reef_barchart_Chicken) +
  stat_count(mapping = aes(x = Cluster, y = ..count.., fill = Cluster),
             position = position_dodge2(preserve = "single")) + 
  scale_fill_manual(values=c("#8a67c1", "#2da0a1", "#729c45")) +
  facet_grid(.~ EcoLocationID_short) +
  theme_bw() +
  theme(legend.position="none", axis.text.x=element_blank(), axis.ticks.x=element_blank())
dev.off()


reef_barchart_Davies <- reef_barchart[reef_barchart$locality=="Davies",]
pdf(file = "/Users/zoemeziere/Desktop/Davies_barplots.pdf", width = 15, height = 3)
ggplot(data=reef_barchart_Davies) +
  stat_count(mapping = aes(x = Cluster, y = ..count.., fill = Cluster),
             position = position_dodge2(preserve = "single")) + 
  scale_fill_manual(values=c("#8a67c1", "#2da0a1", "#c16d37", "#729c45")) +
  facet_grid(.~ EcoLocationID_short) +
  theme_bw() +
  theme(legend.position="none", axis.text.x=element_blank(), axis.ticks.x=element_blank())
dev.off()

reef_barchart_LittleB <- reef_barchart[reef_barchart$locality=="LittleBroadhurst",]
pdf(file = "/Users/zoemeziere/Desktop/LittleB_barplots.pdf", width = 5, height = 3)
ggplot(data=reef_barchart_LittleB) +
  stat_count(mapping = aes(x = Cluster, y = ..count.., fill = Cluster),
             position = position_dodge2(preserve = "single")) + 
  scale_fill_manual(values=c("#8a67c1")) +
  facet_grid(.~ EcoLocationID_short) +
  theme_bw() +
  theme(legend.position="none", axis.text.x=element_blank(), axis.ticks.x=element_blank())
dev.off()

reef_barchart_Moore <- reef_barchart[reef_barchart$locality=="Moore",]
pdf(file = "/Users/zoemeziere/Desktop/Moore_barplots.pdf", width = 15, height = 3)
ggplot(data=reef_barchart_Moore) +
  stat_count(mapping = aes(x = Cluster, y = ..count.., fill = Cluster),
             position = position_dodge2(preserve = "single")) + 
  scale_fill_manual(values=c("gold", "#8a67c1", "#2da0a1")) +
  facet_grid(.~ EcoLocationID_short) +
  theme_bw() +
  theme(legend.position="none", axis.text.x=element_blank(), axis.ticks.x=element_blank())
dev.off()


reef_barchart_Aukane <- reef_barchart[reef_barchart$locality=="Aukane",]
ggplot(data=reef_barchart_Aukane, 
       aes(x=factor(EcoLocationID_short), fill=Cluster)) +
  geom_bar() + scale_y_continuous(limits=c(0,21)) +
  scale_fill_manual(values=c("#bf557c"))

reef_barchart_Dungeness <- reef_barchart[reef_barchart$locality=="Dungeness",]
ggplot(data=reef_barchart_Dungeness, 
       aes(x=factor(EcoLocationID_short), fill=Cluster)) +
  geom_bar() + scale_y_continuous(limits=c(0,21)) +
  scale_fill_manual(values=c("#bf557c", "#c16d37" ))

reef_barchart_Aukane <- reef_barchart[reef_barchart$locality=="Aukane",]
ggplot(data=reef_barchart_Aukane, 
       aes(x=factor(EcoLocationID_short), fill=Cluster)) +
  geom_bar() + scale_y_continuous(limits=c(0,21)) +
  scale_fill_manual(values=c("#bf557c"))

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
  geom_bar(data=as.data.frame(pie_charts_coords), aes(x=Long, y=Lat), fill= c("Cluster1","Cluster2","Cluster3","Cluster4","Cluster5")) +
  scale_fill_manual(values = c("#8a67c1", "#bf557c", "#2da0a1", "#c16d37", "#729c45")) 

### Figure S11####
sample_names_T4CBHET5OCCH <- readLines("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Diversity/Fst_across/sample_names_T4CBHET5OCCH.csv")
Stylo_loci_T4CBHET5OCCH <- Stylo_loci_all[(row.names(Stylo_loci_all) %in% sample_names_T4CBHET5OCCH),]
T4CBHET5OCCH_pop <- read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Diversity/Fst_across/T4CBHET5OCCH_populations.csv")
fst_across_T4CBHET5OCCH <- Fst(x=Stylo_loci_T4CBHET5OCCH, pop=T4CBHET5OCCH_pop$taxon)
fst_across_T4CBHET5OCCH[,2:2][fst_across_T4CBHET5OCCH[,2:2] < 0] <- 0
fst_across_T4CBHET5OCCH <- na.omit(fst_across_T4CBHET5OCCH)

sample_names_T1OCCHT5CBHE <- readLines("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Diversity/Fst_across/sample_names_T1OCCHT5CBHE.csv")
Stylo_loci_T1OCCHT5CBHE <- Stylo_loci_all[(row.names(Stylo_loci_all) %in% sample_names_T1OCCHT5CBHE),]
T1OCCHT5CBHE_pop <- read.csv("/Users/zoemeziere/Documents/PhD/Chapter1_analyses/GBR_RefGenome/Diversity/Fst_across/T1OCCHT5CBHE_populations.csv")
fst_across_T1OCCHT5CBHE <- Fst(x=Stylo_loci_T1OCCHT5CBHE, pop=T1OCCHT5CBHE_pop$taxon)
fst_across_T1OCCHT5CBHE[,2:2][fst_across_T1OCCHT5CBHE[,2:2] < 0] <- 0
fst_across_T1OCCHT5CBHE <- na.omit(fst_across_T1OCCHT5CBHE)

hist_info <- hist((as.data.frame(fst_across_T4CBHET5CBHE)$Fst), breaks = 50)  
hist_info$density <- hist_info$counts / sum(hist_info$counts)
plot(hist_info, freq = FALSE, xlim=c(0,1), ylim=c(0,1))

