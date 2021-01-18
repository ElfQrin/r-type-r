# Simple Charts
# by Valerio Capello (Elf Qrin) / http://labs.geody.com/
# r2021-01-18 fr2011-06-19
# License: GPL


# Config

xzou <- "scn"; # Output: scn: Screen, svg_1: SVG file (vectorial, requires RSvgDevice), svg_2: SVG file (vectorial, requires svglite), png: PNG file (bitmap), pdf: PDF document
xzplot <- 2; # Chart type: 0: Dots, 1: Line, 2: Dots + Line, 3: Bars (vertical), 4: Bars (horizontal), 5: Histogram, 6: Pie (clockwise), 7: Pie (anticlockwise), 8: Dotchart
xzbgcol <- "white"; # Background color
xztitle <- "Chart"; # Title of the Chart
xzfname <- "schart"; # File name (without extension)
sdata1 <- c(1, 3, 6, 4, 9, 7, 12); # Source data
xzaxx=c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"); # X-Axis labels
xzaxvl=FALSE; # Add Y-Axis value to X-Axis labels (recommended for Pie Chart)
xzaxpc=FALSE; # Add % Y-Axis value to X-Axis labels (recommended for Pie Chart)
xzaxys=1; # Y-Axis values step (Chart type 0, 1, 2)
xzaxxt="Week Days"; # Labels (generally X-Axis) title (Chart type 0, 1, 2, 3, 4, 5, 8)
xzaxyt="Items"; # Values (generally Y-Axis) title (Chart type 0, 1, 2, 3, 4, 5, 8)
xzstats=TRUE; # Statistical Information (Chart type 0, 1, 2, 3)


# Functions

mode_stat <- function(v) {
corr=abs(min(v))+1;
v<-v+corr;
vt<-tabulate(v);
vmode<-which(vt==max(vt));
if (sum(vt==max(vt))>1) {vmode<-NA;} else {vmode<-vmode-corr;}
vmode;
}


# Main

if (xzaxvl) {
xzaxx <- paste(xzaxx," - ",sdata1,sep="");
}
if (xzaxpc) {
xzaxx <- paste(xzaxx," ","(",round(sdata1/sum(sdata1)*100,1),"%",")",sep="");
}
if (xzplot == 4) {xztmp <- xzaxxt; xzaxxt <- xzaxyt; xzaxyt <- xztmp;}

# Open Output Device
if (xzou=="scn") {
par(bg = xzbgcol);
} else if (xzou=="svg_1") {
library(RSvgDevice);
devSVG(paste(xzfname,".svg",sep="",collapse=""), width=10, height=10, bg=xzbgcol);
} else if (xzou=="svg_2") {
library(svglite);
svglite(file=paste(xzfname,".svg",sep="",collapse=""), width=10, height=10, bg=xzbgcol, pointsize=12, standalone=TRUE, system_fonts=list(), user_fonts=list());
} else if (xzou=="png") {
png(filename=paste(xzfname,".png",sep="",collapse=""), height=500, width=500, bg=xzbgcol);
} else if (xzou=="pdf") {
pdf(file=paste(xzfname,".pdf",sep="",collapse=""), height=5, width=5, bg=xzbgcol);
}

gtrange <- range(0, sdata1);
if (xzplot == 0) {
plot(sdata1,col="red", ylim=gtrange, axes=FALSE, ann=FALSE);
} else if (xzplot == 1) {
plot(sdata1,pch="", ylim=gtrange, axes=FALSE, ann=FALSE);
lines(sdata1,col="blue");
} else if (xzplot == 2) {
plot(sdata1,col="red", ylim=gtrange, axes=FALSE, ann=FALSE);
lines(sdata1,col="blue");
} else if (xzplot == 3) {
barplot(sdata1, names.arg=xzaxx, col="blue", border="antiquewhite4", horiz=FALSE);
} else if (xzplot == 4) {
barplot(sdata1, names.arg=xzaxx, col="blue", border="antiquewhite4", horiz=TRUE);
} else if (xzplot == 5) {
hist(sdata1, main=xztitle, xlab=xzaxxt, ylab=xzaxyt, col="darkgrey", border="antiquewhite4");
} else if (xzplot == 6) {
pie(sdata1, main=xztitle, col=rainbow(length(sdata1)), labels=xzaxx, clockwise=TRUE);
} else if (xzplot == 7) {
pie(sdata1, main=xztitle, col=rainbow(length(sdata1)), labels=xzaxx, clockwise=FALSE);
} else if (xzplot == 8) {
dotchart(sdata1, xlab=xzaxyt, ylab=xzaxxt, main=xztitle, cex=0.8);
}
if (xzplot < 3) {
axis(1, at=1:length(xzaxx), lab=xzaxx);
axis(2, las=1, at=xzaxys*0:gtrange[2]);
box();
}
if (xzplot < 5) {
title(xlab=xzaxxt, col.lab=rgb(0.1,0.6,0.1));
title(ylab=xzaxyt, col.lab=rgb(0.1,0.6,0.1));
title(xztitle, cex.main = 1.1);
}
if (xzstats) {
legend(1,range(sdata1)[2],
c(
paste("Tot",length(sdata1),sep=" ",collapse=""),
paste("Min",min(sdata1),sep=" ",collapse=""),
paste("Max",max(sdata1),sep=" ",collapse=""),
paste("Sum",sum(sdata1),sep=" ",collapse=""),
paste("Avg",mean(sdata1),sep=" ",collapse=""),
paste("Med",median(sdata1),sep=" ",collapse=""),
paste("Mod",mode_stat(sdata1),sep=" ",collapse=""),
paste("Var",var(sdata1),sep=" ",collapse=""),
paste("SDv",formatC(sd(sdata1),format="f",digits=5),sep=" ",collapse="")
),
cex=0.8,text.col=c("darkblue"),bg="azure"
);
}

# Close Output Device
if (xzou!="scn") {
dev.off();
}
