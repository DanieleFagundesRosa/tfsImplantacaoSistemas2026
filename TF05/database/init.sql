-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS app;
USE app;

-- Tabela para histórico de saúde (Requisito: Histórico de saúde)
CREATE TABLE IF NOT EXISTS health_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL, -- 'healthy' ou 'unhealthy'
    response_time_ms INT,
    check_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para registro de alertas
CREATE TABLE IF NOT EXISTS alerts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    severity VARCHAR(20) NOT NULL, -- 'warning' ou 'critical'
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserção de dados iniciais para teste
INSERT INTO health_history (service_name, status, response_time_ms) VALUES ('system-init', 'healthy', 0);