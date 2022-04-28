USE airport

CREATE OR REPLACE VIEW city_view AS
SELECT 
	c1.name AS country, 
	c1.code, 
	c2.name AS city, 
	c2.sign_gmt AS sign,
	c2.gmt AS GMT,
	a.name AS airport 
FROM countries c1
JOIN cities c2 ON c2.country_id = c1.id
JOIN airports a ON a.city_id = c2.id
ORDER BY country; 

CREATE OR REPLACE VIEW aircrafts_airlines AS
SELECT 
	a2.name AS airline,
	a.aircraft_model AS models,
	a.aircraft_number AS numbers
FROM aircrafts a 
JOIN airlines a2 ON a2.id = a.airline_id
ORDER BY airline;

CREATE OR REPLACE VIEW avg_prices AS
SELECT 
	AVG(econom_class),
	AVG(business_class),
	AVG(first_class)
FROM prices;

