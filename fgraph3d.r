# F-Graph 3D - Graph of a 3D Function
# by Valerio Capello (Elf Qrin) / http://labs.geody.com/
# r2011-06-22 fr2011-06-22
# License: GPL

# Config
xzou <- 1; # Output: 1: Screen, 2: SVG file (vectorial, requires RSvgDevice), 3: PNG file (bitmap), 4: PDF
xzplot <- 1; # Plot: 0: Dots (requires scatterplot3d), 1: Draw a Function in Wireframe (requires lattice)
xzbgcol <- "white"; # Background color
xztitle <- "F-Graph 3D"; # Title of the Graph
xzfname <- "fgraph3d"; # File name (without extension)
x <- seq(0,100,1); y <- seq(0,100,1); z <- sin(x/10) %o% cos(y/10); # Define your Function
# x <- sin(seq(0,100,1)/10); y <- cos(seq(0,100,1)/10); z <- seq(1,length(x),1); # Dots
# x <- c(0,2,3,2.5); y <- c(0,1,7,4); z <- c(0,5,12,6); # Plot in a 3D Space (Dots)

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
if (xzplot == 0) {
library(scatterplot3d);
scatterplot3d(x, y, z, highlight.3d=TRUE, col.axis="blue", col.grid="lightblue", xlab="X", ylab="Y", zlab="Z", main=xztitle, pch=20);
} else if (xzplot==1) {
library(lattice);
wireframe(z, drape=TRUE, scale=list(arrows=FALSE), xlab="X", ylab="Y", zlab="Z", main=xztitle);
}
# title(xztitle, cex.main=1.1);
if (xzou > 1) {
dev.off();
}