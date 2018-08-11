install.packages("ggplot2")
install.packages("ggExtra")
library(ggplot2)
library(ggExtra)

#Create a nice minimalist theme

theme_update(
  
  panel.border = element_blank(),
  axis.line.y = element_line(colour="black"),
  axis.text = element_text(colour="black"),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(), 
  panel.background = element_blank(),
  axis.text.x  = element_text(size=16),
  axis.text.y  = element_text(size=16),
  axis.title.x  = element_text(size=18, vjust=0.3, face="bold"),
  axis.title.y  = element_text(size=18, face = "bold", vjust=0.9, angle = 90),
  axis.line = element_line(size = 1.2, linetype = "solid"),
  axis.ticks = element_line(size = 1), legend.position="none"
  
) 

#Create some moderately correlated data

testdata = data.frame(x=rnorm(20000, mean = 1.5, sd = 0.2), z=rnorm(20000, mean = 1.5, sd = 0.5))
testdata$y = (newdata$x+newdata$z)/2

# Scatterplot with density contours and marginal density plots
  
p1 <- ggplot(newdata, aes(x=x, y=y)) +
  geom_point(alpha=0.06, colour="steelblue2", pch=19) +
  stat_density2d(geom="density2d", aes(alpha=..level..), colour="magenta3", size=1.5, contour=TRUE) +
  geom_smooth(method="lm", colour="black", se=TRUE, size=1.5, level=0.99)

ggExtra::ggMarginal(
  p = p1,
  type = 'density',
  margins = 'both',
  size = 5,
  colour = 'black',
  fill = '#9FA4EB'
)
