# F-Graph 2D - Graph of a 2D Function
# by Valerio Capello (Elf Qrin) / http://labs.geody.com/
# r2011-08-20 fr2011-06-19
# License: GPL

# Config
xzou <- 1; # Output: 1: Screen, 2: SVG file (vectorial, requires RSvgDevice), 3: PNG file (bitmap), 4: PDF
xzplot <- 1; # Plot: 0: Dots, 1: Line, 2: Dots + Line
xzbgcol <- "white"; # Background color
xzdrawxyp <- 3; # Draw Cartesian Plane: 0: No, 1: Yes, 2: Yes (marking X=0, Y=0 Axis), 3: Yes (marking X=0, Y=0, and other major Axis)
xztitle <- "F-Graph 2D : y=sin(x)"; # Title of the Graph
xzfname <- "fgraph"; # File name (without extension)
zxlimx <- 10; zxlimy <- zxlimx; # Range
if (xzplot == 0 || xzplot == 2) {xzlen = 100;} else {xzlen = 1000;}
x <- seq(-zxlimx-2, zxlimx+2, length = xzlen); y <- sin(x); # Define your Function
# x <- c(0,2,3,2.5); y <- c(0,1,7,4); # Plot on a Cartesian Plane 
# tmp <- x; x <- y; y <- tmp; # Swap X/Y

if (xzou == 1) {
par(bg = xzbgcol);
} else if (xzou == 2) {
library(RSvgDevice);
devSVG(paste(xzfname,".svg",sep="",collapse=""), width=10, height=10, bg=xzbgcol);
} else if (xzou == 3) {
png(filename=paste(xzfname,".png",sep="",collapse=""), height=500, width=500, bg=xzbgcol);
} else if (xzou == 4) {
pdf(file=paste(xzfname,".pdf",sep="",collapse=""), height=5, width=5, bg=xzbgcol);
}
if (xzdrawxyp>0) {
plot(c(-zxlimx,zxlimx), c(-zxlimy,zxlimy), type = "n", col="black", xlab="X", ylab="Y", asp=1);
if (xzdrawxyp>1) {
abline(h=0, v=0, lty="longdash", col="cadetblue4");
if (xzdrawxyp==3) {
abline(h=seq(-zxlimx-1,zxlimx+1,1), v=seq(-zxlimy-1,zxlimy+1,1), lty="dotted", col="cadetblue3");
# abline(h=seq(-zxlimx-0.5,zxlimx+0.5,1), v=seq(-zxlimy-0.5,zxlimx+0.5,1), lty="dotted", col="cadetblue1");
}
}
}
if (xzplot == 0) {
if (xzdrawxyp==0) {plot(x,y,col="red",asp=1);} else {points(x,y,col="red",asp=1);}
} else if (xzplot==1) {
if (xzdrawxyp==0) {
plot(x,y,pch="",asp=1);
} else {
# points(x,y,pch="",asp=1);
}
lines(x,y,col="blue");
} else if (xzplot==2) {
if (xzdrawxyp==0) {plot(x,y,col="red",asp=1);} else {points(x,y,col="red",asp=1);}
lines(x,y,col="blue");
}
title(xztitle, cex.main=1.1);
if (xzou > 1) {
dev.off();
}