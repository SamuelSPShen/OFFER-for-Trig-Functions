# Title:   R Code for Paper on OFFER-for-Trig-Functions by S.S.P.Shen
# Author:  Samuel S.P. Shen, San Diego State University
# Purpose: The computer code is to help readers easily
#          reproduce and modify the figures in Shen's paper. 
# Version: V1.0.0
# Release: July 2026

# Citation: Shen, S.S.P., 2026: Computer code for the paper on 
#           OFFER-for-trig-functions. Zenodo.
#           DOI: https://doi.org/10.5281/zenodo.21267201

 
# Go to working directory
setwd('/Users/sshen/Trigonometry')

install.packages('pracma') 
library(pracma)

# R code for plotting Fig. 1:
# Fig. 1: All six trigonometric functions can be illustrated by
# this single figure with triangles associated with a unit circle

# Plot the unit circle and set up the figure frame
# Plot the circle using parametric equations
n = 401 #number of points on the unit circle
t = seq(0, 2*pi, len = n) #time steps
x = cos(t) #x parametric equation for circle
y = sin(t) #y parametric equation for circle

# Specify the angle on trig functions, e.g., sin theta
theta = 53*pi/180

# Auto-save the figure in a file fig01.png
png(filename = 'fig01.png', 
    width = 6.00, height = 5.2, units = "in", 
    res = 600)
#Zero margins to avoid blank areas on a paper or report
par(mar = c(0, 0, 0, 0)) 

#Plot the unit circle w/o axes
plot(x, y, type= 'l', 
     xlim = c(-1.2, sec(theta) + 0.2),  
     ylim = c(-1.2, csc(theta) + 0.2), bty = 'n',
     xaxt="n",  yaxt="n", xlab = '', ylab = '')
# Specify the x-axis and y-axis
arrows(-1.2, 0, sec(theta) + 0.2, 0, 
       length = 0.1, angle = 10, code = 2)
arrows(0, -1.2, 0, csc(theta) + 0.2, 
       length = 0.1, angle = 10, code = 2)

# Name the axes and origin
text(sec(theta) + 0.2, -0.12, bquote(x))
text(-0.10, csc(theta) + 0.2, bquote(y))
text(-0.1, -0.1,  'O')

# Mark the point for angle theta
points(cos(theta), sin(theta), pch = 16)

# Plot and name the theta angle
t1 = seq(0, theta, len = n)
rthe = 0.15 #the radius for the angle theta arc
x1 = rthe * cos(t1) 
y1 = rthe * sin(t1)
lines(x1, y1, type = 'l')
text(1.5 * rthe * cos(t1[floor(n/2)]), 
     1.5 * rthe * sin(t1[floor(n/2)]), bquote(theta))

# Plot sides of triangles
segments(0, 0.01, sec(theta), 0.01, lwd = 3, col = 'magenta')
segments(cos(theta), sin(theta), sec(theta), 0, lwd = 3, col = 'orange')
segments(cos(theta), sin(theta), 0, csc(theta), lwd = 3, col = 'brown')
segments(0, 0, 0, csc(theta), lwd = 2, col = 'green')
segments(cos(theta), sin(theta), 0, 0, lwd = 1, col = 'black')
segments(cos(theta), sin(theta), cos(theta), 0, lwd = 3, col = 'red')
segments(cos(theta), -sin(theta), cos(theta), 0, 
         lty = 'dotted', lwd = 2, col = 'red')
segments(cos(theta), sin(theta), 0, sin(theta), lwd = 1, col = 'black')
segments(cos(theta), -0.01, 0, -0.01, lwd = 3, col = 'blue')

# Name points
text(cos(theta) + 0.05, sin(theta)+ 0.1, 'A')
text(cos(theta) + 0.1, -0.1,  'B')
text(sec(theta), -0.1,  'C')
text(-0.1, csc(theta),  'D')
text(-0.1, sin(theta),  'E')
text(cos(theta) + 0.05, -sin(theta) - 0.1, 'G')

# Name three trig functions: sin, tan, sec
text(cos(theta) + 0.1, sin(theta)/2,  
     bquote('sin' ~ theta), srt = 90, col = 'red')
text((cos(theta) + sec(theta))/2 + 0.1, sin(theta)/2 + 0.1,  
     bquote('tan' ~ theta), srt = -(90-theta*180/pi), col = 'orange')
