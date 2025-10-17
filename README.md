🏦 Projeto de Análise de Dados - Bank Marketing Dataset
📌 Descrição do Projeto

Este projeto realiza uma análise de dados de campanhas de marketing bancário, utilizando o Bank Marketing Dataset.

O objetivo é explorar padrões de comportamento dos clientes, identificar perfis com maior conversão e extrair insights estratégicos para otimizar campanhas de depósito.

Foram utilizadas consultas SQL para análise de dados e Python/Power BI para manipulação e visualização.

📊 Diagrama do Banco de Dados

O modelo relacional do banco de dados está disponível neste arquivo:

![Modelo Relacional](C:\Users\ruani\OneDrive\Documentos\Projeto - Bank Marketing Dataset\BD - Diagrama.png)

Este diagrama mostra como as tabelas se conectam através das chaves primárias, permitindo entender a estrutura do dataset para análise.

🛠️ Ferramentas Utilizadas

SQL (PostgreSQL) – consultas e extração de métricas do banco

Python – manipulação e limpeza de dados

Power BI – visualização de dados e dashboards interativos

❓ Perguntas de Negócio
1️⃣ Perfil de Clientes

Quais profissões apresentam maior taxa de aceitação de depósito?

Qual faixa etária mais aceita a oferta?

Clientes com empréstimo imobiliário (housing) ou pessoal (loan) têm maior ou menor probabilidade de aceitar?

2️⃣ Eficácia da Campanha

Qual canal de contato (cellular ou telephone) apresenta maior taxa de sucesso?

Existe diferença de sucesso entre os meses do ano (month)?

Qual é a duração média da ligação que resulta em depósito?

3️⃣ Segmentação e Risco

Clientes com default = yes aceitam mais ou menos a oferta?

Qual nível de escolaridade está mais associado a aceitar depósitos?

Existe algum perfil de cliente pouco explorado (muitos contatos, pouca conversão)?

4️⃣ Métricas de Conversão e ROI

Qual é a taxa de conversão geral do dataset?

Taxa de conversão por número de contatos (campaign) — clientes que recebem mais ligações convertem melhor?

Clientes com histórico de campanhas anteriores (poutcome) têm maior chance de aceitar em campanhas atuais?

5️⃣ Insights Estratégicos

Qual combinação de idade + saldo + canal gera maior chance de conversão?

Ranking dos 10 clientes com maior potencial de conversão (saldo + histórico de aceitação).

Existe um padrão de clientes que nunca aceitam — idade, saldo ou tipo de empréstimo que indica baixo retorno?

🗂️ Estrutura do Projeto

SQL Queries: scripts utilizados para responder às perguntas de negócio

Python Scripts: limpeza e manipulação de dados

Dashboards Power BI: visualizações interativas e insights
