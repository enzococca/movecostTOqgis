##load_vector_using_rgdal
##load_raster_using_rgdal
##movecost script=group
##DTM=raster
##Points=vector point
##Movebound=name
##Move=number 16
##Cost_Value=number 1
##Function=selection t;tofp;mp;icmonp;icmoffp;icfonp;ug;alb;gkrs;r;ree;hrz;wcs;p;vl;ls;b;icfoffp ;
##Time=selection h;m ;
##Cognitive_Slope=string TRUE
##Critical_Slope=number 10
##Walker_Body_Weight=number 70
##Carried_Load_Weight=number 0
##N=number 1
##Speed=number 1
##Zoom_Level=number 9
##Output_Isoline=output vector
##showplots

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



Cognitive_Slope<-noquote(Cognitive_Slope)

r<-movebound(dtm=DTM, origin=Points, funct=Function, time=Time, move=Move, cont.value=Cost_Value, cogn.slp=Cognitive_Slope,  sl.crit=Critical_Slope,W=Walker_Body_Weight, L=Carried_Load_Weight,N=N, V=Speed, z=Zoom_Level, cont.lab=TRUE, export=FALSE)



a1.sp<-as(r$isolines, "SpatialLinesDataFrame")
Output_Isoline=a1.sp

