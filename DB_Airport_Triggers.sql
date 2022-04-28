USE airport

-- 1: ПРОВЕРКА doc_code ДОКУМЕНТА В ЗАВИСИМОСТИ ОТ ЕГО doc_id
DROP TRIGGER IF EXISTS check_doc_code_passengers_insert;
DELIMITER //
CREATE TRIGGER check_doc_code_passengers_insert BEFORE INSERT ON passengers
FOR EACH ROW 
BEGIN 
	-- проверка для паспорта РФ
	IF (NEW.doc_id = 1) AND (LENGTH(NEW.doc_code) != 10) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The id = 1 document code contains only 10 characters.'; 
	END IF;
	-- проверка для заграна
	IF (NEW.doc_id = 2) AND (LENGTH(NEW.doc_code) != 11) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The id = 2 document code contains only 11 characters.';
	END IF;
END//
DELIMITER ;

DROP TRIGGER IF EXISTS check_doc_code_passengers_update;
DELIMITER //
CREATE TRIGGER check_doc_code_passengers_update BEFORE UPDATE ON passengers
FOR EACH ROW 
BEGIN 
	-- проверка для паспорта РФ
	IF (NEW.doc_id = 1) AND (LENGTH(NEW.doc_code) != 10) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The id = 1 document code contains only 10 characters.'; 
	END IF;
	-- проверка для заграна
	IF (NEW.doc_id = 2) AND (LENGTH(NEW.doc_code) != 11) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The id = 2 document code contains only 11 characters.';
	END IF;
END//
DELIMITER ;
	

-- 2: ПРОВЕРКА ДАТЫ РОЖДЕНИЯ passengers
DROP TRIGGER IF EXISTS check_birthd_before_insert;

DELIMITER \\

CREATE TRIGGER check_birthd_before_insert BEFORE INSERT ON passengers 
FOR EACH ROW 
BEGIN 
	IF NEW.birthday >= NOW() THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update Canceled. Birthday must be in the past!';
	END IF;
END\\

DELIMITER ;

DROP TRIGGER IF EXISTS check_birthd_before_update;

DELIMITER \\

CREATE TRIGGER check_birthd_before_update BEFORE UPDATE ON passengers 
FOR EACH ROW 
BEGIN 
	IF NEW.birthday >= NOW() THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update Canceled. Birthday must be in the past!';
	END IF;
END\\

DELIMITER ;

-- 3: ПРОВЕРКА НА ЗАПОЛНЕНИЕ СТОЛБЦОВ phone И email (ОДНОГО И/ИЛИ ОБОИХ) ТАБЛИЦЫ users 
DROP TRIGGER IF EXISTS check_user_contacts_insert;
DELIMITER //
CREATE TRIGGER check_user_contacts_insert BEFORE INSERT ON users
FOR EACH ROW 
BEGIN 
	IF(NEW.phone IS NULL) OR (NEW.email IS NULL) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: The phone and email are NULL. Pleace, fill in one or both.';
	END IF;
END//
DELIMITER ;

DROP TRIGGER IF EXISTS  check_user_contacts_update;
DELIMITER //
CREATE TRIGGER check_user_contacts_update BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
  	IF(NEW.phone IS NULL) AND (NEW.email IS NULL) THEN 
  		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: The phone and email are NULL. Pleace, fill in one or both.';
  	END IF;
END//
DELIMITER ;

-- 4: ПРИ УДАЛЕНИИ СТРАНЫ АВТОМАТИЧЕСКИ УДАЛЯТСЯ ИЗ ДРУГОЙ ТАБЛИЦЫ ВСЕ ГОРОДА, ПРИНАДЛЕЖАЩИЕ ЭТОЙ СТРАНЕ.
DELIMITER //
DROP TRIGGER IF EXISTS delete_cities//
CREATE TRIGGER delete_cities BEFORE DELETE ON countries
FOR EACH ROW BEGIN
  DELETE FROM cities WHERE country_id = OLD.id;
END//
DELIMITER ;

-- 5: АВТОМАТИЧЕСКИЙ РАСЧЁТ duration
DROP TRIGGER IF EXISTS flight_duration;
DELIMITER //
CREATE TRIGGER flight_duration BEFORE INSERT ON flights
FOR EACH ROW 
BEGIN 
	IF (NEW.scheduled_datetime_start IS NOT NULL) AND (NEW.scheduled_datetime_arrival IS NOT NULL) 
	THEN
		SET NEW.duration = TIMEDIFF(NEW.scheduled_datetime_arrival, NEW.scheduled_datetime_start);
	END IF;
END//

DELIMITER ;
