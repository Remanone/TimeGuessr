-- TimeGuessr : creation de la base de donnees et des tables
-- Usage : sudo mysql < data/schema.sql

CREATE DATABASE IF NOT EXISTS timeguessr CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'timeguessr'@'localhost' IDENTIFIED BY 'timeguessr';
GRANT ALL PRIVILEGES ON timeguessr.* TO 'timeguessr'@'localhost';
FLUSH PRIVILEGES;
USE timeguessr;

-- Table des rounds (photos historiques)
CREATE TABLE IF NOT EXISTS rounds (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(255)    NOT NULL,
    description TEXT            NOT NULL,
    year        INT             NOT NULL CHECK (year BETWEEN 1970 AND 2025),
    lat         DECIMAL(10,6)   NOT NULL,
    lng         DECIMAL(10,6)   NOT NULL,
    image       VARCHAR(255)    NOT NULL,
    category    ENUM('monuments','villes','evenements') NOT NULL DEFAULT 'villes',
    created_at  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Table des scores (historique des parties)
CREATE TABLE IF NOT EXISTS scores (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(50)     NOT NULL DEFAULT 'Anonyme',
    score       INT             NOT NULL,
    mode        VARCHAR(20)     NOT NULL DEFAULT 'classic',
    difficulty  VARCHAR(10)     NOT NULL DEFAULT 'normal',
    rounds_data JSON            NULL,
    played_at   DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
