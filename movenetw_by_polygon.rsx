##load_vector_using_rgdal
##load_raster_using_rgdal
##movecost script=group
##Movenetw by Polygon=name
##Area_of_interest=vector polygon
##Origin=vector point
##Move=number 16
##Function=selection t;tofp;mp;icmonp;icmoffp;icfonp;icfoffp;ug;ma;alb;gkrs;r;ks;wcs;ree;b;p;pcf;m;hrz;vl;ls;a ;
##Cognitive_Slope=string TRUE
##Critical_Slope=number 10
##Walker_Body_Weight=number 70
##Carried_Load_Weight=number 0
##N=number 1
##Speed=number 1
##Zoom_Level=number 9
##LCP_DENS=string TRUE

##Output_LCPs_netw_merged=output vector
##Output_DTM=output raster
##Output_LCPs_density_count=output raster
##Output_LCPs_density_perc=output raster
##Output_LCPs_netw=output vector



##showplots
install.packages("movecost")
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
	Function=c("b")
if(Function==17)
	Function=c("p")
if(Function==18)
	Function=c("pcf")	
if(Function==19)
	Function=c("m")		
if(Function==20)
	Function=c("hrz")	
if(Function==21)
	Function=c("vl")	
if(Function==22)
	Function=c("ls")	
if(Function==23)
	Function=c("a")	


Cognitive_Slope<-noquote(Cognitive_Slope)
LCP_DENS<-noquote(LCP_DENS)
r<-movenetw(studyplot=Area_of_interest, origin=Origin,  move=Move, funct=Function, cogn.slp=Cognitive_Slope, sl.crit=Critical_Slope, W=Walker_Body_Weight, L=Carried_Load_Weight, N=N, V=Speed, z=Zoom_Level, lcp.dens=LCP_DENS, oneplot=FALSE, export=FALSE)



b1.sp<-as(r$LCPs.netw.merged, "SpatialLinesDataFrame")
Output_LCPs_netw_merged=b1.sp


dtm.sp <- as(r$dtm, "SpatialPixelsDataFrame") 
Output_DTM=dtm.sp





a1<-r$LCPs.netw
for (i in r$LCPs.netw){Output_LCPs_netw=i}

raster.sp <- as(r$LCPs.density.count, "SpatialPixelsDataFrame") 
Output_LCPs_density_count=raster.sp
raster2.sp <- as(r$LCPs.density.perc, "SpatialPixelsDataFrame") 
Output_LCPs_density_perc=raster2.sp