
##load_vector_using_rgdal
##load_raster_using_rgdal
##movecost script=group
##DTM=raster
##Origin=vector point
##Destination=vector point
##Movecost=name
##Move=number 8
##Breaks=number 0.5
##Function=selection t;tofp;mp;icmonp;icmoffp;icfonp;ug;alb;gkrs;r;ree;hrz;wcs;p;vl;ls;b;icfoffp
##Time=selection h;m 
##Outp=selection r;c 
##Return_Base=selection TRUE;FALSE
##Cognitive_Slope=selection TRUE;FALSE
##Critical_Slope=number 1
##Walker_Body_Weight=number 70
##Carried_Load_Weight=number 0
##N=number 1
##Speed=number 1
##Zoom_Level=number 9
##RL=number 2
##CL=selection TRUE;FALSE
##DL=selection TRUE;FALSE
##CB=number 0.6
##CLL=number 0.6
##Output=output folder
##showplots
setwd(Output)


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

if(CL==0)	
	CL=c(TRUE)
if(CL==1)	
	CL=c(FALSE)	

if(DL==0)	
	DL=c(TRUE)
if(DL==1)	
	DL=c(FALSE)		
movecost(dtm=DTM, origin=Origin, destin=Destination, funct=Function, time=Time, outp=Outp, move=Move, breaks=Breaks,return.base=Return_Base, cogn.slp=Cognitive_Slope, sl.crit=Critical_Slope,W=Walker_Body_Weight,L=Carried_Load_Weight,N=N,V=Speed,z=Zoom_Level,rb.lty=RL,cont.lab=CL,destin.lab=DL,cex.breaks=CB,cex.lcp.lab=CLL, export=TRUE)

