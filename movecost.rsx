##load_vector_using_rgdal
##load_raster_using_rgdal
##movecost script=group
##DTM=raster
##Origin=vector point
##Destination=vector point
##Movecost=name
##Move=number 8
##Breaks=number 0.5
##Function=string "t"
##Time=string "h"
##Outp=string "r"
##Return_Base=string TRUE
##Cognitive_Slope=string FALSE
##Critical_Slope=number 1
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
##Output=output folder
##showplots
setwd(Output)


library(sp)
library(movecost)
library(raster)
library(rgdal)
DTM<-raster(DTM)


movecost(dtm=DTM, origin=Origin, destin=Destination, funct=Function, time=Time, outp=Outp, move=Move, breaks=Breaks,return.base=Return_Base, cogn.slp=Cognitive_Slope, sl.crit=Critical_Slope,W=Walker_Body_Weight,L=Carried_Load_Weight,N=N,V=Speed,z=Zoom_Level,rb.lty=RL,cont.lab=CL,destin.lab=DL,cex.breaks=CB,cex.lcp.lab=CLL, export=TRUE)

