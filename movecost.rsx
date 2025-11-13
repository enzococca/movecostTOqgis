##load_vector_using_rgdal
##load_raster_using_rgdal
##movecost script=group
##DTM=raster
##Origin=vector point
##Destination=vector point
##Movecost=name
##Move=number 16
##Breaks=number 0.5
##Function=selection t;tofp;mp;icmonp;icmoffp;icfonp;icfoffp;ug;ma;alb;gkrs;r;ks;wcs;ree;b;p;pcf;m;hrz;vl;ls;a ;
##Time=selection h;m ;
##Outp=selection r;c ;
##Return_Base=string TRUE
##Cognitive_Slope=string TRUE
##Critical_Slope=number 10
##Walker_Body_Weight=number 70
##Carried_Load_Weight=number 0
##N=number 1
##Speed=number 1
##Zoom_Level=number 9
##RL=number 2
##CL=string TRUE
##DL=string TRUE
##CB=number 0.6
##CLL=number 0.6
##Output_Accum_Cost_Surface=output raster
##Output_Isoline=output vector
##Output_LCP=output vector
##Output_LCP_Back=output vector
##Output_W_Cost=output vector


##showplots
if (!requireNamespace("movecost", quietly = TRUE)) {
  install.packages("movecost")
}
library(sp)
library(movecost)
library(raster)
library(rgdal)
DTM<-raster(DTM)
if(Function==0)
	Function=c("t")
if(Function==1)
	Function=c("tofp")
if(Function==2)
	Function=c("mp")
if(Function==3)
	Function=c("icmonp")
if(Function==4)
	Function=c("icmoffp")
if(Function==5)
	Function=c("icfonp")
if(Function==6)
	Function=c("icfoffp")
if(Function==7)
	Function=c("ug")
if(Function==8)
	Function=c("ma")
if(Function==9)
	Function=c("alb")
if(Function==10)
	Function=c("gkrs")
if(Function==11)
	Function=c("r")
if(Function==12)
	Function=c("ks")
if(Function==13)
	Function=c("wcs")
if(Function==14)
	Function=c("ree")
if(Function==15)
	Function=c("b")
if(Function==16)
	Function=c("p")
if(Function==17)
	Function=c("pcf")
if(Function==18)
	Function=c("m")
if(Function==19)
	Function=c("hrz")
if(Function==20)
	Function=c("vl")
if(Function==21)
	Function=c("ls")
if(Function==22)
	Function=c("a")		
if(Time==0)
	Time=c("h")
if(Time==1)
	Time=c("m")
if(Outp==0)
	Outp=c("r")
if(Outp==1)
	Outp=c("c")
	
Return_Base<-noquote(Return_Base)	
Cognitive_Slope<-noquote(Cognitive_Slope)
DL<-noquote(DL)	
CL<-noquote(CL)
	
r<-movecost(dtm=DTM, origin=Origin, destin=Destination, funct=Function, time=Time, outp=Outp, move=Move, breaks=Breaks, return.base=Return_Base, cogn.slp=Cognitive_Slope, sl.crit=Critical_Slope, W=Walker_Body_Weight, L=Carried_Load_Weight, N=N, V=Speed, z=Zoom_Level, rb.lty=RL, cont.lab=CL, destin.lab=DL, cex.breaks=CB, cex.lcp.lab=CLL, oneplot=FALSE, export=FALSE)

raster.sp <- as(r$accumulated.cost.raster, "SpatialPixelsDataFrame") 
Output_Accum_Cost_Surface=raster.sp

a1.sp<-as(r$isolines, "SpatialLinesDataFrame")
Output_Isoline=a1.sp

b1.sp<-as(r$LCPs, "SpatialLinesDataFrame")
Output_LCP=b1.sp

if(Return_Base==TRUE){lback.sp<-as(r$LCPs.back, "SpatialLinesDataFrame")	
Output_LCP_Back=lback.sp}

if(DL==TRUE){dd.sp<-as(r$dest.loc.w.cost, "SpatialPointsDataFrame")
Output_W_Cost=dd.sp}
