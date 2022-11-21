#--------------------------------------------------------
#  INEP/Daeb-Diretoria de Avalia��o da Educa��o B�sica 
#  Coordena��o-Geral de Instrumentos e Medidas (CGIM)			
#--------------------------------------------------------

#--------------------------------------------------------
#  PROGRAMA:                                                                                                      
#           INPUT_R_MICRODADOS_ENEM_2020
#--------------------------------------------------------
#  DESCRI���O:
#           PROGRAMA PARA LEITURA DOS ITENS
#           ITENS_PROVA_2020
#--------------------------------------------------------

#------------------------------------------------------------------------
# Obs:                                                                                                                    
#     Para abrir os microdados � necess�rio salvar o arquivo                    
#     ITENS_PROVA_ENEM_2020.csv no diret�rio raiz. 
#     Ex. Windows C:\
#         Linux \home	                  
#------------------------------------------------------------------------

#------------------------------------------------------------------------
#                   ATEN��O             
#------------------------------------------------------------------------
# Este programa abre a base de dados com os r�tulos das vari�veis de	                    
# acordo com o dicion�rio de dados que comp�em os microdados. 		  
#------------------------------------------------------------------------

#--------------------
# Intala��o do pacote Data.Table
# Se n�o estiver instalado
#--------------------
if(!require(data.table)){install.packages('data.table')}

#--------------------
# Caso deseje trocar o local do arquivo, 
# edit a fun��o setwd() a seguir informando o local do arquivo.
#Ex. Windows setwd("C:/temp")
#    Linux   setwd("/home")
#--------------------
setwd("C:/")  

#---------------
# Aloca��o de mem�ria
#---------------
memory.limit(24576)

#------------------
# Carga dos microdados

itens_2020 <- data.table::fread(input='itens_prova_2020.csv',integer64='character')

# A script a seguir formata os r�tulos das vari�veis
# Para formatar um item retire o caracter de coment�rio (#) no in�cio na linha desejada 
#---------------------------

#itens_2020$SG_AREA <- factor(itens_2020$SG_AREA, levels = c('CH','CN','LC','MT'),  labels=c('Ci�ncias Humanas','Ci�ncias da Natureza','Linguagens e C�digos','Matem�tica'))
#itens_2020$TP_LINGUA <- factor(itens_2020$TP_LINGUA, levels = c(0,1),  labels=c('Ingl�s','Espanhol'))
#itens_2020$IN_ITEM_ADAPTADO <- factor(itens_2020$IN_ITEM_ADAPTADO, levels = c(1,0),  labels=c('Sim','N�o'))
#itens_2020$TP_VERSAO_DIGITAL <- factor(itens_2020$TP_VERSAO_DIGITAL, levels = c(0,1),  labels=c('Ingl�s','Espanhol'))
#itens_2020$IN_ITEM_ABAN <- factor(itens_2020$IN_ITEM_ABAN, levels = c(1,0),  labels=c('Sim','N�o'))
