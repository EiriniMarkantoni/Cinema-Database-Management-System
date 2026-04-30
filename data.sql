USE cinema_db;

-- =========================
-- AITHOUSES (Halls)
-- =========================
INSERT INTO aithouses VALUES
(1, 0, 120, 4),
(2, 1, 90, 3),
(3, 1, 150, 5);

-- =========================
-- CONTACT PERSON
-- =========================
INSERT INTO upeuthinos_epikoinwnias VALUES
('contact@filmco.gr', 'Maria Papadopoulou'),
('info@hellasfilms.gr', 'Nikos Georgiou');

-- =========================
-- DISTRIBUTION COMPANIES
-- =========================
INSERT INTO etairia_dianomhs VALUES
(123456789, 'FilmCo SA', 'Athens', 'contact@filmco.gr'),
(987654321, 'Hellas Films', 'Thessaloniki', 'info@hellasfilms.gr');

-- =========================
-- MOVIES
-- =========================
INSERT INTO tainies VALUES
('Inception', 'Christopher Nolan', 'Warner Bros', '2010-01-01', 5, 123456789),
('Interstellar', 'Christopher Nolan', 'Paramount', '2014-01-01', 6, 123456789),
('Avatar', 'James Cameron', '20th Century Fox', '2009-01-01', 4, 987654321),
('Titanic', 'James Cameron', 'Paramount', '1997-01-01', 4, 987654321),
('Joker', 'Todd Phillips', 'Warner Bros', '2019-01-01', 3, 123456789);

-- =========================
-- TRIBUTES
-- =========================
INSERT INTO afierwmata VALUES
('Nolan Tribute', '2024-01-01', 7, 1),
('Cameron Tribute', '2024-02-01', 5, 2);

-- =========================
-- EMPLOYEES
-- =========================
INSERT INTO upallhlos VALUES
('AB123456', 'Eleni Markou', 'Kozani', 25),
('AB123457', 'Giorgos Pappas', 'Kozani', 30),
('AB123458', 'Anna Dimitriou', 'Grevena', 28),
('AB123459', 'Kostas Nikolaou', 'Kastoria', 35),
('AB123460', 'Maria Antoniou', 'Florina', 24);

-- =========================
-- CASHIERS
-- =========================
INSERT INTO tamies VALUES
('AB123456', 1001),
('AB123457', 1002);

-- =========================
-- CLEANING STAFF
-- =========================
INSERT INTO proswpiko_kathariothtas VALUES
('AB123458', '08:00-14:00');

-- =========================
-- USHERS
-- =========================
INSERT INTO taksithetes VALUES
('AB123459', '16:00-22:00');

-- =========================
-- SECURITY
-- =========================
INSERT INTO proswpiko_asfaleias VALUES
('AB123460', 'yes', 'no', 'yes');

-- =========================
-- PROJECTIONS
-- =========================
INSERT INTO proballetai VALUES
('Inception', 1, 148),
('Interstellar', 2, 169),
('Avatar', 3, 162),
('Titanic', 2, 195),
('Joker', 1, 122);

-- =========================
-- TICKETS
-- =========================
INSERT INTO eisithria VALUES
('T001', 'no', 'yes', 'yes', 'no', 'Inception', 1, 'AB123456'),
('T002', 'yes', 'no', 'no', 'yes', 'Inception', 1, 'AB123456'),
('T003', 'no', 'yes', 'yes', 'no', 'Interstellar', 2, 'AB123457'),
('T004', 'no', 'yes', 'no', 'yes', 'Avatar', 3, 'AB123457'),
('T005', 'yes', 'no', 'no', 'yes', 'Titanic', 2, 'AB123456'),
('T006', 'no', 'yes', 'yes', 'no', 'Joker', 1, 'AB123457');

-- =========================
-- PAYMENTS
-- =========================
INSERT INTO plhrwmh VALUES
('P001', '18:30', '2024-01-10'),
('P002', '19:00', '2024-01-10'),
('P003', '20:15', '2024-01-11');

-- =========================
-- CASH PAYMENTS
-- =========================
INSERT INTO metrhta VALUES
(NULL, 'P001'),
(NULL, 'P002');

-- =========================
-- CARD PAYMENTS
-- =========================
INSERT INTO karta VALUES
(1111222233334444, 'Eleni Markou', 'Visa', 'P003');

-- =========================
-- PURCHASES
-- =========================
INSERT INTO agorazontai VALUES
('P001', 'T001'),
('P001', 'T002'),
('P002', 'T003'),
('P003', 'T004');

-- =========================
-- CASHIER HANDLING PAYMENTS
-- =========================
INSERT INTO pragmatopoieitai VALUES
('AB123456', 'P001'),
('AB123457', 'P002'),
('AB123456', 'P003');

-- =========================
-- USHERS WORKING
-- =========================
INSERT INTO ergazontai VALUES
(1, 'AB123459');

-- =========================
-- CLEANING STAFF WORKING
-- =========================
INSERT INTO ergazetai VALUES
(2, 'AB123458');

-- =========================
-- TRIBUTES INCLUDE MOVIES
-- =========================
INSERT INTO perilambanei VALUES
('Nolan Tribute', 'Inception'),
('Nolan Tribute', 'Interstellar'),
('Cameron Tribute', 'Avatar'),
('Cameron Tribute', 'Titanic');