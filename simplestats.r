# Simple Stats
# by Valerio Capello (Elf Qrin) / http://labs.geody.com/
# r2011-07-05 fr2011-07-05
# License: GPL

x1<-c(-1,0,0,1,5,-1,3,3,3,4,5,4,2,4,1,5,6,4,5,5); # Define Items (Source data)

mode_stat <- function(v) {
corr=abs(min(v))+1;
v<-v+corr;
vt<-tabulate(v);
vmode<-which(vt==max(vt));
if (sum(vt==max(vt))>1) {vmode<-NA;} else {vmode<-vmode-corr;}
vmode;
}

"Stats";
"Items (as given): "; print(x1);
"Items (sorted, inc): "; print(sort(x1,decreasing=FALSE));
"Items (sorted, dec): "; print(sort(x1,decreasing=TRUE));
"Total items: "; length(x1);
"Min: "; min(x1);
"Max: "; max(x1);
"Sum: "; sum(x1);
"Average: "; mean(x1);
"Median: "; median(x1);
"Mode: "; mode_stat(x1);
"Variance: "; var(x1);
"Standard Deviation: "; sd(x1);
