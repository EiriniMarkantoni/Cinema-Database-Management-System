-- Create Database
CREATE DATABASE IF NOT EXISTS cinema_db;
USE cinema_db;

-- =========================
-- TABLE: aithouses (Halls)
-- =========================
CREATE TABLE aithouses (
    noumero INT PRIMARY KEY,
    orofos INT,
    xwritikothta INT,
    plhthos_eisodwn_eksodwn INT
);

-- =========================
-- TABLE: upeuthinos_epikoinwnias (Contact Person)
-- =========================
CREATE TABLE upeuthinos_epikoinwnias (
    email VARCHAR(50) PRIMARY KEY,
    onoma VARCHAR(50)
);

-- =========================
-- TABLE: etairia_dianomhs (Distribution Company)
-- =========================
CREATE TABLE etairia_dianomhs (
    AFM INT PRIMARY KEY,
    onoma VARCHAR(50),
    dieuthinsh VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    FOREIGN KEY (email) REFERENCES upeuthinos_epikoinwnias(email)
);

-- =========================
-- TABLE: tainies (Movies)
-- =========================
CREATE TABLE tainies (
    titlos_tainias VARCHAR(50) PRIMARY KEY,
    skinotheths VARCHAR(50),
    etairia_paragwghs VARCHAR(50),
    etos_kukloforias DATE,
    sunolo_prwtagwnistwn INT,
    AFM INT,
    FOREIGN KEY (AFM) REFERENCES etairia_dianomhs(AFM)
);

-- =========================
-- TABLE: afierwmata (Tributes)
-- =========================
CREATE TABLE afierwmata (
    titlos_afier VARCHAR(50) PRIMARY KEY,
    hmerominia_enarkshs DATE,
    xronikh_diarkeia INT,
    noumero INT,
    FOREIGN KEY (noumero) REFERENCES aithouses(noumero)
);

-- =========================
-- TABLE: upallhlos (Employee)
-- =========================
CREATE TABLE upallhlos (
    arithmos_tautothtas VARCHAR(10) PRIMARY KEY,
    onoma VARCHAR(50),
    dieuthinsh VARCHAR(50),
    hlikia INT
);

-- =========================
-- TABLE: tamies (Cashiers)
-- =========================
CREATE TABLE tamies (
    arithmos_tautothtas VARCHAR(10) PRIMARY KEY,
    kwdikos_upallhlou INT UNIQUE,
    FOREIGN KEY (arithmos_tautothtas) 
        REFERENCES upallhlos(arithmos_tautothtas)
);

-- =========================
-- TABLE: proswpiko_kathariothtas (Cleaning Staff)
-- =========================
CREATE TABLE proswpiko_kathariothtas (
    arithmos_tautothtas VARCHAR(10) PRIMARY KEY,
    wrario_ergasias VARCHAR(20),
    FOREIGN KEY (arithmos_tautothtas) 
        REFERENCES upallhlos(arithmos_tautothtas)
);

-- =========================
-- TABLE: taksithetes (Ushers)
-- =========================
CREATE TABLE taksithetes (
    arithmos_tautothtas VARCHAR(10) PRIMARY KEY,
    wrario_ergasias VARCHAR(20),
    FOREIGN KEY (arithmos_tautothtas) 
        REFERENCES upallhlos(arithmos_tautothtas)
);

-- =========================
-- TABLE: proswpiko_asfaleias (Security Staff)
-- =========================
CREATE TABLE proswpiko_asfaleias (
    arithmos_tautothtas VARCHAR(10) PRIMARY KEY,
    prwinh_bardia VARCHAR(10),
    apogeumatinh_bardia VARCHAR(10),
    bradinh_bardia VARCHAR(10),
    FOREIGN KEY (arithmos_tautothtas) 
        REFERENCES upallhlos(arithmos_tautothtas)
);

-- =========================
-- TABLE: plhrwmh (Payments)
-- =========================
CREATE TABLE plhrwmh (
    arithmos_plhrwmhs VARCHAR(20) PRIMARY KEY,
    wra VARCHAR(10),
    hmeromhnia DATE
);

-- =========================
-- TABLE: metrhta (Cash Payments)
-- =========================
CREATE TABLE metrhta (
    auks_arithmos_apod INT AUTO_INCREMENT UNIQUE,
    arithmos_plhrwmhs VARCHAR(20) PRIMARY KEY,
    FOREIGN KEY (arithmos_plhrwmhs) 
        REFERENCES plhrwmh(arithmos_plhrwmhs)
);

