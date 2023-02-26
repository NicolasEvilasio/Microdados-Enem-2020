### Link para o relatório:
[Clique aqui](https://app.powerbi.com/view?r=eyJrIjoiOTkyZWZlYTgtMjhiYy00Y2E1LWIxMGUtOWE1MDQzMWRjM2M4IiwidCI6IjkxYjM1YmQyLTRlNzktNGMwOS1hMmJjLThhZmZjNDVjNTgzYyJ9)

### Base de dados:
[Microdados Enem 2020](https://download.inep.gov.br/microdados/microdados_enem_2020.zip)


Critérios avaliadas:
- Uso de Funções DAX
- Uso da linguagem R
- Documentação das medidas
- ETL
- Modelagem dimensional dos dados
- Gateway de dados PBI


### Steps:

1. Exploração dos dados e modelagem realizado no Rstudio;
Confira o script [aqui](https://github.com/NicolasEvilasio/Microdados-Enem-2020/blob/main/DADOS/INPUT_R_MICRODADOS_ENEM_2020.R)
2. Importação da base de dados para o Power BI
    - Criação de parâmetro, limitando a quantidade de linhas para trabalhar com uma base de amostragem no PBI desktop e carregar os dados completos no PBI online;
    - Tipagem dos dados no Power Query;
    - Substituição dos valores com erro e NA por null;


### Levantar Indicadores
#### Responder às seguintes perguntas:
##### 1. Qual a escola com a maior média de notas?
    R: As escolas privadas apresenteram uma maior média: 598 pontos
    
##### 2. Qual o aluno com a maior média de notas e o valor dessa média?
    R: Em adequação à LGPD, o INEP não divulga o nome dos participantes da prova.
    Inscrição: 200005996961, média: 858,58
    Idade: 18 anos
    Lingua Estrangeira: Inglês
    Sexo: Masculino
    Redação: 980
    
#####  3. Qual a média geral?
    R: A média geral, obtida através da soma de todas as notas / 5 (quantidade de disciplinas) foi de 510,74
    
##### 4. Qual o % de Ausentes?
    R: 3,02 Milhões não realizaram a prova (52,15%)
    ***A quantidade de ausentes corresponde àqueles que faltaram aos dois dias de prova.
    
##### 5. Qual o número total de Inscritos?
    R: 5,78 milhões de inscritos
    
##### 6. Qual a média por disciplina?
    R: Ciências da Natureza: 490,41
       Ciências Humanas: 511,15
       Linguagens e Códigos: 523,80
       Matemática: 520,58
       Redação: 573,41
       
##### 7. Qual a média por Sexo?
    R: Feminino: 506,14
       Masculino: 517,76
       
##### 8. Qual a média por Etnia?
    R: Amarela: 508,84
       Branca: 541,26
       Indígena: 456,12
       Não Declarado: 516,30
       Parda: 492,88
       Preta: 484,26
       
