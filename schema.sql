-- =========================================================
-- Corrected Cinema Database Schema
-- Compatible with MySQL / MariaDB
-- =========================================================

DROP DATABASE IF EXISTS cinema_db;
CREATE DATABASE cinema_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE cinema_db;

-- =========================
-- TABLE: aithouses
-- =========================
CREATE TABLE aithouses (
    noumero INT NOT NULL,
    orofos INT,
    xwritikothta INT,
    plhthos_eisodwn_eksodwn INT,
    PRIMARY KEY (noumero)
);

-- =========================
-- TABLE: upeuthinos_epikoinwnias
-- =========================
CREATE TABLE upeuthinos_epikoinwnias (
    email VARCHAR(50) NOT NULL,
    onoma VARCHAR(50),
    PRIMARY KEY (email)
);

-- =========================
-- TABLE: etairia_dianomhs
-- One contact person can be responsible for more than one company.
-- Therefore email is a foreign key, but NOT unique.
-- =========================
CREATE TABLE etairia_dianomhs (
    AFM INT NOT NULL,
    onoma VARCHAR(50),
    dieuthinsh VARCHAR(80),
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (AFM),
    FOREIGN KEY (email) REFERENCES upeuthinos_epikoinwnias(email)
);

-- =========================
-- TABLE: tainies
-- xronikh_diarkeia belongs to the movie entity.
-- =========================
CREATE TABLE tainies (
    titlos_tainias VARCHAR(60) NOT NULL,
    skinotheths VARCHAR(60),
    etairia_paragwghs VARCHAR(60),
    etos_kukloforias YEAR,
    xronikh_diarkeia INT,
    sunolo_prwtagwnistwn INT,
    AFM INT NOT NULL,
    PRIMARY KEY (titlos_tainias),
    FOREIGN KEY (AFM) REFERENCES etairia_dianomhs(AFM)
);

-- =========================
-- TABLE: afierwmata
-- Each tribute is projected in one hall.
-- =========================
CREATE TABLE afierwmata (
    titlos_afier VARCHAR(60) NOT NULL,
    hmerominia_enarkshs DATE,
    xronikh_diarkeia INT,
    noumero INT NOT NULL,
    PRIMARY KEY (titlos_afier),
    FOREIGN KEY (noumero) REFERENCES aithouses(noumero)
);

-- =========================
-- TABLE: upallhlos
-- =========================
CREATE TABLE upallhlos (
    arithmos_tautothtas VARCHAR(10) NOT NULL,
    onoma VARCHAR(50),
    dieuthinsh VARCHAR(80),
    hlikia INT,
    PRIMARY KEY (arithmos_tautothtas)
);

-- =========================
-- ISA: upallhlos -> tamies
-- =========================
CREATE TABLE tamies (
    arithmos_tautothtas VARCHAR(10) NOT NULL,
    kwdikos_upallhlou INT NOT NULL,
    PRIMARY KEY (arithmos_tautothtas),
    UNIQUE (kwdikos_upallhlou),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES upallhlos(arithmos_tautothtas)
);

-- =========================
-- ISA: upallhlos -> taksithetes
-- =========================
CREATE TABLE taksithetes (
    arithmos_tautothtas VARCHAR(10) NOT NULL,
    wrario_ergasias VARCHAR(20),
    PRIMARY KEY (arithmos_tautothtas),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES upallhlos(arithmos_tautothtas)
);

-- =========================
-- ISA: upallhlos -> proswpiko_kathariothtas
-- =========================
CREATE TABLE proswpiko_kathariothtas (
    arithmos_tautothtas VARCHAR(10) NOT NULL,
    wrario_ergasias VARCHAR(20),
    PRIMARY KEY (arithmos_tautothtas),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES upallhlos(arithmos_tautothtas)
);

-- =========================
-- ISA: upallhlos -> proswpiko_asfaleias
-- =========================
CREATE TABLE proswpiko_asfaleias (
    arithmos_tautothtas VARCHAR(10) NOT NULL,
    prwinh_bardia BOOLEAN DEFAULT FALSE,
    apogeumatinh_bardia BOOLEAN DEFAULT FALSE,
    bradinh_bardia BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (arithmos_tautothtas),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES upallhlos(arithmos_tautothtas)
);

-- =========================
-- TABLE: eisithria
-- Each ticket corresponds to one movie, one hall, and optionally one cashier.
-- =========================
CREATE TABLE eisithria (
    kwdikos_eisithriou VARCHAR(20) NOT NULL,
    meiwmeno BOOLEAN NOT NULL DEFAULT FALSE,
    olokliro BOOLEAN NOT NULL DEFAULT TRUE,
    thesi_1klashs BOOLEAN NOT NULL DEFAULT FALSE,
    thesi_2klashs BOOLEAN NOT NULL DEFAULT TRUE,
    plhthos INT NOT NULL DEFAULT 1,
    titlos_tainias VARCHAR(60) NOT NULL,
    noumero INT NOT NULL,
    arithmos_tautothtas VARCHAR(10),
    PRIMARY KEY (kwdikos_eisithriou),
    FOREIGN KEY (titlos_tainias) REFERENCES tainies(titlos_tainias),
    FOREIGN KEY (noumero) REFERENCES aithouses(noumero),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES tamies(arithmos_tautothtas),
    CHECK (meiwmeno + olokliro = 1),
    CHECK (thesi_1klashs + thesi_2klashs = 1)
);

