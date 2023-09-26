PCA_all <- glPca(Stylo_genlight, parallel= TRUE) 
PCA_all.df <- as.data.frame(PCA_all$scores)
PC=1:10
pve_all <- data.frame(PC, 100*PCA_all$eig[1:10]/sum(PCA_all$eig[1:10]))

ggplot(pve_all, aes(PC, pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..)) + 
  geom_bar(stat = "identity") +
  ylab("Percentage variance explained") + 
  ylim(0,50) +
  theme_light() 

PCA_plot <- ggplot(PCA_all.df, aes(PC1, PC2, col = Stylo_clusters_metadata$Cluster)) + 
  geom_point(stroke= 0, size=12, alpha=0.5, show.legend = TRUE) +
  scale_colour_manual(values = c("#8a67c1", "#bf557c", "#2da0a1", "#c16d37", "#729c45")) +
  theme_bw() + theme(legend.position = "none", axis.text=element_text(size=16), axis.title=element_text(size=16)) +
  labs(x= paste0("PC1 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[1], 3), "%)"),
       y = paste0("PC2 (", signif(pve_all$X100...PCA_all.eig.1.10..sum.PCA_all.eig.1.10..[2], 3), "%)"))

