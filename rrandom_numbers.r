# RRandom Numbers
# by Valerio Capello (Elf Qrin) / http://labs.geody.com/
# r2021-01-18 fr2011-11-26
# License: GPL


# Config

rngen<-10; # Numbers to generate
rnmin<-1; # Min value
rnmax<-12; # Max value
rndcc<-10^2; # Decimal digits (for Decimal numbers generated with "sample")


# Main

# Generate N decimal numbers between Min and Max (excluded), with repeats
rndx<-runif(rngen,rnmin,rnmax);
rndx;

# Generate N integer numbers between Min and Max (included), with repeats
rndx<-runif(rngen,rnmin-.1,rnmax+.1);
rndx<-floor(rndx)+1;
rndx;

# Generate N integer numbers between Min and Max (included), with repeats
# Warning: will allocate much memory for large numbers 
rndx<-sample(rnmin:rnmax,rngen,replace=T);
rndx;

# Generate N integer numbers between Min and Max (included), without repeats
# Warning: will allocate much memory for large numbers 
rndx<-sample(rnmin:rnmax,rngen,replace=F);
rndx;

# Generate N decimal numbers between Min and Max (included), with repeats
# Warning: will allocate much memory for large numbers 
rndx<-sample((rnmin*rndcc):(rnmax*rndcc),rngen,replace=T);
rndx<-rndx/rndcc;
rndx;

# Generate N decimal numbers between Min and Max (included), without repeats
# Warning: will allocate much memory for large numbers 
rndx<-sample((rnmin*rndcc):(rnmax*rndcc),rngen,replace=F);
rndx<-rndx/rndcc;
rndx;

# Generate N values from given array, with repeats
rndc<-c("head","tail");
rndx<-sample(rndc,rngen,replace=T);
rndx;

# Generate N values from given array, without repeats
rndc<-c("one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve");
rndx<-sample(rndc,rngen,replace=F);
rndx;

# Sort given array randomly
rndc<-c("one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve");
rndx<-sample(rndc,length(rndc),replace=F);
rndx;
