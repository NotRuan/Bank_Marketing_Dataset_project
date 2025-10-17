-- ======================================
-- Criar tabela bruta (para importar o CSV)
-- ======================================
CREATE TABLE bank_raw (
    age INT,
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR(50),
    default_status VARCHAR(10),
    balance INT,
    housing VARCHAR(10),
    loan VARCHAR(10),
    contact VARCHAR(20),
    day INT,
    month VARCHAR(10),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(20),
    deposit VARCHAR(10)
);

-- ======================================
-- 3️⃣ Tabela de clientes
-- ======================================
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    age INT NOT NULL,
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR(50),
    default_status VARCHAR(10),
    balance INT,
    housing VARCHAR(10),
    loan VARCHAR(10)
);

-- ======================================
-- Tabela de campanhas
-- ======================================
CREATE TABLE campaigns (
    campaign_id SERIAL PRIMARY KEY,
    contact VARCHAR(20) CHECK (contact IN ('cellular', 'telephone') OR contact IS NULL),
    day INT,
    month VARCHAR(10),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(20)
);

-- ======================================
-- Tabela de depósitos (resultado)
-- ======================================
CREATE TABLE deposits (
    deposit_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(client_id) ON DELETE CASCADE,
    campaign_id INT REFERENCES campaigns(campaign_id) ON DELETE CASCADE,
    deposit VARCHAR(10)
);
