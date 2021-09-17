##load_vector_using_rgdal
##load_raster_using_rgdal
##movecost script=group
##DTM=raster
##Origin=vector point
##Destination=vector point
##Movecomp=name
##Move=number 16
##Choice1=selection t;tofp;mp;icmonp;icmoffp;icfonp;icfoffp;ug;ma;alb;gkrs;r;ks;wcs;ree;b;p;pcf;m;hrz;vl;ls;a ;
##Choice2=selection t;tofp;mp;icmonp;icmoffp;icfonp;icfoffp;ug;ma;alb;gkrs;r;ks;wcs;ree;b;p;pcf;m;hrz;vl;ls;a ;
##Choice3=selection ;t;tofp;mp;icmonp;icmoffp;icfonp;icfoffp;ug;ma;alb;gkrs;r;ks;wcs;ree;b;p;pcf;m;hrz;vl;ls;a ;
##Return_Base=string TRUE
##Cognitive_Slope=string TRUE
##Critical_Slope=number 10
##Walker_Body_Weight=number 70
##Carried_Load_Weight=number 0
##N=number 1
##Speed=number 1
##Zoom_Level=number 9
##Output_LCP=output vector
##Output_LCP_Back=output vector

##showplots
install.packages("movecost")
library(sp)
library(movecost)
library(raster)
library(rgdal)
DTM<-raster(DTM)
if(Choice1==0)
	Choice1="t"
if(Choice1==1)
	Choice1="tofp"
if(Choice1==2)
	Choice1="mp"
if(Choice1==3)
	Choice1="icmonp"
if(Choice1==4)
	Choice1="icmoffp"
if(Choice1==5)
	Choice1="icfonp"
if(Choice1==6)
	Choice1="icfoffp"
if(Choice1==7)
	Choice1="ug"
if(Choice1==8)
	Choice1="ma"
if(Choice1==9)
	Choice1="alb"
if(Choice1==10)
	Choice1="gkrs"
if(Choice1==11)
	Choice1="r"
if(Choice1==12)
	Choice1="ks"
if(Choice1==13)
	Choice1="wcs"
if(Choice1==14)
	Choice1="ree"
if(Choice1==15)
	Choice1="b"
if(Choice1==16)
	Choice1="b"
if(Choice1==17)
	Choice1="p"
if(Choice1==18)
	Choice1="pcf"	
if(Choice1==19)
	Choice1="m"		
if(Choice1==20)
	Choice1="hrz"	
if(Choice1==21)
	Choice1="vl"	
if(Choice1==22)
	Choice1="ls"	
if(Choice1==23)
	Choice1="a"	
	
	
if(Choice2==0)
	Choice2="t"
if(Choice2==1)
	Choice2="tofp"
if(Choice2==2)
	Choice2="mp"
if(Choice2==3)
	Choice2="icmonp"
if(Choice2==4)
	Choice2="icmoffp"
if(Choice2==5)
	Choice2="icfonp"
if(Choice2==6)
	Choice2="icfoffp"
if(Choice2==7)
	Choice2="ug"
if(Choice2==8)
	Choice2="ma"
if(Choice2==9)
	Choice2="alb"
if(Choice2==10)
	Choice2="gkrs"
if(Choice2==11)
	Choice2="r"
if(Choice2==12)
	Choice2="ks"
if(Choice2==13)
	Choice2="wcs"
if(Choice2==14)
	Choice2="ree"
if(Choice2==15)
	Choice2="b"
if(Choice2==16)
	Choice2="b"
if(Choice2==17)
	Choice2="p"
if(Choice2==18)
	Choice2="pcf"	
if(Choice2==19)
	Choice2="m"		
if(Choice2==20)
	Choice2="hrz"	
if(Choice2==21)
	Choice2="vl"	
if(Choice2==22)
	Choice2="ls"	
if(Choice2==23)
	Choice2="a"	

if(Choice3==0)
	Choice3=""	
if(Choice3==1)
	Choice3="t"
if(Choice3==2)
	Choice3="tofp"
if(Choice3==3)
	Choice3="mp"
if(Choice3==4)
	Choice3="icmonp"
if(Choice3==5)
	Choice3="icmoffp"
if(Choice3==6)
	Choice3="icfonp"
if(Choice3==7)
	Choice3="icfoffp"
if(Choice3==8)
	Choice3="ug"
if(Choice3==9)
	Choice3="ma"
if(Choice3==10)
	Choice3="alb"
if(Choice3==11)
	Choice3="gkrs"
if(Choice3==12)
	Choice3="r"
if(Choice3==13)
	Choice3="ks"
if(Choice3==14)
	Choice3="wcs"
if(Choice3==15)
	Choice3="ree"
if(Choice3==16)
	Choice3="b"
if(Choice3==17)
	Choice3="b"
if(Choice3==18)
	Choice3="p"
if(Choice3==19)
	Choice3="pcf"	
if(Choice3==20)
	Choice3="m"		
if(Choice3==21)
	Choice3="hrz"	
if(Choice3==22)
	Choice3="vl"	
if(Choice3==23)
	Choice3="ls"	
if(Choice3==24)
	Choice3="a"	
	
Return_Base<-noquote(Return_Base)	
Cognitive_Slope<-noquote(Cognitive_Slope)


	
tryCatch({
r<-movecomp(dtm=DTM, origin=Origin, destin=Destination, choice=c(Choice1,Choice2),  move=Move, return.base=Return_Base, cogn.slp=Cognitive_Slope, sl.crit=Critical_Slope, W=Walker_Body_Weight, L=Carried_Load_Weight, N=N, V=Speed, z=Zoom_Level, oneplot=FALSE, export=FALSE)
},
    error = function(e) {str(e) 
r<-movecomp(dtm=DTM,origin=Origin, destin=Destination, choice=c(Choice1,Choice2,Choice3), move=Move, return.base=Return_Base, cogn.slp=Cognitive_Slope, sl.crit=Critical_Slope, W=Walker_Body_Weight, L=Carried_Load_Weight, N=N, V=Speed, z=Zoom_Level, oneplot=FALSE, export=FALSE)})
b1.sp<-as(r$LCPs, "SpatialLinesDataFrame")
Output_LCP=b1.sp

if(Return_Base==TRUE){lback.sp<-as(r$LPCs.back, "SpatialLinesDataFrame")	
Output_LCP_Back=lback.sp}

