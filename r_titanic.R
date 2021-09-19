library(rstan)
d <- read.csv(file="nan_handled.csv")
is.na
data <- list(N=nrow(d),Sex=d$Sex,Pclass=d$Pclass/3,Fare=d$Fare/max(d['Fare']),Age=d$Age/100,Y=d$Survived)
fit<-stan(file='model_titanic.stan',data=data,seed=1234)