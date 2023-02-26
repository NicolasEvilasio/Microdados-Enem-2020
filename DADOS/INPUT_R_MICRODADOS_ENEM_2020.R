library(tidyverse)
library(dplyr)
if(!require(data.table)){install.packages('data.table')}

# pasta onde a base de tados está localizada
setwd("C:/Users/nicol/Downloads/microdados_enem_2020/DADOS")  

# alocaão de memória
memory.limit(24576)

# importando os dados
ENEM_2020 <- data.table::fread(input='microdados_ENEM_2020.csv',
                               integer64='character',
                               skip=0,  #Ler do inicio
                               nrow=-1, #Ler todos os registros
                               na.strings = "", 
                               showProgress = TRUE)

# visualizando as variávels imporadas
names(ENEM_2020)

# amostragem dos dados
View(head(ENEM_2020))

# Criando um novo dataframe, selecionando as variávels de interesse
df <- ENEM_2020 %>%
  select(NU_INSCRICAO, TP_FAIXA_ETARIA, TP_SEXO, TP_COR_RACA, TP_DEPENDENCIA_ADM_ESC, TP_PRESENCA_CN,
         TP_PRESENCA_CH, TP_PRESENCA_LC, TP_PRESENCA_MT, NU_NOTA_CN, NU_NOTA_CH, NU_NOTA_LC, NU_NOTA_MT,
         TP_LINGUA, TP_STATUS_REDACAO, NU_NOTA_REDACAO, CO_MUNICIPIO_ESC, NO_MUNICIPIO_ESC)



# ===========================================================================#
# As funções abaixo realizam a substituição dos registros em cada variável especificada, de acordo com o Dicionário de dados fornecido pelo INEP
# ===========================================================================#

df$TP_FAIXA_ETARIA <- factor(df$TP_FAIXA_ETARIA, 
                                    levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20), 
                                    labels = c('Menor de 17 anos','17 anos','18 anos','19 anos','20 anos','21 anos','22 anos',
                                               '23 anos','24 anos','25 anos','Entre 26 e 30 anos','Entre 31 e 35 anos','Entre 36 e 40 anos',
                                               'Entre 41 e 45 anos','Entre 46 e 50 anos','Entre 51 e 55 anos','Entre 56 e 60 anos','Entre 61 e 65 anos',
                                               'Entre 66 e 70 anos','Maior de 70 anos'))


df$TP_DEPENDENCIA_ADM_ESC <- factor(df$TP_DEPENDENCIA_ADM_ESC, levels = c(1,2,3,4),
                                           labels=c('Federal',
                                                    'Estadual',
                                                    'Municipal',
                                                    'Privada'))

df$TP_SEXO <- factor(df$TP_SEXO, levels = c('M','F'), labels=c('Maculino','Feminino'))

df$TP_COR_RACA <- factor(df$TP_COR_RACA, levels = c(0,1,2,3,4,5,6),
                                labels=c('Não declarado',
                                         'Branca','Preta',
                                         'Parda','Amarela',
                                         'Indígena',
                                         'Não dispõe da informação'))

df$TP_PRESENCA_CN <- factor(df$TP_PRESENCA_CN, levels = c(0,1,2),
                                    labels=c('Faltou à prova',
                                            'Presente na prova',
                                            'Eliminado na prova'))

df$TP_PRESENCA_CH <- factor(df$TP_PRESENCA_CH, levels = c(0,1,2),
                                   labels=c('Faltou à prova',
                                            'Presente na prova',
                                            'Eliminado na prova'))

df$TP_PRESENCA_LC <- factor(df$TP_PRESENCA_LC, levels = c(0,1,2),
                                   labels=c('Faltou à prova',
                                            'Presente na prova',
                                            'Eliminado na prova'))

df$TP_PRESENCA_MT <- factor(df$TP_PRESENCA_MT, levels = c(0,1,2),
                                   labels=c('Faltou à prova',
                                            'Presente na prova',
                                            'Eliminado na prova'))

df$ TP_LINGUA <- factor(df$ TP_LINGUA, levels = c(0,1),
                                labels=c('Inglês','Espanhol'))

df$TP_STATUS_REDACAO <- factor(df$TP_STATUS_REDACAO, levels = c(1,2,3,4,5,6,7,8,9),
                                      labels=c('Sem problemas',
                                               'Anulada','Cópia Texto Motivador',
                                               'Em Branco','Fere Direitos Humanos',
                                               'Fuga ao tema',
                                               'Não atendimento ao tipo',
                                               'Texto insuficiente',
                                               'Parte desconectada'))

# Resumo do novo df e das variáveis com as notas por disciplina
summary(df)
summary(df_nova$NU_NOTA_CN)
summary(df_nova$NU_NOTA_CH)
summary(df_nova$NU_NOTA_LC)
summary(df_nova$NU_NOTA_MT)
summary(df_nova$NU_NOTA_REDACAO)


# Criando um novo arquivo, com as colunas selecionadas anteriormente e com os rótulos tratados
write.csv(df, file="MICRODADOS_ENEM2020 - Tratado.csv")




