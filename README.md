# OFFER-for-Trig-Functions
This repo contains computer code for teaching trig functions using OFFER and SPORT approaches
It has two type of code: Python and R. The figure below is Fig. 3 of the paper. 
<img width="3600" height="2484" alt="fig03trig copy" src="https://github.com/user-attachments/assets/bcf628c4-d059-4ac9-8747-0a26424e1cb0" />

```
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
```

```
#############################
# Python code for Fig. 3

import numpy as np
import matplotlib.pyplot as plt

# Define sec and csc functions
def sec(x):
    return 1 / np.cos(x)

def csc(x):
    return 1 / np.sin(x)

# Plot parameters
n = 401
t = np.linspace(0, 2 * np.pi, n)
x = np.cos(t)
y = np.sin(t)

xext = 1.0
yext = 0.2

# Angle
theta = np.deg2rad(53)

# Create figure
fig, ax = plt.subplots(figsize=(6.0, 3.48), dpi=600)

# Remove margins
fig.subplots_adjust(left=0, right=1, bottom=0, top=1)
ax.axis("off")
ax.set_aspect("equal")

# Plot unit circle
ax.plot(x, y, color="black", linewidth=1)

xmin = -1.2 * sec(theta)
xmax = sec(theta) + xext
ymin = -1.2
ymax = csc(theta) + yext

ax.set_xlim(xmin, xmax)
ax.set_ylim(ymin, ymax)

# --------------------------------------------------
# Axes
# --------------------------------------------------
ax.annotate(
    "",
    xy=(xmax, 0),
    xytext=(xmin, 0),
    arrowprops=dict(arrowstyle="->", linewidth=1),
)

ax.annotate(
    "",
    xy=(0, ymax),
    xytext=(0, ymin),
    arrowprops=dict(arrowstyle="->", linewidth=1),
)

#  Label the axes
ax.text(xmax -0.03, -0.12, r"$x$")
ax.text(-0.10, ymax -0.02, r"$y$")
ax.text(-0.10, -0.10, "O")

# --------------------------------------------------
#  Plot points A, H
# --------------------------------------------------
A = (np.cos(theta), np.sin(theta))

ax.plot(A[0], A[1], "ko", markersize=5)
ax.plot(-sec(theta), 0, "o", color="magenta", markersize=3)

# --------------------------------------------------
# Theta arc
# --------------------------------------------------
rthe = 0.15
t1 = np.linspace(0, theta, n)

ax.plot(
    rthe * np.cos(t1),
    rthe * np.sin(t1),
    color="black", linewidth=0.7
)

mid = len(t1) // 2
ax.text(
    1.2 * rthe * np.cos(t1[mid]),
    1.2 * rthe * np.sin(t1[mid]),
    r"$\theta$",
)

# --------------------------------------------------
# Plot triangle segments/sides
# --------------------------------------------------
ax.plot([0, sec(theta)], [0.01, 0.01],
        color="magenta", linewidth=2)

ax.plot([A[0], sec(theta)],
        [A[1], 0],
        color="orange", linewidth=2)

ax.plot([A[0], 0],
        [A[1], csc(theta)],
        color="brown", linewidth=2)

ax.plot([0, 0],
        [0, csc(theta)],
        color="green", linewidth=2)

ax.plot([A[0], 0],
        [A[1], 0],
        color="black", linewidth=1)

ax.plot([A[0], A[0]],
        [A[1], 0],
        color="red", linewidth=2)

ax.plot([A[0], A[0]],
        [-A[1], 0],
        color="red",
        linestyle=":",
        linewidth=2)

ax.plot([A[0], 0],
        [A[1], A[1]],
        color="black",
        linewidth=1)

ax.plot([A[0], 0],
        [-0.01, -0.01],
        color="blue",
        linewidth=2)

# --------------------------------------------------
# Label points A, B, C, D, E, G, H
# --------------------------------------------------
ax.text(A[0] + 0.03, A[1] + 0.05, "A")
ax.text(A[0] + 0.04, -0.10, "B")
ax.text(sec(theta), -0.10, "C")
ax.text(-0.10, csc(theta), "D")
ax.text(-0.10, np.sin(theta) - 0.05, "E")
ax.text(A[0] + 0.01, -A[1] - 0.08, "G")
ax.text(-sec(theta), -0.12, "H")

# --------------------------------------------------
# Label trigonometric functions
# --------------------------------------------------
ax.text(
    A[0] + 0.05,
    A[1] / 2.5,
    r"$\sin\theta$",
    rotation=90,
    color="red",
)

ax.text(
    (A[0] + sec(theta)) / 2,
    A[1] / 2.8,
    r"$\tan\theta$",
    rotation=-(90 - np.degrees(theta)),
    color="orange",
)

ax.text(
    sec(theta) - 0.60,
    0.06,
    r"$\sec\theta$",
    color="magenta",
)

ax.text(
    A[0] / 2.7,
    -0.12,
    r"$\cos\theta$",
    color="blue",
)

ax.text(
    A[0] / 2,
    (A[1] + csc(theta)) / 2.2,
    r"$\cot\theta$",
    rotation=-(90 - np.degrees(theta)),
    color="brown",
)

ax.text(
    -0.12,
    csc(theta) / 3.2,
    r"$\csc\theta$",
    color="green",
    rotation=90,
)

# Radius label "1" for the unit circle
ax.text(
    A[0] / 2,
    A[1] / 2 + 0.10,
    "1",
)

# --------------------------------------------------
# Non-tangent line
# --------------------------------------------------
Fx = sec(theta) + 0.8 * xext

ax.plot(
    [A[0], Fx],
    [A[1], 0],
    linestyle="--",
    color="black",
    linewidth=1,
)

ax.text(Fx, -0.10, "F")
ax.text(sec(theta), 0.5 * np.sin(theta), "c")

# --------------------------------------------------
# Label the unit circle 
# --------------------------------------------------
ax.text(
    -A[0],
    -A[1] - 0.17,
    "Unit Circle",
    rotation=280 + np.degrees(theta),
)

# Save figure
plt.savefig(
    "fig03.png",
    dpi=600,
    bbox_inches="tight",
    pad_inches=0,
)

plt.close()
```
