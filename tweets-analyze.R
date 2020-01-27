library(ggplot2)

data <- read.csv("tweets_sample.csv", encoding = "UTF-8")
data <- data[1:500,]

tonalite <- data[, c("tweet", "vincent.tonalite", "julien.tonalite",
                      "bastien.tonalite", "laurent.tonalite")]

ironie <- data[, c("tweet", "vincent.ironie", "julien.ironie",
                   "bastien.ironie", "laurent.ironie")]

pub_presse <- data[, c("tweet", "vincent.pub_presse", "julien.pub_presse",
                       "bastien.pub_presse", "laurent.pub_presse")]

tonalite_resume <- data.frame("vincent" = table(tonalite$vincent.tonalite))
names(tonalite_resume)[1] <- "tonalite"
names(tonalite_resume)[2] <- "vincent"
tonalite_resume$julien <- table(tonalite$julien.tonalite)
tonalite_resume$bastien <- table(tonalite$bastien.tonalite)
tonalite_resume$laurent <- table(tonalite$laurent.tonalite)
tonalite_resume

ironie_resume <- data.frame("vincent" = table(ironie$vincent.ironie))
names(ironie_resume)[1] <- "ironie"
names(ironie_resume)[2] <- "vincent"
ironie_resume$julien <- table(ironie$julien.ironie)
ironie_resume$bastien <- table(ironie$bastien.ironie)
ironie_resume$laurent <- table(ironie$laurent.ironie)
ironie_resume

pub_presse_resume <- data.frame("vincent" = table(pub_presse$vincent.pub_presse))
names(pub_presse_resume)[1] <- "pub_presse"
names(pub_presse_resume)[2] <- "vincent"
pub_presse_resume$julien <- table(pub_presse$julien.pub_presse)
pub_presse_resume$bastien <- table(pub_presse$bastien.pub_presse)
pub_presse_resume$laurent <- table(pub_presse$laurent.pub_presse)
pub_presse_resume

barplot(as.matrix(tonalite_resume[2:5]), col=hcl.colors(3), legend = c(1, 2, 3))
barplot(as.matrix(ironie_resume[2:5]), col=hcl.colors(3), legend = c(0,1))
barplot(as.matrix(pub_presse_resume[2:5]), col=hcl.colors(3), legend = c(0,1))

length(which(tonalite$vincent.tonalite==tonalite$julien.tonalite & 
      tonalite$julien.tonalite==tonalite$bastien.tonalite &
      tonalite$bastien.tonalite==tonalite$laurent.tonalite))

length(which(ironie$vincent.ironie==ironie$julien.ironie & 
               ironie$julien.ironie==ironie$bastien.ironie &
               ironie$bastien.ironie==ironie$laurent.ironie))

length(which(pub_presse$vincent.pub_presse==pub_presse$julien.pub_presse & 
               pub_presse$julien.pub_presse==pub_presse$bastien.pub_presse &
               pub_presse$bastien.pub_presse==pub_presse$laurent.pub_presse))

