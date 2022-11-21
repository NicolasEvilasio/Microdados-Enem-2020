
/**************************************************************************/
/*  INEP/Daeb-Diretoria de Avaliação da Educação Básica              	  */      
/*                                   									  */	
/*  Coordenação-Geral de Instrumentos e Medidas (CGIM)					  */
/*------------------------------------------------------------------------*/
/*  PROGRAMA:                                                             */
/*           INPUT_SAS_MICRODADOS_ENEM_2020.sas                        	  */
/*------------------------------------------------------------------------*/
/*  DESCRICAO: PROGRAMA PARA LEITURA DOS MICRODADOS DO ENEM DE 2020       */    
/*                                                                        */
/**************************************************************************/
/**************************************************************************/
/* Obs:                                                                   */
/* 		                                                                  */
/* Para abrir os microdados é necessário salvar este programa e o arquivo */
/* MICRODADOS_ENEM_2020.CSV no diretório C:\ do computador.			      */
/*															 			  */                                           
/* Ao terminar esses procedimentos execute o programa salvo utilizando    */
/* as variáveis de interesse.                                             */
/**************************************************************************/
/*				                  ATENÇÃO                                 */  
/**************************************************************************/
/* Este programa abre a base de dados com os rótulos das variáveis de	  */
/* acordo com o dicionário de dados que compõem os microdados. Para abrir */
/* os dados sem os rótulos basta importar diretamente no SAS.			  */
/* 																	      */ 																          
/**************************************************************************/

