# Reactivities analysis between replicas and experiments. Scater plot and distribution


# Read a vector with reactivities.
# Replica1 <- c(). Lenght must be the same between vectors

# Loraristm transformation
R1log <- log(Replica1 +1)
R2log <- log(Replica2 +1)

#Create a dataframe
df <- data.frame (R1log, R2log)

# Removing Na rows
library(tidyr)
df[df==0] <- NA
df <- df %>% drop_na()


# Calculating R2
Model<-lm(R2log~R1log,data=df)
summary(Model)

# Scater plot
library(LSD)
heatscatter(df$R1log,df$R2log, main = "TITLE",
            xlab = "Log(Reactivity +1) Replicate 1", 
            ylab = "Log(Reactivity +1) Replicate 2",
            xlim = c(0,3), ylim = c(0,3),
            cex.lab=1.5, cex.axis=1, cex.main=3, cex.sub=1.5)
legend("topleft",legend=paste("R2 =", format(summary(Model)$r.squared,digits=3)))

# Distribution
library(ggplot2)
library(reshape)

wilcox.test(df$R1log, df$R2log)

apply(df,2,median) # See median between in vivo and in vitro samples

    # Change columns names (if it is necesary)
    colnames(df) <- c("In vitro?", "In vivo?")
    df_distribution <- melt(df)
    
Distribution <- ggplot(df_distribution, aes(x=value, fill=variable)) + geom_density(alpha=.25) 
Distribution <- Distribution + xlab("SHAPE reactivity") + ylab("Density") + xlim(c(0,1.5)) + labs(fill = "")
Distribution <- Distribution + scale_fill_manual(values = c("Blue", "Green")) + theme(legend.position = c(0.8, 0.7))
Distribution <- Distribution + theme(legend.background = element_rect(fill='transparent'), legend.key.size = unit(1, 'cm'), legend.text = element_text(size=20),
                                     axis.title = element_text(size = 20)) 
Distribution

