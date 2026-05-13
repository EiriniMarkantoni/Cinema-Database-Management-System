USE cinema_db;

-- =====================================================
-- 1. Total tickets sold per movie
-- Uses agorazontai because sold tickets are the tickets that appear in a purchase.
-- =====================================================
SELECT 
    e.titlos_tainias AS movie_title,
    COUNT(a.kwdikos_eisithriou) AS total_tickets_sold
FROM agorazontai a
JOIN eisithria e
    ON a.kwdikos_eisithriou = e.kwdikos_eisithriou
GROUP BY e.titlos_tainias
ORDER BY total_tickets_sold DESC;

-- =====================================================
-- 2. Total tickets sold per cinema hall
-- =====================================================
SELECT 
    e.noumero AS hall_number,
    COUNT(a.kwdikos_eisithriou) AS total_tickets_sold
FROM agorazontai a
JOIN eisithria e
    ON a.kwdikos_eisithriou = e.kwdikos_eisithriou
GROUP BY e.noumero
ORDER BY total_tickets_sold DESC;

-- =====================================================
-- 3. Movies projected in each cinema hall
-- =====================================================
SELECT 
    p.noumero AS hall_number,
    p.titlos_tainias AS movie_title,
    t.xronikh_diarkeia AS duration_minutes
FROM proballetai p
JOIN tainies t
    ON p.titlos_tainias = t.titlos_tainias
ORDER BY p.noumero, p.titlos_tainias;

-- =====================================================
-- 4. Full ticket information with cashier name
-- =====================================================
SELECT 
    e.kwdikos_eisithriou AS ticket_id,
    e.titlos_tainias AS movie_title,
    e.noumero AS hall_number,
    e.meiwmeno AS reduced_ticket,
    e.olokliro AS full_ticket,
    e.thesi_1klashs AS first_class_seat,
    e.thesi_2klashs AS second_class_seat,
    e.arithmos_tautothtas AS cashier_id,
    u.onoma AS cashier_name
FROM eisithria e
LEFT JOIN upallhlos u
    ON e.arithmos_tautothtas = u.arithmos_tautothtas
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
    eg.noumero AS hall_number,
    u.onoma AS employee_name,
    'Usher' AS role
FROM ergazontai eg
JOIN upallhlos u 
    ON eg.arithmos_tautothtas = u.arithmos_tautothtas

UNION

SELECT 
    ek.noumero AS hall_number,
    u.onoma AS employee_name,
    'Cleaning Staff' AS role
FROM ergazetai ek
JOIN upallhlos u 
    ON ek.arithmos_tautothtas = u.arithmos_tautothtas
ORDER BY hall_number, employee_name;

-- =====================================================
-- 9. Tributes and their movies
-- =====================================================
SELECT 
    af.titlos_afier AS tribute_title,
    af.hmerominia_enarkshs AS start_date,
    af.noumero AS hall_number,
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

UNION ALL

SELECT 
    'Card' AS payment_method,
    COUNT(*) AS total_payments
FROM karta;

-- =====================================================
-- 11. Total number of sold tickets
-- =====================================================
SELECT 
    COUNT(*) AS total_tickets_sold
FROM agorazontai;

-- =====================================================
-- 12. Movies longer than 150 minutes
-- =====================================================
SELECT 
    titlos_tainias AS movie_title,
    xronikh_diarkeia AS duration_minutes
FROM tainies
WHERE xronikh_diarkeia > 150
ORDER BY xronikh_diarkeia DESC;
