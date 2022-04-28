use airport 

-- 1: ОДНОВРЕМЕННОЕ ЗАПОЛНЕНИЕ 2-Х ТАБЛИЦ passengers И orders
DROP PROCEDURE IF EXISTS procedure_add_passenger;

DELIMITER //
CREATE PROCEDURE procedure_add_passenger (
	doc_id BIGINT UNSIGNED,
	firstname VARCHAR(150), 
	middlename VARCHAR(150), 
	lastname VARCHAR(150), 
	birthday DATE, 
	gender ENUM('Female','Male','Not defined'),
	doc_code BIGINT UNSIGNED,
	passenger_id  BIGINT UNSIGNED,
	user_id BIGINT UNSIGNED,
	flight_id BIGINT UNSIGNED,
	payment_id BIGINT UNSIGNED, 
	phone CHAR(11),
	email VARCHAR(150),
	class enum('Econom','Business','First'),
	OUT tran_result VARCHAR(200))
BEGIN
	DECLARE tran_rollback BOOL DEFAULT 0;
	DECLARE code VARCHAR(100);
	DECLARE error_string VARCHAR(100);

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
	-- обработка ошибок 
	BEGIN
		SET tran_rollback = 1;
	
		GET STACKED DIAGNOSTICS CONDITION 1
			code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
		SET tran_result = CONCAT(code, ': ', error_string);
	END;

	START TRANSACTION; 

	INSERT INTO passengers (doc_id, firstname, middlename, lastname, birthday, gender, doc_code)
					VALUES (doc_id, firstname, middlename, lastname, birthday, gender, doc_code);

	INSERT INTO orders (user_id, flight_id, passenger_id, payment_id, phone, email, class)
				VALUES (user_id, flight_id, LAST_INSERT_ID(), payment_id, phone,  email, class);
	SELECT * FROM passengers;

	IF tran_rollback
	THEN 
		ROLLBACK;
	ELSE 
		SET tran_result = 'Ok!';
		COMMIT;
	END IF;
END//

DELIMITER ;

CALL procedure_add_passenger(1, 'Transaction2', 'TEST', 'User2', '1999-12-12', 'Male', 1784595878, 1, 4, 1, 89567895233, 'new3@mail.ru', 'First', @tran_result); 

SELECT @tran_result;


-- 2: ПОИСК ПО ФАМИЛИИ ПОЛЬЗОВАТЕЛЯ, КУПИВШЕГО БИЛЕТ/Ы НА РЕЙС/Ы
DROP PROCEDURE IF EXISTS procedure_search_lastname;
DELIMITER //
CREATE PROCEDURE procedure_search_lastname (search_lastname CHAR(50))
BEGIN
	SELECT
	CONCAT('ID:', u.id, ' ', u.firstname, ' ', u.lastname) as owner,
	CONCAT('ID:', o.flight_id, ' №', f.flight_number) AS flight,
	CONCAT('ID:', o.passenger_id, ' ', p.lastname, ' ', SUBSTR(p.firstname, 1, 1), '. ', IF(ISNULL(p.middlename), '', CONCAT(SUBSTR(p.middlename, 1, 1), '. '))) AS passenger
	FROM orders o 
		JOIN users u ON u.id = o.user_id 
		JOIN flights f ON f.id = o.flight_id 
		JOIN passengers p ON p.id = o.passenger_id 
	WHERE u.lastname = search_lastname
ORDER BY owner;
END//
DELIMITER ;

CALL procedure_search_lastname('Уваров');

-- 3: ПОИСК РЕЙСОВ ПО ГОРОДУ

DROP PROCEDURE IF EXISTS procedure_search_city;
DELIMITER //
CREATE PROCEDURE procedure_search_city (search_city CHAR(50))
BEGIN
	SELECT
	CONCAT('ID:', c.id, ' ', c.name) AS city,
	CONCAT('ID:', c2.id, ' ', c2.code, ' ', c2.name) AS country,
	CONCAT('ID:', f.id, ' №', f.flight_number) AS flight
	FROM cities c
		JOIN countries c2  ON c2.id = c.country_id  
		JOIN flights f  ON f.city_id = c.id 
	WHERE c.name = search_city
ORDER BY city;
END//
DELIMITER ;

CALL procedure_search_city('Kiev');

DROP PROCEDURE IF EXISTS procedure_insert_aircraft;
DELIMITER //
CREATE PROCEDURE procedure_insert_aircraft (
	airline_id BIGINT UNSIGNED, 
	aircraft_model VARCHAR(50), 
	aircraft_number VARCHAR(20))
BEGIN 
	INSERT INTO airport.aircrafts (airline_id, aircraft_model, aircraft_number)
	VALUES (airline_id, aircraft_model, aircraft_number);
END//
DELIMITER ;

CALL procedure_insert_aircraft (93, 'MODEL 1', 'NUMBER_TEST');

SELECT * FROM aircrafts a ;

DROP PROCEDURE IF EXISTS procedure_delete_aircraft;
DELIMITER //
CREATE PROCEDURE procedure_delete_aircraft (aircraft_id BIGINT)
BEGIN 
	DELETE FROM airport.aircrafts
	WHERE airport.aircrafts.id = aircraft_id;
END//
DELIMITER ;

CALL procedure_delete_aircraft (@aircraft_id = 77); 



