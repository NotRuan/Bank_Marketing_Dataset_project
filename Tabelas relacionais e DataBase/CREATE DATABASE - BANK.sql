-- ===========================================================
-- BANCO DE DADOS: bank_marketing
-- OBJETIVO: Estruturar dados do Bank Marketing Dataset
-- AUTOR: Ruan Gabriel
-- ===========================================================
-- ===========================================================
-- 2️⃣ TABELA: CLIENTS
-- Contém dados pessoais e financeiros dos clientes
-- ===========================================================
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    age INT CHECK (age > 0),
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR(30),
    default_status VARCHAR(10) CHECK (default_status IN ('yes', 'no')),
    balance DECIMAL(10,2),
    housing VARCHAR(10) CHECK (housing IN ('yes', 'no')),
    loan VARCHAR(10) CHECK (loan IN ('yes', 'no'))
);

-- ===========================================================
-- 3️⃣ TABELA: CAMPAIGNS
-- Contém informações sobre as campanhas de marketing
-- ===========================================================
CREATE TABLE campaigns (
    campaign_id SERIAL PRIMARY KEY,
    contact VARCHAR(20) CHECK (contact IN ('cellular', 'telephone')),
    day INT CHECK (day BETWEEN 1 AND 31),
    month VARCHAR(10),
    duration INT CHECK (duration >= 0),
    campaign INT CHECK (campaign >= 0),
    pdays INT CHECK (pdays >= -1),
    previous INT CHECK (previous >= 0),
    poutcome VARCHAR(20)
);

-- ===========================================================
-- 4️⃣ TABELA: DEPOSITS
-- Relaciona clientes às campanhas e mostra o resultado (target)
-- ===========================================================
CREATE TABLE deposits (
    deposit_id SERIAL PRIMARY KEY,
    client_id INT NOT NULL REFERENCES clients(client_id) ON DELETE CASCADE,
    campaign_id INT NOT NULL REFERENCES campaigns(campaign_id) ON DELETE CASCADE,
    deposit VARCHAR(10) CHECK (deposit IN ('yes', 'no'))
);

-- ===========================================================
-- 5️⃣ ÍNDICES (para performance nas consultas)
-- ===========================================================
CREATE INDEX idx_clients_job ON clients(job);
CREATE INDEX idx_clients_marital ON clients(marital);
CREATE INDEX idx_clients_education ON clients(education);
CREATE INDEX idx_campaigns_month ON campaigns(month);
CREATE INDEX idx_deposits_result ON deposits(deposit);

-- ===========================================================
-- 6️⃣ TESTE RÁPIDO
-- ===========================================================
SELECT 'Banco de dados criado com sucesso!' AS status;
