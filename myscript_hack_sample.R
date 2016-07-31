
#program for extracting gender specific negative gearing percentages for victoria
pathm="/home/bipin/Downloads/ATS/1270055001_sa4_2011_aust_shape"
mydata14=read.csv("/home/bipin/Downloads/ATS/2013-14/Sample_file_1314/2014_sample_file.csv")
mydata14n=mydata14[,c("Ind","age_range","Net_rent_amt","Gender","Region")]
mydata14ng=mydata14n[mydata14n$Net_rent_amt<0,]

mydata14ngem=mydata14ng[mydata14ng$Gender==0,]
mydata14ngemall=mydata14n[mydata14n$Gender==0,]
mydata14ngef=mydata14ng[mydata14ng$Gender==1,]
mydata14ngefall=mydata14n[mydata14n$Gender==1,]
xagen=0;numit=201;xagenall=0;
m <- as.data.frame(matrix(0, ncol = 17, nrow = 12))
nrow(xage[xage$Region==numit,])
for (numit in 201:217) {
for(i in 0:11) {
  xagenall=mydata14ngemall[mydata14ngemall$age_range==i,]
  xage=mydata14ngem[mydata14ngem$age_range==i,]
   xagen[i+1]= nrow(xage[xage$Region==numit,])/nrow(xagenall[xagenall$Region==numit,])
}
m[,numit-200]=xagen
}
m1 <- as.data.frame(matrix(0, ncol = 17, nrow = 12))
for (numit in 201:217) {
  for(i in 0:11) {
    xagenall=mydata14ngefall[mydata14ngefall$age_range==i,]
    xage=mydata14ngef[mydata14ngef$age_range==i,]
    xagen[i+1]= nrow(xage[xage$Region==numit,])/nrow(xagenall[xagenall$Region==numit,])
  }
  m1[,numit-200]=xagen
}
#These files contain ratios of males across different age ranges who negative gear
write.csv(t(m),file='maletrat')

#These files contain ratios of females across different age ranges who negative gear
write.csv(t(m1),file='femaletrat')


