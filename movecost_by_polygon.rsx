##load_vector_using_rgdal
##load_raster_using_rgdal
##movecost script=group
##Area_of_interest=vector polygon
##Origin=vector point
##Destination=vector point 
##Movecost by Polygon=name
##Move=number 8
##Breaks=number 0.5
##Function=selection t;tofp;mp;icmonp;icmoffp;icfonp;ug;alb;gkrs;r;ree;hrz;wcs;p;vl;ls;b;icfoffp ;
##Time=selection h;m ;
##Outp=selection r;c ;
##Return_Base=selection TRUE;FALSE ;
##Cognitive_Slope=selection FALSE;TRUE ;
##Critical_Slope=number 1
##Walker_Body_Weight=number 70
##Carried_Load_Weight=number 0
##N=number 1
##Speed=number 1
##Zoom_Level=number 9
##RL=number 2
##CL=selection TRUE;FALSE ;
##DL=selection TRUE;FALSE ;
##CB=number 0.6
##CLL=number 0.6
##Output_DTM=output raster
##Output_Accum_Cost_Surface=output raster
##Output_Isoline=output vector
##Output_LCP=output vector
##Output_LCP_Back=output vector
##Output_W_Cost=output vector
##showplots

library(sp)
library(movecost)

library(raster)
library(rgdal)
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
	Function=c("ug")
if(Function==7)
	Function=c("alb")
if(Function==8)
	Function=c("gkrs")
if(Function==9)
	Function=c("r")
if(Function==10)
	Function=c("ree")
if(Function==11)
	Function=c("hrz")
if(Function==12)
	Function=c("wcs")
if(Function==13)
	Function=c("p")
if(Function==14)
	Function=c("vl")
if(Function==15)
	Function=c("ls")
if(Function==16)
	Function=c("b")
if(Function==17)
	Function=c("icfoffp")
if(Time==0)
	Time=c("h")
if(Time==1)
	Time=c("m")
if(Outp==0)
	Outp=c("r")
if(Outp==1)
	Outp=c("c")
	
if(Return_Base==0)	
	Return_Base=c(TRUE)
if(Return_Base==1)	
	Return_Base=c(FALSE)
	
if(Cognitive_Slope==0)	
	Cognitive_Slopee=c(TRUE)
if(Cognitive_Slope==1)	
	Cognitive_Slope=c(FALSE)	

#if(CL==0)	
#	CL=c(TRUE)
#if(CL==1)	
#	CL=c(FALSE)	

#if(DL==0)	
#	DL=c(TRUE)
#if(DL==1)	
#	DL=c(FALSE)			

r<-movecost(dtm=NULL, origin=Origin, destin=Destination, studyplot=Area_of_interest,funct=Function, time=Time, outp=Outp, move=Move, breaks=Breaks, return.base=TRUE, cogn.slp=Cognitive_Slope,  sl.crit=Critical_Slope,W=Walker_Body_Weight, L=Carried_Load_Weight,N=N, V=Speed, z=Zoom_Level, rb.lty=RL, cont.lab=TRUE, destin.lab=TRUE, cex.breaks=CB, cex.lcp.lab=CLL, oneplot=FALSE, export=FALSE)

raster2.sp <- as(r$dtm, "SpatialPixelsDataFrame") 
Output_DTM=raster2.sp

raster.sp <- as(r$accumulated.cost.raster, "SpatialPixelsDataFrame") 
Output_Accum_Cost_Surface=raster.sp

a1.sp<-as(r$isolines, "SpatialLinesDataFrame")
Output_Isoline=a1.sp

b1.sp<-as(r$LCPs, "SpatialLinesDataFrame")
Output_LCP=b1.sp

lback.sp<-as(r$LCPs.back, "SpatialLinesDataFrame")
Output_LCP_Back=lback.sp

dd.sp<-as(r$dest.loc.w.cost, "SpatialPointsDataFrame")
Output_W_Cost=dd.sp
