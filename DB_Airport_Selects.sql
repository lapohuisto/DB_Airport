USE airport

-- Countries, cities & airports list
SELECT c1.name AS country, c1.code, c2.name AS city, a.name AS airport 
FROM countries c1
JOIN cities c2 ON c2.country_id = c1.id
JOIN airports a ON a.city_id = c2.id
ORDER BY country; 

-- TABLO: Incoming flights
SELECT 
	flight_number, 
	(SELECT name FROM airlines a WHERE a.id = airline_id) AS airline,  
	(SELECT aircraft_model FROM aircrafts a2 WHERE a2.id = aircraft_id) AS aircraft, 
	(SELECT aircraft_number FROM aircrafts a2 WHERE a2.id = aircraft_id) AS aircraft_number, 
	(SELECT name FROM airports a3 WHERE a3.id = airport_id) as airport, 
	c.name as city,
	scheduled_datetime_arrival AS `start`, 
	estimated_datetime_arrival AS arrival
FROM flights 
JOIN cities c ON c.id = flights.airport_id AND flight_type = 'Incoming'
ORDER BY scheduled_datetime_arrival;

-- Tickets 
/*
 * Если middlename IS NULL, то всё поле name принимает занчение NULL. На CASE ругается.
 */
SELECT 
	f.flight_number, 
	o.class,
	a.name AS airport, 
	scheduled_datetime_start AS `start`,
	(SELECT code FROM countries c2 WHERE c2.id = c.id) AS country,
	c.name AS city,
	scheduled_datetime_arrival AS arrival,
	(SELECT  CONCAT(lastname, ' ', SUBSTR(firstname, 1, 1), '. ', 
		IF(ISNULL(middlename), '', CONCAT(SUBSTR(middlename, 1, 1), '. ')))
		FROM passengers p WHERE p.id = o.passenger_id) AS name,
	f.sector,
	f.reception,
	CONVERT(f.registration, TIME) AS registration,
	CONVERT(f.boarding, TIME) AS boarding,  
	f.boarding_sector 
FROM flights f 
JOIN cities c ON c.id = f.city_id AND f.flight_type = 'Outgoing'
JOIN airports a ON a.id = f.airport_id AND scheduled_datetime_start > '2022-04-01' AND scheduled_datetime_start < '2022-06-01'
JOIN orders o ON o.flight_id = f.id
ORDER BY `start`;


-- Количество входящих рейсов в каждый день недели
SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(scheduled_datetime_arrival, 6, 10))) AS `day`,
    COUNT(*) AS Incoming
FROM flights f 
WHERE f.flight_type = 'Incoming'
GROUP BY `day` ORDER BY Incoming DESC;

-- Количество исходящих рейсов в каждый день недели
SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(scheduled_datetime_start, 6, 10))) AS `day`,
    COUNT(*) AS Outgoing
FROM flights f 
WHERE f.flight_type = 'Outgoing'
GROUP BY `day` ORDER BY Outgoing DESC;

SELECT flight_id, flight_number, econom_class AS MAX_econom_class 
FROM prices WHERE econom_class = (SELECT MAX(econom_class) FROM prices);

SELECT flight_id, flight_number, business_class AS MIN_business_class 
FROM prices WHERE business_class = (SELECT MIN(business_class) FROM prices)

-- Подсчёт проданных билетов и их стоимости за определённый промежуток времени
SELECT 
	f.id AS flight_id,
	COUNT(o.flight_id) AS all_order,
	IF(o.class = 'First' AND o.flight_id = p.flight_id , COUNT(o.flight_id) * p.first_class, NULL) AS first_class_,
	IF(o.class = 'Business' AND o.flight_id = p.flight_id , COUNT(o.flight_id) * p.business_class, NULL) AS business_class,
	IF(o.class = 'Econom' AND o.flight_id = p.flight_id , COUNT(o.flight_id) * p.econom_class, NULL) AS econom_class 
FROM flights f
JOIN orders o ON f.id = o.flight_id AND o.created_at < '2022-05-01' AND o.created_at > '2022-03-01'
JOIN prices p ON p.flight_id = o.flight_id 
GROUP BY flight_id;