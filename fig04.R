# Plot a right triangle for Pythagorean theorem
# Sam Shen, 2026-06-28

setwd('/Users/sshen/Desktop/Papers/CalculusResearch/TrigTeachingBowChord/RcodeTrigBowChordTrigFcts')
#par(bg = 'white')
#dev.off()
library("pracma")

# Plot the unit circle and set up the figure frame
n = 401 #number of points on the unit circle
t = seq(0, 2*pi, len = n)
x = cos(t) 
y = sin(t)
theta = 53*pi/180

png(filename = 'fig04.png', 
    width = 6.00, height = 5.2,units = "in", 
    res = 600)
par(mar = c(0, 0, 0, 0))

plot(0,0, bty = 'n', cex = 0.001,
     xlim = c(-0.2, cos(theta) + 0.2),
     ylim = c(-0.2, sin(theta) + 0.2),
     xaxt="n",  yaxt="n", xlab = '', ylab = '')




# mark the point for angle theta
#points(cos(theta), sin(theta), pch = 16)

# plot and name the theta angle
t1 = seq(0, theta, len = n)
rthe = 0.15 #the radius for the angle theta arc
x1 = rthe * cos(t1) 
y1 = rthe * sin(t1)
lines(x1, y1, type = 'l')
text(1.2 * rthe * cos(t1[floor(n/2)]), 
     1.2 * rthe * sin(t1[floor(n/2)]), 
     bquote(theta), cex = 1.4)

# plot sides
segments(cos(theta), sin(theta), 0, 0, lwd = 2, col = 'black')
segments(cos(theta), sin(theta), cos(theta), 0, lwd = 2, col = 'red')
segments(cos(theta), 0, 0, 0, lwd = 2, col = 'blue')

# name points
text(-0.03, -0.03,  'B', cex = 1.3)
text(cos(theta) + 0.03, sin(theta)+ 0.03, 'A', cex = 1.3)
text(cos(theta) + 0.03, -0.03,  'C', cex = 1.3)

# name the sides
text(cos(theta) + 0.03, sin(theta)/2, 'b', cex = 1.3, col = 'red')
text(cos(theta)/2, - 0.04, 'a', cex = 1.3, col = 'blue')
text(cos(theta)/2, sin(theta)/2 + 0.07,  'c', cex = 1.3, col = 'black')

dev.off()

