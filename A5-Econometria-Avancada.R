# Econometria Avan�ada A5

#Revis�o de alguns comando + Cria��o de S�rie Temporal 

install.packages("readxl") #instalando o pacote readxl
library(readxl) #rodando o pacote readxl
install.packages("urca") #instalando o pacote urca
library(urca) #rodando o pacote urca
IPCA <- read_excel("C:/Econometria/IPCA.xls", col_types = c("date","numeric")) #Abre o arquivo excel IPCA no RSTUDIO
Infla��o <- ts(IPCA$IPCA,start = 2008-01, frequency = 12) #constr�i uma s�rie temporal com os dados da Infla��o
View(Infla��o) #Visualizar
write.csv(Infla��o,file = "Infla��o.csv")

# Comando para realizar o Teste de Estacionariedade

TesteDF <- summary(ur.df(Infla��o, type="none", lags=0))
TesteDF

# Criando o Gr�fico de Autocorrela��o

acf(IPCA$IPCA, main="Infla��o Mensal") #FAC fun��o de auto correla��o
pacf(IPCA$IPCA, main="Infla��o Mensal") #FACP fun��o de auto correla��o parcial

# Modelo Autoregressivo

AR1 <- arima(Infla��o,order = c(1,0,0)) #modelo AR de ordem 1
AR1
AR2 <- arima(Infla��o, order=c(2,0,0)) #modelo AR de ordem 2
AR2

#Salvar CNVAZQUEZ
