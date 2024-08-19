# README

Projeto Desafio Maino

# Passos para Iniciar o projeto

## git clone git@github.com:reneerocha/maino.git

## cd maino/development/

## docker-compose build

## docker-compose run web rake db:setup

## docker-compose run web rake db:migrate

## docker-compose up

## Acessar no navegador o endereço 0.0.0.0/3000 e criar um usuário

Requisitos Funcionais implementado:

1 - Autenticação de Usuário: 
Implemente um sistema de login seguro, garantindo que apenas usuários autenticados possam acessar a aplicação.
### - Foi usada a Gem Devise, mas deixado aberto o cadastro de novos usuários para faciliar o teste das funcionalidades. Mas pode ser suprimida essa funcionalidade

2 - Upload de Documentos: 
Crie uma interface onde os usuários possam enviar arquivos no formato XML para serem processados.
### - Não foi colocado restrição de unicidade de número da Nota Fiscal para facilidade o teste das funcionalidades.
  
3 - Processamento em Background: 
Utilize Sidekiq para realizar o processamento dos arquivos XML em segundo plano.    

4 - Relatório: 
Após o processamento, a aplicação deve gerar um relatório detalhado em tela com as seguintes informações extraídas dos arquivos XML: 
•    Dados do Documento Fiscal: Número de Série (serie), Número da Nota Fiscal (nNF), Data e Hora de Emissão (dhEmi), Dados do Emitente (emit) e do Destinatário (dest).    
•    Produtos Listados: Nome (xProd), NCM (NCM), CFOP (CFOP), Unidade Comercializada (uCom), Quantidade Comercializada (qCom), Valor Unitário (vUnCom).    
•    Impostos Associados: Valor do ICMS (vICMS), Valor do IPI (vIPI), Valor do PIS (vPIS), Valor do COFINS (vCOFINS).    
•    Totalizadores: Resumo dos valores totais dos produtos e impostos.    

5- Filtros:   
Implemente filtros no relatório em tela para facilitar a busca e a visualização das informações processadas.