text(sec(theta) - 0.4,  0.1,  
     bquote('sec' ~ theta), srt = 0, col = 'magenta')

# Name three complementary trig functions: cos, cot, csc
text(cos(theta)/2, -0.1,  
     bquote('cos' ~ theta), srt = 0, col = 'blue')
text(cos(theta)/2 + 0.1, (sin(theta) + csc(theta))/2 + 0.1,   
     bquote('cot' ~ theta), srt = -(90-theta*180/pi), col = 'brown')
text( - 0.2,  csc(theta)/2,
      bquote('csc' ~ theta), srt = 0, col = 'green')

# Name the radius 1 for the unit circle
text(cos(theta)/2, sin(theta)/2 + 0.1,  '1')

# Name the unit circle
text(-cos(theta), -sin(theta) - 0.1, 
     srt = 270 + theta*180/pi, 'Unit Circle')

# Erase the figure and its setups for other plots
dev.off() 
# End of the R code for Fig. 1.
############################


#############################
# Figure 2 was produced by ChatGPT with prompts
############################


############################
# R code for plotting Fig. 3
# Fig. 3: A figure for the definition of trigonometric functions 
# using the right triangles and for the proof of the law of 
# cosines using an oblique triangle.

# Auto-save the figure in a file fig03.png
png(filename = 'fig03.png', 
    width = 6.00, height = 3.48, units = "in", 
    res = 600)
#Zero margins to avoid blank areas on a paper or report
par(mar = c(0, 0, 0, 0)) 

# Set up computing and plot parameters
n = 401 #number of points on the unit circle
t = seq(0, 2*pi, len = n)
x = cos(t) 
y = sin(t)
xext = 1.0 # x extension from sec
yext = 0.2 # y extension from csc

# Specify the angle theta for trig functions like sin theta
theta = 53*pi/180

# Plot the unit circle and set up the figure frame
plot(x, y, type= 'l', 
     xlim = c(-1.2*sec(theta), sec(theta) + xext),  
     ylim = c(-1.2, csc(theta) + yext), bty = 'n',
     xaxt="n",  yaxt="n", xlab = '', ylab = '')

# x-axis
arrows(-1.2*sec(theta), 0, sec(theta) + xext, 0, 
       length = 0.1, angle = 10, code = 2)
# y-axis
arrows(0, -1.2, 0, csc(theta) + yext, 
       length = 0.1, angle = 10, code = 2)

# Name the axes and origin
text(sec(theta) + xext, -0.12, bquote(x))
text(-0.10, csc(theta) + 0.2, bquote(y))
text(-0.1, -0.1,  'O')

# Mark the point for angle theta and -sec(theta)
points(cos(theta), sin(theta), pch = 16)
points(-sec(theta), 0, 
       pch = 16, cex = 0.7, col = 'magenta')

# Plot and name the theta angle
t1 = seq(0, theta, len = n)
rthe = 0.15 #the radius for the angle theta arc
x1 = rthe * cos(t1) 
y1 = rthe * sin(t1)
lines(x1, y1, type = 'l')
text(1.5 * rthe * cos(t1[floor(n/2)]), 
     1.5 * rthe * sin(t1[floor(n/2)]), bquote(theta))

# Plot sides of triangles
segments(0, 0.01, sec(theta), 0.01, lwd = 3, col = 'magenta')
segments(cos(theta), sin(theta), sec(theta), 0, lwd = 3, col = 'orange')
segments(cos(theta), sin(theta), 0, csc(theta), lwd = 3, col = 'brown')
segments(0, 0, 0, csc(theta), lwd = 2, col = 'green')
segments(cos(theta), sin(theta), 0, 0, lwd = 1, col = 'black')
segments(cos(theta), sin(theta), cos(theta), 0, lwd = 3, col = 'red')
segments(cos(theta), -sin(theta), cos(theta), 0, 
         lty = 'dotted', lwd = 2, col = 'red')
segments(cos(theta), sin(theta), 0, sin(theta), lwd = 1, col = 'black')
segments(cos(theta), -0.01, 0, -0.01, lwd = 3, col = 'blue')

