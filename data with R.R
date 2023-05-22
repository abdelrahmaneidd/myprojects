library(ggplot2)
library(palmerpenguins)
View(penguins)
ggplot(data=penguins) +
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  facet_wrap(~species)

ggplot(data=penguins,aes(x=flipper_length_mm,y=body_mass_g))+ 
  geom_point(aes(color=species))+
  theme(panel.background = element_blank())

install.packages('rmarkdown')