proc format;

	value $IN_TREINEIRO
		0='Não'
		1='Sim';

	value $TP_DEPENDENCIA_ADM
       1= 'Federal'
	   2= 'Estadual'
	   3= 'Municipal'
	   4= 'Privada';

	value $TP_LOCALIZACAO
       1= 'Urbana'
	   2= 'Rural';

	value $TP_SIT_FUNC_ESC
	   1='Em atividade'
	   2='Paralisada'
	   3='Extinta'
	   4='Escola extinta em anos anteriores';

	value  $TP_SEXO
		M ='Masculino'
		F ='Feminino';

	value $TP_NACIONAL
	   0= 'Não informado'
	   1= 'Brasileiro(a)'
	   2= 'Brasileiro(a) Naturalizado(a)'
	   3= 'Estrangeiro(a)'
	   4= 'Brasileiro(a) Nato(a), nascido(a) no exterior';

	value  $TP_ST_CONCLUSAO
		1='Já concluí o Ensino Médio'
		2='Estou cursando e concluirei o Ensino Médio em 2020'	
		3='Estou cursando e concluirei o Ensino Médio após 2020'
		4='Não concluí e não estou cursando o Ensino Médio';

	value $TP_ANO_CONCLUIU
		0=	'Não informado'
		1=  '2019'
		2=  '2018'
		3=	'2017'
		4=	'2016'
		5=	'2015'
		6=	'2014'
		7=	'2013'
		8=	'2012'
		9=	'2011'
		10=	'2010'
		11=	'2009'
		12=	'2008'
		13= '2007'
		14= 'Anterior a 2007';

	value  $TP_ESCOLA
		1='Não respondeu'
		2='Pública'
		3='Privada'
		4='Exterior';

	value  $TP_ENSINO
		1='Ensino Regular'
		2='Educação Especial - Modalidade Substitutiva'
		3='Educação de Jovens e Adultos';

	value  $TP_ESTADO_CIVIL
		0=	'Não informado'
		1='Solteiro(a)'
		2='Casado(a)/Mora com um(a) companheiro(a)'
		3='Divorciado(a)/Desquitado(a)/Separado(a)'
		4='Viúvo(a)';

	value  $TP_COR_RACA
		0='Não declarado'
		1='Branca'
		2='Preta'
		3='Parda'
		4='Amarela'
		5='Indígena';

	value  $TP_FAIXA_ETARIA
		1  = 'Menor de 17 anos'
		2  = '17 anos'
		3  = '18 anos'
		4  = '19 anos'
		5  = '20 anos'
		6  = '21 anos'
		7  = '22 anos'
		8  = '23 anos'
		9  = '24 anos'
		10 = '25 anos'
		11 = 'Entre 26 e 30 anos'
		12 = 'Entre 31 e 35 anos'
		13 = 'Entre 36 e 40 anos'
		14 = 'Entre 41 e 45 anos'
		15 = 'Entre 46 e 50 anos'
		16 = 'Entre 51 e 55 anos'
		17 = 'Entre 56 e 60 anos'
		18 = 'Entre 61 e 65 anos'
		19 = 'Entre 66 e 70 anos'
		20 = 'Maior de 70 anos';

	value  $TP_PRESENCA_CN
		0='Faltou à prova'
		1='Presente na prova'
		2='Eliminado na prova';

	value  $TP_PRESENCA_CH
		0='Faltou à prova'
		1='Presente na prova'
		2='Eliminado na prova';

	value  $TP_PRESENCA_LC
		0='Faltou à prova'
		1='Presente na prova'
		2='Eliminado na prova';

	value  $TP_PRESENCA_MT
		0='Faltou à prova'
		1='Presente na prova'
		2='Eliminado na prova';

	value  $CO_PROVA_CN
		597='Azul'
		598='Amarela'
		599='Cinza'
		600='Rosa'
		601='Rosa - Ampliada'
		602='Rosa - Superampliada'
		604='Laranja - Adaptada Ledor'
		605='Verde - Videoprova - Libras'
		677='Azul (Reaplicação)'
		678='Amarela (Reaplicação)'
		679='Cinza (Reaplicação)'
		680='Rosa (Reaplicação)'
		684='Laranja - Adaptada Ledor (Reaplicação)'
		699='Azul (Digital)'
		700='Amarela (Digital)'
		701='Rosa (Digital)'
		702='Cinza (Digital)';

	value  $CO_PROVA_CH
		567='Azul'
		568='Amarela'
		569='Branca'
		570='Rosa'
		571='Rosa - Ampliada'
		572='Rosa - Superampliada'
		574='Laranja - Adaptada Ledor'
		575='Verde - Videoprova - Libras'
		647='Azul (Reaplicação)'
		648='Amarela (Reaplicação)'
		649='Branca (Reaplicação)'
		650='Rosa (Reaplicação)'
		654='Laranja - Adaptada Ledor (Reaplicação)'
		687='Azul (Digital)'
		688='Amarela (Digital)'
		689='Branca (Digital)'
		690='Rosa (Digital)';

	value  $CO_PROVA_LC
		577='Azul'
		578='Amarela'
		579='Rosa'
		580='Branca'
		581='Rosa - Ampliada'
		582='Rosa - Superampliada'
		584='Laranja - Adaptada Ledor'
		585='Verde - Videoprova - Libras'
		657='Azul (Reaplicação)'
		658='Amarela (Reaplicação)'
		659='Rosa (Reaplicação)'
		660='Branca (Reaplicação)'
		664='Laranja - Adaptada Ledor (Reaplicação)'
		691='Azul (Digital)'
		692='Amarela (Digital)'
		693='Branca (Digital)'
		694='Rosa (Digital)';

	value  $CO_PROVA_MT
		587='Azul'
		588='Amarela'
		589='Rosa'
		590='Cinza'
		591='Rosa - Ampliada'
		592='Rosa - Superampliada'
		594='Laranja - Adaptada Ledor'
		595='Verde - Videoprova - Libras'
		667='Azul (Reaplicação)'
		668='Amarela (Reaplicação)'
		669='Rosa (Reaplicação)'
		670='Cinza (Reaplicação)'
		674='Laranja - Adaptada Ledor (Reaplicação)'
		695='Azul (Digital)'
		696='Amarela (Digital)'
		697='Rosa (Digital)'
		698='Cinza (Digital)';

	value  $TP_LINGUA
		0='Inglês'
		1='Espanhol';

	value  $TP_STATUS_REDACAO
		1='Sem problemas'
		2='Anulada'
		3='Cópia Texto Motivador'
        4='Em Branco'
		6='Fuga ao tema'
        7='Não atendimento ao tipo'
		8='Texto insuficiente'
        9='Parte desconectada';
				
	value $Qum
		A='Nunca estudou'
		B='Não completou a 4ª série/5º ano do ensino fundamental'
		C='Completou a 4ª série/5º ano, mas não completou a 8ª série/9º ano do ensino fundamental'
		D='Completou a 8ª série/9º ano do ensino fundamental, mas não completou o Ensino Médio'
		E='Completou o Ensino Médio, mas não completou a Faculdade'
		F='Completou a Faculdade, mas não completou a Pós-graduação'
		G='Completou a Pós-graduação'
		H='Não sei';

	value $Qdois
		A='Nunca estudou'
		B='Não completou a 4ª série/5º ano do ensino fundamental'
		C='Completou a 4ª série/5º ano, mas não completou a 8ª série/9º ano do ensino fundamental'
		D='Completou a 8ª série/9º ano do ensino fundamental, mas não completou o Ensino Médio'
		E='Completou o Ensino Médio, mas não completou a Faculdade'
		F='Completou a Faculdade, mas não completou a Pós-graduação'
		G='Completou a Pós-graduação'
		H='Não sei';

	value $Qtres
		A='Grupo 1: Lavrador, agricultor sem empregados, bóia fria, criador de animais (gado, porcos, galinhas, ovelhas, cavalos etc.), apicultor, pescador, lenhador, seringueiro, extrativista'
		B='Grupo 2: Diarista, empregado doméstico, cuidador de idosos, babá, cozinheiro (em casas particulares), motorista particular, jardineiro, faxineiro de empresas e prédios, vigilante, porteiro, carteiro, office-boy, vendedor, caixa, atendente de loja, auxiliar administrativo, recepcionista, servente de pedreiro, repositor de mercadoria'
		C='Grupo 3: Padeiro, cozinheiro industrial ou em restaurantes, sapateiro, costureiro, joalheiro, torneiro mecânico, operador de máquinas, soldador, operário de fábrica, trabalhador da mineração, pedreiro, pintor, eletricista, encanador, motorista, caminhoneiro, taxista'
		D='Grupo 4: Professor (de ensino fundamental ou médio, idioma, música, artes etc.), técnico (de enfermagem, contabilidade, eletrônica etc.), policial, militar de baixa patente (soldado, cabo, sargento), corretor de imóveis, supervisor e gerente, mestre de obras, pastor, microempresário (proprietário de empresa com menos de 10 empregados), pequeno comerciante, pequeno proprietário de terras, trabalhador autônomo ou por conta própria'
		E='Grupo 5: Médico, engenheiro, dentista, psicólogo, economista, advogado, juiz, promotor, defensor, delegado, tenente, capitão, coronel, professor universitário, diretor em empresas públicas e privadas, político, proprietário de empresas com mais de 10 empregados'
		F='Não Sei';
		
	value $Qquatro
		A='Grupo 1: Lavradora, agricultora sem empregados, bóia fria, criadora de animais (gado, porcos, galinhas, ovelhas, cavalos etc.), apicultora, pescadora, lenhadora, seringueira, extrativista'
		B='Grupo 2: Diarista, empregada doméstica, cuidadora de idosos, babá, cozinheira (em casas particulares), motorista particular, jardineira, faxineira de empresas e prédios, vigilante, porteira, carteira, office-boy, vendedora, caixa, atendente de loja, auxiliar administrativa, recepcionista, servente de pedreiro, repositora de mercadoria'
		C='Grupo 3: Padeira, cozinheira industrial ou em restaurantes, sapateira, costureira, joalheira, torneira mecânica, operadora de máquinas, soldadora, operária de fábrica, trabalhadora da mineração, pedreira, pintora, eletricista, encanadora, motorista, caminhoneira, taxista'
		D='Grupo 4: Professora (de ensino fundamental ou médio, idioma, música, artes etc.), técnica (de enfermagem, contabilidade, eletrônica etc.), policial, militar de baixa patente (soldado, cabo, sargento), corretora de imóveis, supervisora e gerente, mestre de obras, pastora, microempresária (proprietária de empresa com menos de 10 empregados), pequena comerciante, pequena proprietária de terras, trabalhadora autônoma ou por conta própria'
		E='Grupo 5: Médica, engenheira, dentista, psicóloga, economista, advogada, juíza, promotora, defensora, delegada, tenente, capitã, coronel, professora universitária, diretora em empresas públicas e privadas, política, proprietária de empresas com mais de 10 empregados'
		F='Não Sei';

	value $Qcinco
		1='1'
		2='2'
		3='3'
		4='4'
		5='5'
		6='6'
		7='7'
		8='8'
		9='9'
		10='10'
		11='11'
		12='12'
		13='13'
		14='14'
		15='15'
		16='16'
		17='17'
		18='18'
		19='19'
		20='20';

	value $Qseis
		A= 'Nenhuma renda'
		B= 'Até R$ 1.045,00'
		C= 'De R$ 1.045,01 até R$ 1.567,50'
		D= 'De R$ 1.567,51 até R$ 2.090,00'
		E= 'De R$ 2.090,01 até R$ 2.612,50'
		F= 'De R$ 2.612,51 até R$ 3.135,00'
		G= 'De R$ 3.135,01 até R$ 4.180,00'
		H= 'De R$ 4.180,01 até R$ 5.225,00'
		I= 'De R$ 5.225,01 até R$ 6.270,00'
		J= 'De R$ 6.270,01 até R$ 7.315,00'
		K= 'De R$ 7.315,01 até R$ 8.360,00'
		L= 'De R$ 8.360,01 até R$ 9.405,00'
		M= 'De R$ 9.405,01 até R$ 10.450,00'
		N= 'De R$ 10.450,01 até R$ 12.540,00'
		O= 'De R$ 12.540,01 até R$ 15.675,00'
		P= 'De R$ 15.675,01 até R$ 20.900,00'
		Q= 'Acima de R$ 20.900,00';

	value $Qsete
		A='Não'
		B='Sim, um ou dois dias por semana'
		C='Sim, três ou quatro dias por semana'
		D='Sim, pelo menos cinco dias por semana';

	value $Qoito
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qnove
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qdez
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qonze
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qdoze
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qtreze
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qcatorze
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qquinze
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qdezesseis
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qdezessete
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qdezoito
		A='Não'
		B='Sim';

	value $Qdezenove
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qvinte
		A='Não'
		B='Sim';

	value $Qvinteum
		A='Não'
		B='Sim';

	value $Qvintedois
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qvintetres
		A='Não'
		B='Sim';

	value $Qvintequatro
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qvintecinco
		A='Não'
		B='Sim';	