# Name points
text(cos(theta) + 0.05, sin(theta)+ 0.1, 'A')
text(cos(theta) + 0.1, -0.1,  'B')
text(sec(theta), -0.1,  'C')
text(-0.1, csc(theta),  'D')
text(-0.1, sin(theta),  'E')
text(cos(theta) + 0.05, -sin(theta) - 0.1, 'G')
text(-sec(theta), -0.1,  'H')

# Name three trig functions: sin, tan, sec
text(cos(theta) + 0.1, sin(theta)/2,  
     bquote('sin' ~ theta), srt = 90, col = 'red')
text((cos(theta) + sec(theta))/2 + 0.25, sin(theta)/2.6,  
     bquote('tan' ~ theta), srt = -(90-theta*180/pi), col = 'orange')
text(sec(theta) - 0.4,  0.1,  
     bquote('sec' ~ theta), srt = 0, col = 'magenta')

# Name three complementary trig functions: cos, cot, csc
text(cos(theta)/2, -0.1,  
     bquote('cos' ~ theta), srt = 0, col = 'blue')
text(cos(theta)/2 + 0.1, (sin(theta) + csc(theta))/2 + 0.02,   
     bquote('cot' ~ theta), srt = -(90-theta*180/pi), col = 'brown')
text( - 0.2,  csc(theta)/2,
      bquote('csc' ~ theta), srt = 0, col = 'green')

# Name the radius 1 for the unit circle
text(cos(theta)/2, sin(theta)/2 + 0.1,  '1')

# Plot a non-tangent line
segments(cos(theta), sin(theta), sec(theta) + 0.8*xext, 0, 
         lty = 3)
# Name the point and length
text(sec(theta) + 0.8*xext, -0.1, 'F')
text(sec(theta), 0.55*sin(theta), 'c')

# Name the unit circle
text(-cos(theta), -sin(theta) - 0.1, 
     srt = 270 + theta*180/pi, 'Unit Circle')

dev.off()
# End of the R code for Fig. 3.
############################


############################
# R code for plotting Fig. 4
# Fig. 4: A right triangle to support the Pythagorean theorem

library("pracma")

# Auto-save the figure in a file 
png(filename = 'fig04.png', 
    width = 6.00, height = 5.2,units = "in", 
    res = 600)
#Zero margins to avoid blank areas on a paper or report
par(mar = c(0, 0, 0, 0)) 

# Set up computing and plot parameters
n = 401 #number of points on the unit circle
t = seq(0, 2*pi, len = n)
x = cos(t) 
y = sin(t)
theta = 53*pi/180

# Plot the unit circle and set up the figure frame
plot(0,0, bty = 'n', cex = 0.001,
     xlim = c(-0.2, cos(theta) + 0.2),
     ylim = c(-0.2, sin(theta) + 0.2),
     xaxt="n",  yaxt="n", xlab = '', ylab = '')

# plot and name the theta angle
t1 = seq(0, theta, len = n)
rthe = 0.15 #the radius for the angle theta arc
x1 = rthe * cos(t1) 
y1 = rthe * sin(t1)
lines(x1, y1, type = 'l')
text(1.2 * rthe * cos(t1[floor(n/2)]), 
     1.2 * rthe * sin(t1[floor(n/2)]), 
     bquote(theta), cex = 1.4)

# Plot sides of the triangle
segments(cos(theta), sin(theta), 0, 0, lwd = 2, col = 'black')
segments(cos(theta), sin(theta), cos(theta), 0, lwd = 2, col = 'red')
segments(cos(theta), 0, 0, 0, lwd = 2, col = 'blue')

# Name points
text(-0.03, -0.03,  'B', cex = 1.3)
text(cos(theta) + 0.03, sin(theta)+ 0.03, 'A', cex = 1.3)
text(cos(theta) + 0.03, -0.03,  'C', cex = 1.3)

# Name the sides
text(cos(theta) + 0.03, sin(theta)/2, 'b', cex = 1.3, col = 'red')
text(cos(theta)/2, - 0.04, 'a', cex = 1.3, col = 'blue')
text(cos(theta)/2, sin(theta)/2 + 0.07,  'c', cex = 1.3, col = 'black')

dev.off()
# End of the R code for Fig. 4.
############################


############################
# R code for plotting Fig. 5
# Fig. 5: A figure for the derivation of the cosine difference formula

