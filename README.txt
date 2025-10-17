# Projeto de Análise de Dados - Bank Marketing Dataset

## Descrição do Projeto
Este projeto consiste em uma análise de dados de campanhas de marketing bancário, utilizando o dataset do **Bank Marketing Dataset**.  
O objetivo é explorar padrões de comportamento de clientes, identificar perfis de maior conversão e extrair insights estratégicos para otimizar campanhas de depósito.

Foram utilizadas consultas **SQL** para responder perguntas de negócio, enquanto Python e Power BI foram utilizados para manipulação de dados e visualização.

---

## Diagrama do Banco de Dados
O modelo relacional do banco de dados está disponível neste arquivo:  

![Modelo Relacional](C:\Users\ruani\OneDrive\Documentos\Projeto - Bank Marketing Dataset\BD - Diagrama.png)  

O diagrama mostra como as tabelas se conectam pelas chaves primárias e permite entender a estrutura do dataset para análise.

---

## Ferramentas Utilizadas

- **SQL (PostgreSQL)**: consultas e extração de métricas do banco.  

---

## Perguntas de Negócio

### 1️⃣ Perfil de Clientes
1. **Profissões** com maior taxa de aceitação de depósito.  
2. **Faixa etária** que mais aceita a oferta de depósito.  
3. Clientes com **empréstimo imobiliário (`housing`) ou pessoal (`loan`)** têm maior ou menor probabilidade de aceitar?

---

### 2️⃣ Eficácia da Campanha
1. Qual **canal de contato** (`cellular` ou `telephone`) apresenta maior taxa de sucesso?  
2. Existe diferença de sucesso entre **meses** do ano (`month`)?  
3. Qual é a **duração média da ligação** que resulta em depósito?

---

### 3️⃣ Segmentação e Risco
1. Clientes com **default = yes** aceitam mais ou menos a oferta?  
2. Qual **nível de escolaridade** está mais associado a aceitar depósitos?  
3. Existe algum **perfil de cliente pouco explorado** (muitos contatos, pouca conversão)?

---

### 4️⃣ Métricas de Conversão e ROI
1. Qual é a **taxa de conversão geral** do dataset?  
2. Taxa de conversão por **número de contatos (`campaign`)** — clientes que recebem mais ligações convertem melhor?  
3. Clientes com histórico de campanhas anteriores (`poutcome`) têm maior chance de aceitar em campanhas atuais?

---

### 5️⃣ Insights Estratégicos
1. Qual **combinação de idade + saldo + canal** gera maior chance de conversão?  
2. Ranking dos **10 clientes com maior potencial de conversão** (saldo + histórico de aceitação).  
3. Existe **um padrão de clientes que nunca aceitam** — idade, saldo ou tipo de empréstimo que indica baixo retorno?

---

## Estrutura do Projeto

- **SQL Queries**: scripts utilizados para responder às perguntas de negócio.  

---