run;


DATA WORK.DADOS_ENEM_2020;
INFILE 'C:\MICRODADOS_ENEM_2020.csv' /*local do arquivo*/
        LRECL=963
        FIRSTOBS=2
        DLM=';'
        MISSOVER
        DSD ;
INPUT
        NU_INSCRICAO       : BEST21.
        NU_ANO           : BEST4.
		TP_FAIXA_ETARIA  : $CHAR1.
        TP_SEXO          : $CHAR1.
        TP_ESTADO_CIVIL  :  $CHAR1.
        TP_COR_RACA      :  $CHAR1.
        TP_NACIONALIDADE    : $CHAR2.
        TP_ST_CONCLUSAO     :  $CHAR1.
        TP_ANO_CONCLUIU     :  $CHAR2.
        TP_ESCOLA        :  $CHAR1.
        TP_ENSINO     :  $CHAR1.
		IN_TREINEIRO	:$CHAR1.
        CO_MUNICIPIO_ESC : BEST7.
        NO_MUNICIPIO_ESC : $CHAR32.
        CO_UF_ESC       : BEST2.
        SG_UF_ESC           : $CHAR2.
        TP_DEPENDENCIA_ADM_ESC : $CHAR1.
        TP_LOCALIZACAO_ESC : $CHAR1.
        TP_SIT_FUNC_ESC     : $CHAR1.
        CO_MUNICIPIO_PROVA : BEST7.
        NO_MUNICIPIO_PROVA : $CHAR27.
        CO_UF_PROVA     : BEST2.
        SG_UF_PROVA         : $CHAR2.
        TP_PRESENCA_CN   : $CHAR1.
        TP_PRESENCA_CH   : $CHAR1.
        TP_PRESENCA_LC   : $CHAR1.
        TP_PRESENCA_MT   : $CHAR1.
        CO_PROVA_CN      : $CHAR3.
        CO_PROVA_CH      : $CHAR3.
        CO_PROVA_LC      : $CHAR3.
        CO_PROVA_MT      : $CHAR3.
        NU_NOTA_CN          : BEST8.
        NU_NOTA_CH          : BEST8.
        NU_NOTA_LC          : BEST8.
        NU_NOTA_MT          : BEST8.
        TX_RESPOSTAS_CN  : $CHAR45.
        TX_RESPOSTAS_CH  : $CHAR45.
        TX_RESPOSTAS_LC  : $CHAR50.
        TX_RESPOSTAS_MT  : $CHAR45.
        TP_LINGUA        : $CHAR1.
        TX_GABARITO_CN      : $CHAR45.
        TX_GABARITO_CH      : $CHAR45.
        TX_GABARITO_LC      : $CHAR50.
        TX_GABARITO_MT      : $CHAR45.
        TP_STATUS_REDACAO :$CHAR2.
        NU_NOTA_COMP1    : BEST3.
        NU_NOTA_COMP2    : BEST3.
        NU_NOTA_COMP3    : BEST3.
        NU_NOTA_COMP4    : BEST3.
        NU_NOTA_COMP5    : BEST3.
        NU_NOTA_REDACAO  : BEST4.
        Q001             : $CHAR1.
        Q002             : $CHAR1.
        Q003             : $CHAR1.
        Q004             : $CHAR1.
        Q005             : $CHAR2.
        Q006             : $CHAR1.
        Q007             : $CHAR1.
        Q008             : $CHAR1.
        Q009             : $CHAR1.
        Q010             : $CHAR1.
        Q011             : $CHAR1.
        Q012             : $CHAR1.
        Q013             : $CHAR1.
        Q014             : $CHAR1.
        Q015             : $CHAR1.
        Q016             : $CHAR1.
        Q017             : $CHAR1.
        Q018             : $CHAR1.
        Q019             : $CHAR1.
        Q020             : $CHAR1.
        Q021             : $CHAR1.
        Q022             : $CHAR1.
        Q023             : $CHAR1.
        Q024             : $CHAR1.
        Q025             : $CHAR1.;

