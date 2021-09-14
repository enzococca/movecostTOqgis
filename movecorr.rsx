##load_vector_using_rgdal
##load_raster_using_rgdal
##movecost script=group
##Movecorr=name
##DTM=raster
##Points=vector point
##Selection_ID_Point_A=number 1
##Selection_ID_Point_B=number 2
##Move=number 16
##Function=selection t;tofp;mp;icmonp;icmoffp;icfonp;icfoffp;ug;ma;alb;gkrs;r;ks;wcs;ree;b;p;pcf;m;hrz;vl;ls;a ;
##Time=selection h;m ;
##Cognitive_Slope=string TRUE
##Critical_Slope=number 10
##Walker_Body_Weight=number 70
##Carried_Load_Weight=number 0
##N=number 1
##Speed=number 1
##Zoom_Level=number 9


##Output_LC_corridor=output raster
##Output_Accum_Cost_Surface_A=output raster
##Output_Accum_Cost_Surface_B=output raster
##Output_LCP_A_to_B=output vector
##Output_LCP_B_to_A=output vector



##showplots
install.packages("movecost")
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
if(Time==0)
	Time=c("h")
if(Time==1)
	Time=c("m")



Cognitive_Slope<-noquote(Cognitive_Slope)

	
r<-movecorr(a=Points[Selection_ID_Point_A,],b=Points[Selection_ID_Point_B,],funct=Function,time=Time,move=Move,dtm=DTM,cogn.slp=Cognitive_Slope,sl.crit=Critical_Slope,W=Walker_Body_Weight,L=Carried_Load_Weight,N=N,V=Speed,z=Zoom_Level)


LC.sp<- as(r$lc.corridor, "SpatialPixelsDataFrame") 
Output_LC_corridor=LC.sp

raster.sp <- as(r$accum_cost_surf_a, "SpatialPixelsDataFrame") 
Output_Accum_Cost_Surface_A=raster.sp

raster2.sp <- as(r$accum_cost_surf_b, "SpatialPixelsDataFrame") 
Output_Accum_Cost_Surface_B=raster2.sp

a1.sp<-as(r$lcp_a_to_b, "SpatialLinesDataFrame")
Output_LCP_A_to_B=a1.sp

b1.sp<-as(r$lcp_b_to_a, "SpatialLinesDataFrame")
Output_LCP_B_to_A=b1.sp

