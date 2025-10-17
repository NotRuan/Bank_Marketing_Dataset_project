# 🏦 Análise de Dados - Bank Marketing Dataset

## 📋 Sobre o Projeto

Este projeto apresenta uma análise completa de campanhas de marketing bancário, utilizando o **Bank Marketing Dataset**. O foco está em compreender o comportamento dos clientes, identificar perfis com maior propensão à conversão e extrair insights estratégicos para otimizar futuras campanhas de depósito a prazo.

### 🎯 Objetivos

- Explorar padrões de comportamento de clientes em campanhas de marketing
- Identificar segmentos de alto potencial de conversão
- Analisar a eficácia dos canais de comunicação
- Fornecer recomendações baseadas em dados para otimização de campanhas

---

## 🗂️ Estrutura do Banco de Dados

O modelo relacional foi desenvolvido para organizar os dados de forma eficiente, permitindo análises complexas através de relacionamentos entre as tabelas.

**Diagrama Entidade-Relacionamento:**

![Modelo Relacional](C:\Users\ruani\OneDrive\Documentos\Projeto - Bank Marketing Dataset\BD - Diagrama.png)

> 💡 O diagrama ilustra as conexões entre as tabelas através de chaves primárias e estrangeiras, facilitando o entendimento da estrutura de dados.

---

## 🛠️ Tecnologias Utilizadas

| Ferramenta | Finalidade |
|------------|-----------|
| **PostgreSQL** | Consultas SQL e extração de métricas |
| **Python** | Manipulação e transformação de dados |
| **Power BI** | Visualização e dashboards interativos |

---

## 🔍 Perguntas de Negócio

### 1️⃣ **Perfil de Clientes**

- [ ] Quais **profissões** apresentam maior taxa de aceitação de depósito?
- [ ] Qual **faixa etária** demonstra maior propensão a aceitar ofertas?
- [ ] Clientes com **empréstimo imobiliário** (`housing`) ou **pessoal** (`loan`) têm maior probabilidade de conversão?

---

### 2️⃣ **Eficácia da Campanha**

- [ ] Qual **canal de contato** (`cellular` vs `telephone`) apresenta melhor performance?
- [ ] Existe variação na taxa de sucesso entre **meses do ano**?
- [ ] Qual é a **duração média das ligações** que resultam em conversão?

---

### 3️⃣ **Segmentação e Risco**

- [ ] Clientes com histórico de inadimplência (**default = yes**) convertem mais ou menos?
- [ ] Qual **nível de escolaridade** está mais associado à aceitação de depósitos?
- [ ] Existem **perfis de baixa conversão** apesar de muitos contatos (oportunidades desperdiçadas)?

---

### 4️⃣ **Métricas de Conversão e ROI**

- [ ] Qual é a **taxa de conversão geral** do dataset?
- [ ] A taxa de conversão varia conforme o **número de contatos** na campanha atual?
- [ ] Clientes com histórico positivo em campanhas anteriores (`poutcome = success`) têm maior chance de aceitar novamente?

---

### 5️⃣ **Insights Estratégicos**

- [ ] Qual **combinação de variáveis** (idade + saldo + canal) maximiza a probabilidade de conversão?
- [ ] Ranking dos **top 10 clientes** com maior potencial de conversão
- [ ] Existe um **perfil de baixíssimo retorno** que deve ser evitado em futuras campanhas?

---

## 📁 Estrutura do Repositório

```
📦 bank-marketing-analysis
├── 📂 data/              # Datasets originais e processados
├── 📂 sql/               # Scripts SQL para análise
├── 📂 notebooks/         # Jupyter notebooks para análise exploratória
├── 📂 visualizations/    # Dashboards e gráficos
├── 📂 docs/              # Documentação adicional
│   └── BD - Diagrama.png
└── README.md
```

---

## 🚀 Como Utilizar

### Pré-requisitos

- PostgreSQL 12+
- Python 3.8+
- Power BI Desktop

### Instalação

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/bank-marketing-analysis.git

# Entre no diretório
cd bank-marketing-analysis

# Instale as dependências Python
pip install -r requirements.txt
```

### Executar Análises SQL

```sql
-- Conecte-se ao PostgreSQL e execute os scripts
psql -U seu_usuario -d bank_marketing -f sql/queries.sql
```

---

## 📊 Resultados Esperados

- **Dashboard interativo** com principais KPIs das campanhas
- **Relatório de perfis** de clientes de alto e baixo potencial
- **Recomendações estratégicas** para otimização de campanhas futuras
- **Modelos preditivos** (opcional) para scoring de clientes

---

## 👥 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para:

- Reportar bugs
- Sugerir novas análises
- Melhorar a documentação
- Adicionar visualizações

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 📧 Contato

**Seu Nome**
- GitHub: [@seu-usuario](https://github.com/seu-usuario)
- LinkedIn: [seu-perfil](https://linkedin.com/in/seu-perfil)
- Email: seu-email@example.com

---

<div align="center">

**Desenvolvido com 💙 e ☕ para análise de dados**

[⬆ Voltar ao topo](#-análise-de-dados---bank-marketing-dataset)

</div>
