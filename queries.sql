USE cinema_db;

-- =====================================================
-- 1. Total tickets sold per movie
-- =====================================================
SELECT 
    titlos_tainias,
    COUNT(*) AS total_tickets
FROM eisithria
GROUP BY titlos_tainias
ORDER BY total_tickets DESC;

-- =====================================================
-- 2. Total tickets sold per cinema hall
-- =====================================================
SELECT 
    noumero AS hall_number,
    COUNT(*) AS total_tickets
FROM eisithria
GROUP BY noumero
ORDER BY total_tickets DESC;

-- =====================================================
-- 3. Movies projected in each cinema hall
-- =====================================================
SELECT 
    p.noumero AS hall_number,
    p.titlos_tainias AS movie_title,
    p.xronikh_diarkeia AS duration_minutes
FROM proballetai p
ORDER BY p.noumero, p.titlos_tainias;

-- =====================================================
-- 4. Full ticket information
-- =====================================================
SELECT 
    e.kwdikos_eisithriou AS ticket_id,
    e.titlos_tainias AS movie_title,
    e.noumero AS hall_number,
    e.meiwmeno AS reduced_ticket,
    e.olokliro AS full_ticket,
    e.thesi_1klashs AS first_class_seat,
    e.thesi_2klashs AS second_class_seat,
    e.arithmos_tautothtas AS cashier_id
FROM eisithria e
ORDER BY e.kwdikos_eisithriou;

-- =====================================================
-- 5. Payments handled by each cashier
-- =====================================================
SELECT 
    u.onoma AS cashier_name,
    pr.arithmos_tautothtas AS cashier_id,
    COUNT(pr.arithmos_plhrwmhs) AS total_payments
FROM pragmatopoieitai pr
JOIN upallhlos u 
    ON pr.arithmos_tautothtas = u.arithmos_tautothtas
GROUP BY u.onoma, pr.arithmos_tautothtas
ORDER BY total_payments DESC;

-- =====================================================
-- 6. Movies by distribution company
-- =====================================================
SELECT 
    t.titlos_tainias AS movie_title,
    t.skinotheths AS director,
    ed.onoma AS distribution_company
FROM tainies t
JOIN etairia_dianomhs ed
    ON t.AFM = ed.AFM
ORDER BY ed.onoma, t.titlos_tainias;

-- =====================================================
-- 7. Employees by role: Cashiers
-- =====================================================
SELECT 
    u.arithmos_tautothtas AS employee_id,
    u.onoma AS employee_name,
    u.dieuthinsh AS address,
    u.hlikia AS age,
    t.kwdikos_upallhlou AS cashier_code
FROM upallhlos u
JOIN tamies t
    ON u.arithmos_tautothtas = t.arithmos_tautothtas;

-- =====================================================
-- 8. Employees working in halls
-- =====================================================
SELECT 
    a.noumero AS hall_number,
    u.onoma AS employee_name,
    'Usher' AS role
FROM ergazontai e
JOIN aithouses a 
    ON e.noumero = a.noumero
JOIN upallhlos u 
    ON e.arithmos_tautothtas = u.arithmos_tautothtas

UNION

SELECT 
    a.noumero AS hall_number,
    u.onoma AS employee_name,
    'Cleaning Staff' AS role
FROM ergazetai e
JOIN aithouses a 
    ON e.noumero = a.noumero
JOIN upallhlos u 
    ON e.arithmos_tautothtas = u.arithmos_tautothtas
ORDER BY hall_number;

-- =====================================================
-- 9. Tributes and their movies
-- =====================================================
SELECT 
    af.titlos_afier AS tribute_title,
    af.hmerominia_enarkshs AS start_date,
    p.titlos_tainias AS movie_title
FROM afierwmata af
JOIN perilambanei p
    ON af.titlos_afier = p.titlos_afier
ORDER BY af.titlos_afier, p.titlos_tainias;

-- =====================================================
-- 10. Payment method summary
-- =====================================================
SELECT 
    'Cash' AS payment_method,
    COUNT(*) AS total_payments
FROM metrhta

UNION

SELECT 
    'Card' AS payment_method,
    COUNT(*) AS total_payments
FROM karta;

-- =====================================================
-- 11. Total number of tickets sold
-- =====================================================
SELECT 
    COUNT(*) AS total_tickets_sold
FROM eisithria;

-- =====================================================
-- 12. Movies longer than 150 minutes
-- =====================================================
SELECT 
    titlos_tainias AS movie_title,
    xronikh_diarkeia AS duration_minutes
FROM proballetai
WHERE xronikh_diarkeia > 150
ORDER BY xronikh_diarkeia DESC;