# Hello World
# by Valerio Capello (Elf Qrin) / http://labs.geody.com/
# r2017-05-15 fr2017-05-15
# License: GPL

xzou <- 1; # Output: 1: Screen, 2: SVG file (vectorial, requires RSvgDevice), 3: PNG file (bitmap), 4: PDF
xzbgcol <- "white"; # Background color

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

# Write to the console
message("Hello World!\nLine 2");
writeLines("Hello World!\nLine 2");
cat("Hello World!\nLine 2"); # No BR at the end
print("Hello World!\nLine 2"); # No ESCaped characters

# Write to the output device
# ?

if (xzou > 1) {
dev.off();
}