-- =========================
-- TABLE: karta (Card Payments)
-- =========================
CREATE TABLE karta (
    noumero_kartas BIGINT UNIQUE,
    onoma_katoxou VARCHAR(50),
    eidos VARCHAR(30),
    arithmos_plhrwmhs VARCHAR(20) PRIMARY KEY,
    FOREIGN KEY (arithmos_plhrwmhs) 
        REFERENCES plhrwmh(arithmos_plhrwmhs)
);

-- =========================
-- TABLE: eisithria (Tickets)
-- =========================
CREATE TABLE eisithria (
    kwdikos_eisithriou VARCHAR(20) PRIMARY KEY,
    meiwmeno VARCHAR(5),
    olokliro VARCHAR(5),
    thesi_1klashs VARCHAR(5),
    thesi_2klashs VARCHAR(5),
    titlos_tainias VARCHAR(50),
    noumero INT,
    arithmos_tautothtas VARCHAR(10),
    FOREIGN KEY (titlos_tainias) REFERENCES tainies(titlos_tainias),
    FOREIGN KEY (noumero) REFERENCES aithouses(noumero),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES tamies(arithmos_tautothtas)
);

-- =========================
-- TABLE: proballetai (Projection)
-- =========================
CREATE TABLE proballetai (
    titlos_tainias VARCHAR(50),
    noumero INT,
    xronikh_diarkeia INT,
    PRIMARY KEY (titlos_tainias, noumero),
    FOREIGN KEY (titlos_tainias) REFERENCES tainies(titlos_tainias),
    FOREIGN KEY (noumero) REFERENCES aithouses(noumero)
);

-- =========================
-- TABLE: perilambanei (Contains)
-- =========================
CREATE TABLE perilambanei (
    titlos_afier VARCHAR(50),
    titlos_tainias VARCHAR(50),
    PRIMARY KEY (titlos_afier, titlos_tainias),
    FOREIGN KEY (titlos_afier) REFERENCES afierwmata(titlos_afier),
    FOREIGN KEY (titlos_tainias) REFERENCES tainies(titlos_tainias)
);

-- =========================
-- TABLE: agorazontai (Purchases)
-- =========================
CREATE TABLE agorazontai (
    arithmos_plhrwmhs VARCHAR(20),
    kwdikos_eisithriou VARCHAR(20),
    PRIMARY KEY (arithmos_plhrwmhs, kwdikos_eisithriou),
    FOREIGN KEY (arithmos_plhrwmhs) REFERENCES plhrwmh(arithmos_plhrwmhs),
    FOREIGN KEY (kwdikos_eisithriou) REFERENCES eisithria(kwdikos_eisithriou)
);

-- =========================
-- TABLE: pragmatopoieitai (Handled by cashier)
-- =========================
CREATE TABLE pragmatopoieitai (
    arithmos_tautothtas VARCHAR(10),
    arithmos_plhrwmhs VARCHAR(20),
    PRIMARY KEY (arithmos_tautothtas, arithmos_plhrwmhs),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES tamies(arithmos_tautothtas),
    FOREIGN KEY (arithmos_plhrwmhs) REFERENCES plhrwmh(arithmos_plhrwmhs)
);

-- =========================
-- TABLE: ergazontai (Ushers working in halls)
-- =========================
CREATE TABLE ergazontai (
    noumero INT,
    arithmos_tautothtas VARCHAR(10),
    PRIMARY KEY (noumero, arithmos_tautothtas),
    FOREIGN KEY (noumero) REFERENCES aithouses(noumero),
    FOREIGN KEY (arithmos_tautothtas) REFERENCES taksithetes(arithmos_tautothtas)
);

-- =========================
-- TABLE: ergazetai (Cleaning staff working in halls)
-- =========================
CREATE TABLE ergazetai (
    noumero INT,
    arithmos_tautothtas VARCHAR(10),
    PRIMARY KEY (noumero, arithmos_tautothtas),
    FOREIGN KEY (noumero) REFERENCES aithouses(noumero),
    FOREIGN KEY (arithmos_tautothtas) 
        REFERENCES proswpiko_kathariothtas(arithmos_tautothtas)
);