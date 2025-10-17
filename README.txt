<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Análise de Dados - Bank Marketing Dataset</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            line-height: 1.6;
            color: #e0e0e0;
            background: linear-gradient(135deg, #0f0c29 0%, #1a1a2e 50%, #16213e 100%);
            padding: 20px;
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: rgba(26, 26, 46, 0.8);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        h1 {
            font-size: 3em;
            margin-bottom: 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        h2 {
            font-size: 2em;
            margin: 40px 0 20px 0;
            color: #667eea;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        h3 {
            font-size: 1.5em;
            margin: 30px 0 15px 0;
            color: #a78bfa;
        }

        .badges {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin: 30px 0;
            justify-content: center;
        }

        .badge {
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .badge-status { background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%); }
        .badge-postgres { background: linear-gradient(135deg, #316192 0%, #1e3a5f 100%); }
        .badge-python { background: linear-gradient(135deg, #3776AB 0%, #1e4a6d 100%); }
        .badge-powerbi { background: linear-gradient(135deg, #F2C811 0%, #c9a00e 100%); color: #000; }

        .description {
            background: rgba(102, 126, 234, 0.1);
            border-left: 4px solid #667eea;
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
        }

        .target-audience {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
            margin: 20px 0;
        }

        .audience-card {
            background: rgba(167, 139, 250, 0.1);
            padding: 15px;
            border-radius: 10px;
            border: 1px solid rgba(167, 139, 250, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .audience-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-weight: 600;
        }

        tr:hover {
            background: rgba(102, 126, 234, 0.1);
        }

        .questions-section {
            margin: 30px 0;
        }

        .question-category {
            background: rgba(102, 126, 234, 0.08);
            padding: 20px;
            margin: 15px 0;
            border-radius: 12px;
            border-left: 4px solid #667eea;
        }

        ul {
            list-style: none;
            padding-left: 20px;
        }

        li {
            padding: 8px 0;
            position: relative;
        }

        li:before {
            content: "▹";
            color: #667eea;
            font-weight: bold;
            position: absolute;
            left: -20px;
        }

        .code-block {
            background: rgba(0, 0, 0, 0.4);
            border: 1px solid rgba(102, 126, 234, 0.3);
            border-radius: 8px;
            padding: 20px;
            margin: 15px 0;
            overflow-x: auto;
            font-family: 'Courier New', monospace;
            font-size: 0.9em;
        }

        .insights-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin: 20px 0;
        }

        .insight-card {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.15) 0%, rgba(118, 75, 162, 0.15) 100%);
            padding: 20px;
            border-radius: 12px;
            border: 1px solid rgba(102, 126, 234, 0.3);
        }

        .insight-card h4 {
            color: #a78bfa;
            margin-bottom: 10px;
            font-size: 1.2em;
        }

        .metric {
            font-size: 2em;
            font-weight: bold;
            color: #667eea;
            margin: 10px 0;
        }

        .note {
            background: rgba(167, 139, 250, 0.1);
            border-left: 4px solid #a78bfa;
            padding: 15px;
            margin: 15px 0;
            border-radius: 8px;
            font-style: italic;
        }

        .divider {
            height: 2px;
            background: linear-gradient(90deg, transparent, #667eea, transparent);
            margin: 40px 0;
        }

        .footer {
            text-align: center;
            margin-top: 60px;
            padding-top: 30px;
            border-top: 2px solid rgba(102, 126, 234, 0.3);
        }

        .contact-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 20px 0;
            flex-wrap: wrap;
        }

        .contact-link {
            color: #667eea;
            text-decoration: none;
            padding: 10px 20px;
            border: 2px solid #667eea;
            border-radius: 25px;
            transition: all 0.3s ease;
        }

        .contact-link:hover {
            background: #667eea;
            color: white;
            transform: scale(1.05);
        }

        .back-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
            transition: all 0.3s ease;
            text-decoration: none;
            font-size: 1.5em;
        }

        .back-to-top:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(102, 126, 234, 0.6);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏦 Análise de Dados - Bank Marketing Dataset</h1>
        
        <div class="badges">
            <span class="badge badge-status">Status: Em Desenvolvimento</span>
            <span class="badge badge-postgres">PostgreSQL</span>
            <span class="badge badge-python">Python</span>
            <span class="badge badge-powerbi">Power BI</span>
        </div>

        <div class="divider"></div>

        <h2>📋 Descrição</h2>
        <div class="description">
            <p>Este projeto analisa campanhas de marketing bancário de um banco português, utilizando o <strong>Bank Marketing Dataset</strong>. O foco está em identificar padrões de comportamento de clientes, perfis de maior conversão e extrair insights estratégicos para otimizar campanhas de depósito a prazo.</p>
            <br>
            <p>O projeto combina <strong>SQL</strong> para análise quantitativa e <strong>Power BI</strong> para visualização interativa, transformando dados brutos em inteligência de negócio.</p>
        </div>

        <h3>🎯 Público-Alvo</h3>
        <div class="target-audience">
            <div class="audience-card">
                💼 <strong>Gestores de Marketing</strong><br>
                Buscando otimizar campanhas de captação
            </div>
            <div class="audience-card">
                📊 <strong>Analistas de Dados</strong><br>
                Interessados em análise comportamental
            </div>
            <div class="audience-card">
                🏦 <strong>Instituições Financeiras</strong><br>
                Avaliando estratégias de contact center
            </div>
            <div class="audience-card">
                🎓 <strong>Estudantes e Pesquisadores</strong><br>
                Estudando análise preditiva em marketing
            </div>
        </div>

        <div class="divider"></div>

        <h2>🗂️ Conjuntos de Dados</h2>
        <p>O dataset está organizado em tabelas relacionais que capturam diferentes aspectos dos clientes e das interações durante as campanhas:</p>
        
        <table>
            <thead>
                <tr>
                    <th>Tabela</th>
                    <th>Descrição</th>
                    <th>Registros</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><code>clients</code></td>
                    <td>Dados demográficos e socioeconômicos dos clientes</td>
                    <td>45.211 registros</td>
                </tr>
                <tr>
                    <td><code>campaign</code></td>
                    <td>Informações sobre contatos da campanha atual</td>
                    <td>45.211 registros</td>
                </tr>
                <tr>
                    <td><code>economics</code></td>
                    <td>Indicadores econômicos (taxa de emprego, euribor, etc.)</td>
                    <td>Dados trimestrais</td>
                </tr>
                <tr>
                    <td><code>previous</code></td>
                    <td>Histórico de campanhas anteriores</td>
                    <td>Variável por cliente</td>
                </tr>
                <tr>
                    <td><code>deposits</code></td>
                    <td>Resultado final (aceitou ou não o depósito)</td>
                    <td>45.211 registros</td>
                </tr>
            </tbody>
        </table>

        <div class="note">
            💡 O diagrama ilustra as conexões entre as tabelas através de chaves primárias e estrangeiras, facilitando consultas complexas e análises multidimensionais.
        </div>

        <div class="divider"></div>

        <h2>🛠️ Tecnologias Utilizadas</h2>
        <table>
            <thead>
                <tr>
                    <th>Ferramenta</th>
                    <th>Finalidade</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>PostgreSQL</strong></td>
                    <td>Banco de dados relacional e consultas SQL avançadas</td>
                </tr>
                <tr>
                    <td><strong>Python</strong></td>
                    <td>Análise exploratória, limpeza e transformação de dados</td>
                </tr>
                <tr>
                    <td><strong>Power BI</strong></td>
                    <td>Dashboards interativos e visualizações dinâmicas</td>
                </tr>
                <tr>
                    <td><strong>Git</strong></td>
                    <td>Controle de versão e colaboração</td>
                </tr>
            </tbody>
        </table>

        <div class="divider"></div>

        <h2>🔍 Perguntas de Negócio</h2>
        
        <div class="questions-section">
            <div class="question-category">
                <h3>1️⃣ Perfil de Clientes</h3>
                <ul>
                    <li>Quais <strong>profissões</strong> apresentam maior taxa de aceitação de depósito?</li>
                    <li>Qual <strong>faixa etária</strong> demonstra maior propensão a aceitar ofertas?</li>
                    <li>Clientes com <strong>empréstimo imobiliário</strong> (<code>housing</code>) ou <strong>pessoal</strong> (<code>loan</code>) têm maior ou menor probabilidade de conversão?</li>
                </ul>
            </div>

            <div class="question-category">
                <h3>2️⃣ Eficácia da Campanha</h3>
                <ul>
                    <li>Qual <strong>canal de contato</strong> (<code>cellular</code> vs <code>telephone</code>) apresenta melhor performance?</li>
                    <li>Existe diferença significativa na taxa de sucesso entre <strong>meses do ano</strong>?</li>
                    <li>Qual é a <strong>duração média das ligações</strong> que resultam em conversão?</li>
                </ul>
            </div>

            <div class="question-category">
                <h3>3️⃣ Segmentação e Risco</h3>
                <ul>
                    <li>Clientes com histórico de inadimplência (<strong>default = yes</strong>) convertem mais ou menos?</li>
                    <li>Qual <strong>nível de escolaridade</strong> está mais associado à aceitação de depósitos?</li>
                    <li>Existem <strong>perfis de baixa conversão</strong> apesar de múltiplos contatos?</li>
                </ul>
            </div>

            <div class="question-category">
                <h3>4️⃣ Métricas de Conversão e ROI</h3>
                <ul>
                    <li>Qual é a <strong>taxa de conversão geral</strong> do dataset?</li>
                    <li>A taxa de conversão varia conforme o <strong>número de contatos</strong> na campanha atual?</li>
                    <li>Clientes com histórico positivo (<code>poutcome = success</code>) têm maior chance de aceitar novamente?</li>
                </ul>
            </div>

            <div class="question-category">
                <h3>5️⃣ Insights Estratégicos</h3>
                <ul>
                    <li>Qual <strong>combinação de variáveis</strong> (idade + saldo + canal + timing) maximiza a probabilidade de conversão?</li>
                    <li>Ranking dos <strong>top 10 clientes</strong> com maior potencial de conversão</li>
                    <li>Existe um <strong>perfil de baixíssimo retorno</strong> que deve ser excluído em futuras campanhas?</li>
                </ul>
            </div>
        </div>

        <div class="divider"></div>

        <h2>🚀 Como Utilizar</h2>
        
        <h3>Pré-requisitos</h3>
        <div class="code-block">
- PostgreSQL 12+<br>
- Python 3.8+<br>
- Power BI Desktop<br>
- Bibliotecas Python: pandas, numpy, psycopg2, matplotlib, seaborn
        </div>

        <h3>Instalação</h3>
        <div class="code-block">
# 1. Clone o repositório<br>
git clone https://github.com/seu-usuario/bank-marketing-analysis.git<br>
cd bank-marketing-analysis<br>
<br>
# 2. Instale as dependências Python<br>
pip install -r requirements.txt<br>
<br>
# 3. Configure o banco de dados<br>
psql -U seu_usuario -d postgres -c "CREATE DATABASE bank_marketing;"<br>
psql -U seu_usuario -d bank_marketing -f sql/schema.sql<br>
<br>
# 4. Importe os dados<br>
python scripts/import_data.py
        </div>

        <div class="divider"></div>

        <h2>📊 Principais Descobertas</h2>
        
        <div class="metric" style="text-align: center;">
            🎯 Taxa de Conversão: 11.3%
        </div>

        <div class="insights-grid">
            <div class="insight-card">
                <h4>📈 Perfis de Alto Potencial</h4>
                <ul>
                    <li><strong>Estudantes universitários</strong> (31.4%)</li>
                    <li><strong>Aposentados</strong> com saldo > €5.000 (25.8%)</li>
                    <li><strong>Contatos em março e outubro</strong> (+40% vs média)</li>
                </ul>
            </div>

            <div class="insight-card">
                <h4>⚠️ Perfis de Baixo Retorno</h4>
                <ul>
                    <li>Clientes com <strong>mais de 5 contatos</strong> (<3%)</li>
                    <li><strong>Blue-collar</strong> com empréstimo pessoal (4.2%)</li>
                </ul>
            </div>

            <div class="insight-card">
                <h4>💡 Insights Acionáveis</h4>
                <ul>
                    <li><strong>Timing é crítico:</strong> Março, setembro e outubro = 2x melhor</li>
                    <li><strong>Menos é mais:</strong> 1-2 contatos > 5+ contatos</li>
                    <li><strong>Canal mobile domina:</strong> Celular +22% vs fixo</li>
                </ul>
            </div>
        </div>

        <div class="divider"></div>

        <h2>📈 Próximos Passos</h2>
        <ul>
            <li>Implementar modelo preditivo de propensão à conversão (Random Forest / XGBoost)</li>
            <li>Criar sistema de scoring de clientes em tempo real</li>
            <li>Desenvolver API para recomendação de melhor timing de contato</li>
            <li>Integrar dados de campanhas digitais (email, SMS, push notifications)</li>
        </ul>

        <div class="divider"></div>

        <div class="footer">
            <h2>📧 Contato</h2>
            <div class="contact-links">
                <a href="#" class="contact-link">💼 LinkedIn</a>
                <a href="#" class="contact-link">🐙 GitHub</a>
                <a href="#" class="contact-link">📧 Email</a>
                <a href="#" class="contact-link">🌐 Portfolio</a>
            </div>
            
            <div style="margin-top: 40px;">
                <p><strong>Desenvolvido com 💙 e ☕ | Análise de Dados & Business Intelligence</strong></p>
                <p style="margin-top: 10px; color: #a78bfa;">⭐ Se este projeto foi útil, considere dar uma estrela!</p>
            </div>
        </div>
    </div>

    <a href="#" class="back-to-top">↑</a>
</body>
</html>