library("pracma")

# Auto-save the figure as a png file
png(filename = 'fig05.png', 
    width = 5.00, height = 5.00, units = "in", 
    res = 600)
# Specify the zero margin for a paper or a report
par(mar = c(0,0,0,0))

# set up the figure frame
plot(0, 0, type= 'l', 
     xlim = c(-1.2, 1.2),  
     ylim = c(-1.2, 1.2), bty = 'n',
     xaxt="n",  yaxt="n", xlab = '', ylab = '')

# Plot the unit circle
n = 401 #number of points on the unit circle
t = seq(0, 2*pi, len = n)
x = cos(t) 
y = sin(t)
lines(x, y, type= 'l')

# Plot x-axis and y-axis
arrows(-1.2, 0, 1.2, 0, 
       length = 0.1, angle = 10, code = 2)
arrows(0, -1.2, 0, 1.2, 
       length = 0.1, angle = 10, code = 2)

# Name the axes and the origin
text(1.2, -0.12, bquote(x))
text(-0.10, 1.2, bquote(y))
text(-0.07, -0.07,  'O')

# Mark the point for angles alfa and beta
alfa = 70*pi/180 
points(cos(alfa), sin(alfa), pch = 16, col = 'blue')

beta = 20*pi/180 
points(cos(beta), sin(beta), pch = 16, col = 'red')

# plot and name the alfa, beta, and alfa - beta angles
t1 = seq(0, alfa, len = n)
rthe = 0.15 #the radius for the angle theta arc
x1 = rthe * cos(t1) 
y1 = rthe * sin(t1)
lines(x1, y1, type = 'l', col = 'blue')
text(1.1 * rthe * cos(t1[floor(n/2)]), 
     1.7 * rthe * sin(t1[floor(n/2)]), 
     bquote(alpha), col = 'blue')

# Plot and name the beta angle
t1 = seq(0, beta, len = n)
rthe = 0.45 #the radius for the angle theta arc
x1 = rthe * cos(t1) 
y1 = rthe * sin(t1)
lines(x1, y1, type = 'l', col='red')
text(1.10 * rthe * cos(t1[floor(n/2)]), 
     1.10 * rthe * sin(t1[floor(n/2)]), 
     bquote(beta), col = 'red')

# Plot and name the alfa - beta angle
t1 = seq(beta, alfa, len = n)
rthe = 0.27 #the radius for the angle theta arc
x1 = rthe * cos(t1) 
y1 = rthe * sin(t1)
lines(x1, y1, type = 'l', lwd = 1.5, col='brown')
text(1.10 * rthe * cos(t1[floor(n/2)]), 
     1.3 * rthe * sin(t1[floor(n/2)]), 
     bquote(alpha - beta), srt = -45, col = 'brown')

# Plot sides
segments(0, 0, cos(alfa), sin(alfa), lwd = 2, col = 'blue')
segments(cos(alfa),0, cos(alfa), sin(alfa), lwd = 2, col = 'blue')
segments(0,0.01, cos(alfa), 0.01, lwd = 2, col = 'blue')

segments(0, 0, cos(beta), sin(beta), lwd = 3, 
         col = 'red')
segments(cos(beta), 0, cos(beta), sin(beta), lwd = 3, 
         col = 'red')
segments(cos(beta), 0, cos(beta), sin(beta), lwd = 3, 
         col = 'red')
segments(0, -0.01, cos(beta), -0.01, lwd = 3, 
         col = 'red')

segments(cos(alfa), sin(beta), cos(beta), sin(beta), 
         lty = 3, lwd = 2, col = 'black')

segments(cos(alfa), sin(alfa), cos(beta), sin(beta), 
         lty = 3, lwd = 2, col = 'black')

# Name points A, B, C, D, E
text(cos(alfa) + 0.04, sin(alfa)+ 0.06, 'A', col = 'blue')
text(cos(beta) + 0.05, sin(beta)+ 0.04, 'B', col = 'red')
text(cos(alfa), -0.07, 'C', col = 'blue')
text(cos(beta), -0.07, 'D', col = 'red')
text(cos(alfa) - 0.05, sin(beta), 'E', col = 'blue')

# Name sin and cos 
text(cos(alfa) + 0.06, sin(alfa)/1.5,  
     bquote('sin' ~ alpha),  
     srt = 90, col = 'blue')
