USE cinema_db;

INSERT INTO aithouses (noumero, orofos, xwritikothta, plhthos_eisodwn_eksodwn) VALUES
(1, 0, 120, 4),
(2, 1, 90, 3),
(3, 1, 150, 5);

INSERT INTO upeuthinos_epikoinwnias (email, onoma) VALUES
('contact@filmco.gr', 'Maria Papadopoulou'),
('info@hellasfilms.gr', 'Nikos Georgiou');

INSERT INTO etairia_dianomhs (AFM, onoma, dieuthinsh, email) VALUES
(123456789, 'FilmCo SA', 'Athens', 'contact@filmco.gr'),
(987654321, 'Hellas Films', 'Thessaloniki', 'info@hellasfilms.gr'),
(111222333, 'Northern Movies', 'Kozani', 'contact@filmco.gr');

INSERT INTO tainies (titlos_tainias, skinotheths, etairia_paragwghs, etos_kukloforias, xronikh_diarkeia, sunolo_prwtagwnistwn, AFM) VALUES
('Inception', 'Christopher Nolan', 'Warner Bros', 2010, 148, 5, 123456789),
('Interstellar', 'Christopher Nolan', 'Paramount', 2014, 169, 6, 123456789),
('Avatar', 'James Cameron', '20th Century Fox', 2009, 162, 4, 987654321),
('Titanic', 'James Cameron', 'Paramount', 1997, 195, 4, 987654321),
('Joker', 'Todd Phillips', 'Warner Bros', 2019, 122, 3, 111222333);

INSERT INTO afierwmata (titlos_afier, hmerominia_enarkshs, xronikh_diarkeia, noumero) VALUES
('Nolan Tribute', '2024-01-01', 7, 1),
('Cameron Tribute', '2024-02-01', 5, 2);

INSERT INTO upallhlos (arithmos_tautothtas, onoma, dieuthinsh, hlikia) VALUES
('AB123456', 'Eleni Markou', 'Kozani', 25),
('AB123457', 'Giorgos Pappas', 'Kozani', 30),
('AB123458', 'Anna Dimitriou', 'Grevena', 28),
('AB123459', 'Kostas Nikolaou', 'Kastoria', 35),
('AB123460', 'Maria Antoniou', 'Florina', 24);

INSERT INTO tamies (arithmos_tautothtas, kwdikos_upallhlou) VALUES
('AB123456', 1001),
('AB123457', 1002);

INSERT INTO proswpiko_kathariothtas (arithmos_tautothtas, wrario_ergasias) VALUES
('AB123458', '08:00-14:00');

INSERT INTO taksithetes (arithmos_tautothtas, wrario_ergasias) VALUES
('AB123459', '16:00-22:00');

INSERT INTO proswpiko_asfaleias (arithmos_tautothtas, prwinh_bardia, apogeumatinh_bardia, bradinh_bardia) VALUES
('AB123460', TRUE, FALSE, TRUE);

INSERT INTO proballetai (titlos_tainias, noumero) VALUES
('Inception', 1),
('Interstellar', 2),
('Avatar', 3),
('Titanic', 2),
('Joker', 1);

INSERT INTO perilambanei (titlos_afier, titlos_tainias) VALUES
('Nolan Tribute', 'Inception'),
('Nolan Tribute', 'Interstellar'),
('Cameron Tribute', 'Avatar'),
('Cameron Tribute', 'Titanic');

INSERT INTO eisithria (kwdikos_eisithriou, meiwmeno, olokliro, thesi_1klashs, thesi_2klashs, plhthos, titlos_tainias, noumero, arithmos_tautothtas) VALUES
('T001', FALSE, TRUE, TRUE, FALSE, 1, 'Inception', 1, 'AB123456'),
('T002', TRUE, FALSE, FALSE, TRUE, 1, 'Inception', 1, 'AB123456'),
('T003', FALSE, TRUE, TRUE, FALSE, 1, 'Interstellar', 2, 'AB123457'),
('T004', FALSE, TRUE, FALSE, TRUE, 1, 'Avatar', 3, 'AB123457'),
('T005', TRUE, FALSE, FALSE, TRUE, 1, 'Titanic', 2, 'AB123456'),
('T006', FALSE, TRUE, TRUE, FALSE, 1, 'Joker', 1, 'AB123457');

INSERT INTO plhrwmh (arithmos_plhrwmhs, wra, hmeromhnia) VALUES
('P001', '18:30:00', '2024-01-10'),
('P002', '19:00:00', '2024-01-10'),
('P003', '20:15:00', '2024-01-11');

INSERT INTO metrhta (arithmos_plhrwmhs) VALUES
('P001'),
('P002');

INSERT INTO karta (arithmos_plhrwmhs, noumero_kartas, onoma_katoxou, eidos) VALUES
('P003', '1111222233334444', 'Eleni Markou', 'Visa');

INSERT INTO agorazontai (arithmos_plhrwmhs, kwdikos_eisithriou) VALUES
('P001', 'T001'),
('P001', 'T002'),
('P002', 'T003'),
('P003', 'T004');

INSERT INTO pragmatopoieitai (arithmos_tautothtas, arithmos_plhrwmhs) VALUES
('AB123456', 'P001'),
('AB123457', 'P002'),
('AB123456', 'P003');

INSERT INTO ergazontai (noumero, arithmos_tautothtas) VALUES
(1, 'AB123459');

INSERT INTO ergazetai (noumero, arithmos_tautothtas) VALUES
(2, 'AB123458');