ATTRIB IN_TREINEIRO					FORMAT=$IN_TREINEIRO3.;
ATTRIB TP_DEPENDENCIA_ADM_ESC 		FORMAT=$TP_DEPENDENCIA_ADM10.;
ATTRIB TP_LOCALIZACAO_ESC 			FORMAT=$TP_LOCALIZACAO10.;
ATTRIB TP_SIT_FUNC_ESC 				FORMAT=$TP_SIT_FUNC_ESC40.;
ATTRIB TP_SEXO 						FORMAT=$TP_SEXO10.;
ATTRIB TP_NACIONALIDADE 			FORMAT=$TP_NACIONAL.;
ATTRIB TP_ST_CONCLUSAO 				FORMAT=$TP_ST_CONCLUSAO52.;
ATTRIB TP_ANO_CONCLUIU				FORMAT=$TP_ANO_CONCLUIU15.;
ATTRIB TP_ESCOLA					FORMAT=$TP_ESCOLA13.;
ATTRIB TP_ENSINO 					FORMAT=$TP_ENSINO40.;
ATTRIB TP_ESTADO_CIVIL 				FORMAT=$TP_ESTADO_CIVIL40.;
ATTRIB TP_COR_RACA 					FORMAT=$TP_COR_RACA30.;
ATTRIB TP_PRESENCA_CN 				FORMAT=$TP_PRESENCA_CN20.;
ATTRIB TP_PRESENCA_CH 				FORMAT=$TP_PRESENCA_CH20.;
ATTRIB TP_PRESENCA_LC 				FORMAT=$TP_PRESENCA_LC20.;
ATTRIB TP_PRESENCA_MT 				FORMAT=$TP_PRESENCA_MT20.;
ATTRIB CO_PROVA_CN 					FORMAT=$CO_PROVA_CN40.;
ATTRIB CO_PROVA_CH 					FORMAT=$CO_PROVA_CH40.;
ATTRIB CO_PROVA_LC 					FORMAT=$CO_PROVA_LC40.;
ATTRIB CO_PROVA_MT 					FORMAT=$CO_PROVA_MT40.;
ATTRIB TP_LINGUA 					FORMAT=$TP_LINGUA10.;
ATTRIB TP_STATUS_REDACAO 			FORMAT=$TP_STATUS_REDACAO35.;
ATTRIB TP_FAIXA_ETARIA				FORMAT=$TP_FAIXA_ETARIA35.;
ATTRIB NU_INSCRICAO FORMAT = 21.;
ATTRIB NU_NOTA_CN   FORMAT = 8.2;
ATTRIB NU_NOTA_CH   FORMAT = 8.2;
ATTRIB NU_NOTA_LC   FORMAT = 8.2;
ATTRIB NU_NOTA_MT   FORMAT = 8.2;
ATTRIB NU_NOTA_COMP1    FORMAT = 8.2;
ATTRIB NU_NOTA_COMP2    FORMAT = 8.2;
ATTRIB NU_NOTA_COMP3    FORMAT = 8.2;
ATTRIB NU_NOTA_COMP4    FORMAT = 8.2;
ATTRIB NU_NOTA_COMP5    FORMAT = 8.2;
ATTRIB NU_NOTA_REDACAO  FORMAT = 8.2;
ATTRIB Q001  FORMAT=$Qum.;
ATTRIB Q002  FORMAT=$Qdois.;
ATTRIB Q003  FORMAT=$Qtres.;
ATTRIB Q004  FORMAT=$Qquatro.;
ATTRIB Q005  FORMAT=$Qcinco.;
ATTRIB Q006  FORMAT=$Qseis.;
ATTRIB Q007  FORMAT=$Qsete.;
ATTRIB Q008  FORMAT=$Qoito.;
ATTRIB Q009  FORMAT=$Qnove.;
ATTRIB Q010 FORMAT=$Qdez.;
ATTRIB Q011 FORMAT=$Qonze.;
ATTRIB Q012 FORMAT=$Qdoze.;
ATTRIB Q013 FORMAT=$Qtreze.;
ATTRIB Q014 FORMAT=$Qcatorze.;
ATTRIB Q015 FORMAT=$Qquinze.;
ATTRIB Q016 FORMAT=$Qdezesseis.;
ATTRIB Q017 FORMAT=$Qdezessete.;
ATTRIB Q018 FORMAT=$Qdezoito.;
ATTRIB Q019 FORMAT=$Qdezenove.;
ATTRIB Q020 FORMAT=$Qvinte.;
ATTRIB Q021 FORMAT=$Qvinteum.;
ATTRIB Q022 FORMAT=$Qvintedois.;
ATTRIB Q023 FORMAT=$Qvintetres.;
ATTRIB Q024 FORMAT=$Qvintequatro.;
ATTRIB Q025 FORMAT=$Qvintecinco.;