text(cos(beta) - 0.07, sin(beta)/2,  
     bquote('sin' ~ beta),  
     srt = 90, col = 'red')

text(cos(alfa)/2.4 ,  -0.07,  
     bquote('cos' ~ alpha),  col = 'blue')
text(cos(beta)/2 + 0.2,  -0.07,  
     bquote('cos' ~ beta),  col = 'red')

# Name the unit circle
text(-cos(theta), -sin(theta) - 0.1, 
     srt = 270 + theta*180/pi, 'Unit Circle')

dev.off()
# End of the R code for Fig. 5.
############################


############################
# R code for plotting Fig. 6
# Fig. 6: Right triangles with different lengths of hypotenuse

library("pracma")

# Auto-save the figure as a png file
png(filename = 'fig06.png', 
    width = 5.00, height = 3.50, units = "in", 
    res = 600)

# Set the zero margins for publications
par(mar = c(0,0,0,0))

# Set up the figure frame
theta = 53*pi/180
n = 101 #number of points on the unit circle
t = seq(0, theta, len = n)
x = cos(t) 
y = sin(t)
r = 0.2
xext = 0.2

# Plot the arc for theta and point O
plot(r*x, r*y, type= 'l', 
     xlim = c(-xext, sec(theta) + xext),  
     ylim = c(-yext, csc(theta) + 1.2*yext), bty = 'n',
     xaxt="n",  yaxt="n", xlab = '', ylab = '')
text(1.2*r*x[floor(n/2)], 1.2*r*y[floor(n/2)],  
     bquote(theta), col = 'black')
text(-0.05, - 0.05, 'O', col = 'magenta')
points(0, 0, pch = 16, cex = 1.3, col = 'blue')

# Plot sides, and name sides and points
R = 1.8
segments(0, 0, R*cos(theta), R*sin(theta), 
         lwd = 4, col = 'magenta')
points(R*cos(theta), R*sin(theta), pch = 16, col = 'magenta')
text(R*cos(theta), R*sin(theta)+ 0.07, 'D', col = 'magenta')

segments(0, 0, cos(theta), sin(theta), 
         lwd = 2, col = 'black')
points(cos(theta), sin(theta), pch = 16)
text(cos(theta) -0.03, sin(theta)+ 0.07, 
     'A', col = 'black')

segments(0, 0, R*cos(theta), 0, 
         lwd = 4, col = 'magenta')
points(R*cos(theta), 0, pch = 16, col = 'magenta')
text(R*cos(theta), - 0.07, 'C', col = 'magenta')

segments(R*cos(theta), 0, R*cos(theta), R*sin(theta), 
         lwd = 4, col = 'magenta')

segments(0, 0, cos(theta), 0, lwd = 2, col = 'black')
segments(cos(theta), 0, cos(theta), sin(theta), 
         lwd = 2, col = 'black')
points(cos(theta), 0, pch = 16, col = 'black')
text(cos(theta), - 0.07, 'B', col = 'black')

text(0.7*R*cos(theta), -0.06, 'a', col = 'magenta')
text(0.65*R*cos(theta), 0.65*R*sin(theta)+ 0.08, 
     'c', col = 'magenta')
text(R*cos(theta) + 0.05, 0.5*R*sin(theta), 
     'b', col = 'magenta')

text(0.5*cos(theta), -0.07, bquote('cos' ~ theta), 
     col = 'black')
text(cos(theta) + 0.05, 0.5*sin(theta), 
     bquote('sin' ~ theta), srt = 90, 
     col = 'black')

dev.off()
# End of the R code for Fig. 6.
############################


############################
# R code for plotting Fig. 7
# Fig. 7: A figure for deriving the derivative formula for sine theta

library("pracma")

# Auto-save the figure as a png file
png(filename = 'fig07.png', 
    width = 6.00, height = 6.00, units = "in", 
    res = 600)
# Set zero margins for the figure
par(mar = c(0,0,0,0))

# Set up the figure frame 
plot(0, 0, type= 'l', 
     xlim = c(-1.2, 1.2),  
     ylim = c(-1.2, 1.2), bty = 'n',
     xaxt="n",  yaxt="n", xlab = '', ylab = '')