-- =========================
-- TABLE: plhrwmh
-- =========================
CREATE TABLE plhrwmh (
    arithmos_plhrwmhs VARCHAR(20) NOT NULL,
    wra TIME,
    hmeromhnia DATE,
    PRIMARY KEY (arithmos_plhrwmhs)
);

-- =========================
-- ISA: plhrwmh -> karta
-- =========================
CREATE TABLE karta (
    arithmos_plhrwmhs VARCHAR(20) NOT NULL,
    noumero_kartas VARCHAR(20) NOT NULL,
    onoma_katoxou VARCHAR(50),
    eidos VARCHAR(30),
    PRIMARY KEY (arithmos_plhrwmhs),
    UNIQUE (noumero_kartas),
    FOREIGN KEY (arithmos_plhrwmhs) REFERENCES plhrwmh(arithmos_plhrwmhs)
);

-- =========================
-- ISA: plhrwmh -> metrhta
-- =========================
CREATE TABLE metrhta (
    arithmos_plhrwmhs VARCHAR(20) NOT NULL,
    auks_arithmos_apod INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (arithmos_plhrwmhs),
    UNIQUE (auks_arithmos_apod),
    FOREIGN KEY (arithmos_plhrwmhs) REFERENCES plhrwmh(arithmos_plhrwmhs)
);

-- =========================
-- RELATION: proballetai
-- Many-to-many between tainies and aithouses.
-- =========================
CREATE TABLE proballetai (
    titlos_tainias VARCHAR(60) NOT NULL,
    noumero INT NOT NULL,
    PRIMARY KEY (titlos_tainias, noumero),
    FOREIGN KEY (titlos_tainias) REFERENCES tainies(titlos_tainias),
    FOREIGN KEY (noumero) REFERENCES aithouses(noumero)
);

-- =========================
-- RELATION: perilambanei
-- Many-to-many between afierwmata and tainies.
-- =========================
CREATE TABLE perilambanei (
    titlos_afier VARCHAR(60) NOT NULL,
    titlos_tainias VARCHAR(60) NOT NULL,
    PRIMARY KEY (titlos_afier, titlos_tainias),
    FOREIGN KEY (titlos_afier) REFERENCES afierwmata(titlos_afier),
    FOREIGN KEY (titlos_tainias) REFERENCES tainies(titlos_tainias)
);

-- =========================
-- RELATION: agorazontai
-- A payment can buy one or more tickets.
-- A ticket can appear in one purchase.
-- =========================
CREATE TABLE agorazontai (
    arithmos_plhrwmhs VARCHAR(20) NOT NULL,
    kwdikos_eisithriou VARCHAR(20) NOT NULL,
    PRIMARY KEY (arithmos_plhrwmhs, kwdikos_eisithriou),
    UNIQUE (kwdikos_eisithriou),
    FOREIGN KEY (arithmos_plhrwmhs) REFERENCES plhrwmh(arithmos_plhrwmhs),
    FOREIGN KEY (kwdikos_eisithriou) REFERENCES eisithria(kwdikos_eisithriou)
);

-- =========================
-- RELATION: pragmatopoieitai
-- Cashiers handle payments.
-- =========================
CREATE TABLE pragmatopoieitai (
    arithmos_tautothtas VARCHAR(10) NOT NULL,
    arithmos_plhrwmhs VARCHAR(20) NOT NULL,
    PRIMARY KEY (arithmos_tautothtas, arithmos_plhrwmhs),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES tamies(arithmos_tautothtas),
    FOREIGN KEY (arithmos_plhrwmhs) REFERENCES plhrwmh(arithmos_plhrwmhs)
);

-- =========================
-- RELATION: ergazontai
-- Ushers work in halls.
-- =========================
CREATE TABLE ergazontai (
    noumero INT NOT NULL,
    arithmos_tautothtas VARCHAR(10) NOT NULL,
    PRIMARY KEY (noumero, arithmos_tautothtas),
    FOREIGN KEY (noumero) REFERENCES aithouses(noumero),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES taksithetes(arithmos_tautothtas)
);

-- =========================
-- RELATION: ergazetai
-- Cleaning staff work in halls.
-- =========================
CREATE TABLE ergazetai (
    noumero INT NOT NULL,
    arithmos_tautothtas VARCHAR(10) NOT NULL,
    PRIMARY KEY (noumero, arithmos_tautothtas),
    FOREIGN KEY (noumero) REFERENCES aithouses(noumero),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES proswpiko_kathariothtas(arithmos_tautothtas)
);
