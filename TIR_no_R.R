##Pacotes

library(pracma)

library(spuRs)

library(rootSolve)



y=function(x)-800+240/(1+x)+260/((1+x)^2)+280/((1+x)^3)+300/((1+x)^4)

newtonRaphson(y,0.5)



#Usando o uniroot.all  para encontrar todas as raizes

uniroot.all(y, c(-1,3))#funcao + um intervalo

