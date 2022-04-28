USE airport 

-- Top Manager
CREATE USER 'TopManager'@'localhost' IDENTIFIED BY 'topmanager_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON airport.airlines TO 'TopManager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON airport.countries TO 'TopManager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON airport.cities TO 'TopManager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON airport.airports TO 'TopManager'@'localhost';
GRANT SELECT ON airport.aircrafts_airlines TO 'TopManager'@'localhost';
GRANT SELECT ON airport.city_view TO 'TopManager'@'localhost';

SHOW GRANTS FOR 'TopManager'@'localhost';

-- Change password
ALTER USER 'TopManagers'@'localhost' IDENTIFIED BY 'new_password';

-- Dispatcher
CREATE USER 'Dispatcher'@'localhost' IDENTIFIED BY 'dispatcher_password';
GRANT INSERT, UPDATE, DELETE ON airport.flights TO 'Dispatcher'@'localhost'; 
GRANT SELECT ON airport.aircrafts TO 'Dispatcher'@'localhost'; 
GRANT USAGE, SELECT ON airport.airlines TO 'Dispatcher'@'localhost'; 
GRANT SELECT ON airport.countries TO 'Dispatcher'@'localhost';
GRANT SELECT ON airport.cities TO 'Dispatcher'@'localhost';
GRANT SELECT ON airport.airports TO 'Dispatcher'@'localhost';
GRANT SELECT ON airport.aircrafts_airlines TO 'Dispatcher'@'localhost';
GRANT SELECT ON airport.city_view TO 'Dispatcher'@'localhost';

SHOW GRANTS FOR 'Dispatcher'@'localhost'; 

-- AirlineManager
CREATE USER 'AirlineManager'@'localhost' IDENTIFIED BY 'airlinemanager_password';
GRANT INSERT, UPDATE, DELETE ON airport.flights TO 'AirlineManager'@'localhost'; 
GRANT SELECT ON airport.aircrafts TO 'AirlineManager'@'localhost';
GRANT UPDATE (aircraft_model, aircraft_number), INSERT, DELETE ON airport.aircrafts TO 'AirlineManager'@'localhost';
GRANT SELECT ON airport.airlines TO 'AirlineManager'@'localhost';
GRANT SELECT ON airport.countries TO 'AirlineManager'@'localhost';
GRANT SELECT ON airport.cities TO 'AirlineManager'@'localhost';
GRANT SELECT ON airport.airports TO 'AirlineManager'@'localhost';
GRANT SELECT, UPDATE ON airport.aircrafts_airlines TO 'AirlineManager'@'localhost';
GRANT SELECT ON airport.city_view TO 'AirlineManager'@'localhost';

SHOW GRANTS FOR 'AirlineManager'@'localhost';

SELECT Host, User FROM mysql.user;