LABEL

NU_INSCRICAO    =   'Número de inscrição'
NU_ANO    =   'Ano do Enem'
IN_TREINEIRO = 'Indica se o inscrito fez a prova com intuito de apenas treinar seus conhecimentos'
CO_MUNICIPIO_ESC   =   'Código do município da escola' 
NO_MUNICIPIO_ESC   =   'Nome do município da escola'
CO_UF_ESC   =   'Código da Unidade da Federação da escola'
SG_UF_ESC   =   'Sigla da Unidade da Federação da escola'
TP_DEPENDENCIA_ADM_ESC   =   'Dependência administrativa (Escola)'
TP_LOCALIZACAO_ESC   =   'Localização (Escola)'
TP_SIT_FUNC_ESC   =   'Situação de funcionamento (Escola)'
TP_FAIXA_ETARIA    =   'Faixa Etária'
TP_SEXO    =   'Sexo'
TP_NACIONALIDADE   =   'Nacionalidade'
TP_ST_CONCLUSAO    =   'Situação de conclusão do Ensino Médio'
TP_ANO_CONCLUIU    =   'Ano de Conclusão do Ensino Médio'
TP_ESCOLA    =   'Tipo de escola do Ensino Médio'
TP_ENSINO    =   'Tipo de instituição que concluiu ou concluirá o Ensino Médio'
TP_ESTADO_CIVIL    =   'Estado Civil' 
TP_COR_RACA    =   'Cor/raça'
CO_MUNICIPIO_PROVA    =   'Código do município da aplicação da prova'
NO_MUNICIPIO_PROVA   =   'Nome do município da aplicação da prova'
CO_UF_PROVA    =   'Código da Unidade da Federação da aplicação da prova'
SG_UF_PROVA    =   'Sigla da Unidade da Federação da aplicação da prova'
TP_PRESENCA_CN    =   'Presença na prova objetiva de Ciências da Natureza'
TP_PRESENCA_CH    =   'Presença na prova objetiva de Ciências Humanas'
TP_PRESENCA_LC    =   'Presença na prova objetiva de Linguagens e Códigos'
TP_PRESENCA_MT    =   'Presença na prova objetiva de Matemática'
NU_NOTA_CN   =   'Nota da prova de Ciências da Natureza'
NU_NOTA_CH   =   'Nota da prova de Ciências Humanas'
NU_NOTA_LC   =   'Nota da prova de Linguagens e Códigos'
NU_NOTA_MT   =   'Nota da prova de Matemática'
TX_RESPOSTAS_CN    =   'Vetor com as respostas da parte objetiva da prova de Ciências da Natureza'
TX_RESPOSTAS_CH    =   'Vetor com as respostas da parte objetiva da prova de Ciências Humanas' 
TX_RESPOSTAS_LC    =   'Vetor com as respostas da parte objetiva da prova de Linguagens e Códigos' 
TX_RESPOSTAS_MT    =   'Vetor com as respostas da parte objetiva da prova de Matemática' 
CO_PROVA_CN    =   'Código do tipo de prova de Ciências da Natureza'
CO_PROVA_CH    =   'Código do tipo de prova de Ciências Humanas'
CO_PROVA_LC    =   'Código do tipo de prova de Linguagens e Códigos'
CO_PROVA_MT    =   'Código do tipo de prova de Matemática'
TP_LINGUA   =   'Tipo de Língua Estrangeira'
TX_GABARITO_CN   =   'Vetor com o gabarito da parte objetiva da prova de Ciências da Natureza'
TX_GABARITO_CH   =   'Vetor com o gabarito da parte objetiva da prova de Ciências Humanas'
TX_GABARITO_LC   =   'Vetor com o gabarito da parte objetiva da prova de Linguagens e Códigos'
TX_GABARITO_MT   =   'Vetor com o gabarito da parte objetiva da prova de Matemática'
TP_STATUS_REDACAO  =   'Situação da redação do participante'
NU_NOTA_COMP1   =   'Nota da competência 1'
NU_NOTA_COMP2   =   'Nota da competência 2'
NU_NOTA_COMP3   =   'Nota da competência 3'
NU_NOTA_COMP4   =   'Nota da competência 4'
NU_NOTA_COMP5   =   'Nota da competência 5'
NU_NOTA_REDACAO   =   'Nota da prova de redação'
Q001    =   'Até que série seu pai, ou o homem responsável por você, estudou?'
Q002    =   'Até que série sua mãe, ou a mulher responsável por você, estudou?'
Q003    =   'Indique o grupo que contempla a ocupação mais próxima da ocupação do seu pai ou do homem responsável por você'
Q004    =   'Indique o grupo que contempla a ocupação mais próxima da ocupação da sua mãe ou da mulher responsável por você'
Q005    =   'Incluindo você, quantas pessoas moram atualmente em sua residência?'
Q006    =   'Qual é a renda mensal de sua família? (Some a sua renda com a dos seus familiares.)'
Q007    =   'Em sua residência trabalha empregado(a) doméstico(a)?'
Q008    =   'Na sua residência tem banheiro?'
Q009    =   'Na sua residência tem quartos para dormir?'
Q010   =    'Na sua residência tem carro?'
Q011   =    'Na sua residência tem motocicleta?'
Q012   =    'Na sua residência tem geladeira?'
Q013   =    'Na sua residência tem freezer (independente ou segunda porta da geladeira)?'
Q014   =    'Na sua residência tem máquina de lavar roupa (o tanquinho NÃO deve ser considerado)?'
Q015   =    'Na sua residência tem máquina de secar roupa (independente ou em conjunto com a máquina de lavar roupa)?'
Q016   =    'Na sua residência tem forno micro-ondas?'
Q017   =    'Na sua residência tem máquina de lavar louça?'
Q018   =    'Na sua residência tem aspirador de pó?'
Q019   =    'Na sua residência tem televisão em cores?'
Q020   =    'Na sua residência tem aparelho de DVD?'
Q021   =    'Na sua residência tem TV por assinatura?'
Q022   =    'Na sua residência tem telefone celular?'
Q023   =    'Na sua residência tem telefone fixo?'
Q024   =    'Na sua residência tem computador?'
Q025   =    'Na sua residência tem acesso à Internet?';

IF NU_INSCRICAO = . THEN DELETE;

RUN;