# Plot the unit circle
n = 401 #number of points on the unit circle
t = seq(0, 2*pi, len = n)
x = cos(t) 
y = sin(t)
lines(x, y, type= 'l') # plot the unit circle
# Plot the x-axis and y-axis
arrows(-1.2, 0, 1.2, 0, 
       length = 0.1, angle = 10, code = 2)
arrows(0, -1.2, 0, 1.2, 
       length = 0.1, angle = 10, code = 2)

# Name the axes and the origin
text(1.2, -0.12, bquote(x))
text(-0.10, 1.2, bquote(y))
text(-0.07, -0.07,  'O')

# Mark the point for angles theta and theta + Delta theta
theta = 35*pi/180 
points(cos(theta), sin(theta), pch = 16, 
       cex = 0.6, col = 'red')

Delthe = 15*pi/180 
thet2 = theta + Delthe
points(cos(thet2), sin(thet2), pch = 16, 
       cex = 0.6, col = 'blue')

# Plot and name the theta 
t1 = seq(0, theta, len = n)
rthe = 0.15 #the radius for the angle theta arc
x1 = rthe * cos(t1) 
y1 = rthe * sin(t1)
lines(x1, y1, type = 'l', col = 'blue')
text(1.2 * rthe * cos(t1[floor(n/2)]), 
     1.45 * rthe * sin(t1[floor(n/2)]), 
     bquote(theta), col = 'blue')

# Plot and name the increment angle phi
t1 = seq(theta, thet2, len = n)
rthe = 0.45 #the radius for the angle theta arc
x1 = rthe * cos(t1) 
y1 = rthe * sin(t1)
lines(x1, y1, type = 'l', col='blue')
text(1.15 * rthe * cos(t1[floor(n/2)]), 
     1.15 * rthe * sin(t1[floor(n/2)]), 
     bquote(phi), col = 'blue')

# Plot sides
segments(0, 0, cos(theta), sin(theta), lwd = 3, col = 'red')
segments(cos(theta), 0, cos(theta), sin(theta), lwd = 3, col = 'red')
segments(0, 0, cos(theta), 0, lwd = 3, col = 'red')
segments(0, 0, cos(thet2), sin(thet2), lwd = 1, col = 'blue')
segments(0, 0, cos(thet2), 0, lwd = 1, col = 'blue')
segments(cos(thet2), sin(theta), cos(theta), sin(theta), 
         lwd = 1, col = 'black')
segments(cos(thet2), 0, cos(thet2), sin(thet2) + 0.3, 
         lwd = 1, col = 'blue')
t = seq(-0.7, 0.7, len = n)
lines(cos(theta) + t*sin(theta), 
      sin(theta) - t*cos(theta), 
      lwd = 1, col = 'magenta')

# Name the points
text(cos(theta), -0.07, 'B', col = 'red')
text(cos(theta) + 0.05, sin(theta) + 0.05, 
     'A', col = 'red')
text(cos(thet2) - 0.08, sin(thet2), 
     'C', col = 'blue')
text(cos(thet2) + 0.08, sin(thet2) + 0.08, 
     'D', col = 'magenta')
text(cos(thet2) - 0.04, sin(theta), 
     'E', col = 'blue')
text(cos(thet2), -0.07, 'F', col = 'red')
text(0.65*cos(theta) - 0.03, 0.65*sin(theta) + 0.05, 
     '1', col = 'red')

points(cos(thet2), 
       sin(theta) - tan(theta - pi/2)*(cos(theta) - cos(thet2)),
       pch = 16, cex = 0.6, col = 'magenta')

# Name the sin and cos functions
text(cos(theta) + 0.05, sin(theta)/2,  
     bquote('sin' ~ theta), srt = 90, col = 'red')
text(0.6*cos(theta), -0.06,  
     bquote('cos' ~ theta), col = 'red')
text(0.65*cos(thet2), 0.06,  
     bquote('cos('~ theta+phi~')'), col = 'blue')
text(cos(thet2) + 0.05, sin(thet2)/3,  
     bquote('sin('~theta~+~phi~')'), 
     srt = 90, col = 'blue')

# Name the unit circle
text(cos(pi/4), -sin(pi/4) - 0.1, 
     srt = 45, 'Unit Circle')

dev.off()
# End of the R code for Fig. 7.
############################






