USE airport

INSERT INTO countries (name, code) VALUES 
('Russia', 'RU'), ('Ukraine', 'UA'), ('Belarus', 'BY'), ('Uzbekistan','UZ'), ('Kazakhstan','KZ'),
('Japan', 'JP'), ('USA', 'US'), ('Canada', 'CA'), ('United Kingdom', 'GB'), ('France', 'FR');
	
INSERT INTO countries (name) VALUES 
('Russia'), ('Ukraine'), ('Belarus'), ('Uzbekistan'), ('Kazakhstan'),
('Japan'), ('USA'), ('Canada'), ('United Kingdom'), ('France');

INSERT INTO cities (country_id, name, gmt, sign_gmt) VALUES 
(1, 'Moscow', '03:00:00', '+'), (2, 'Kiev', '03:00:00', '+'), (3, 'Minsk', '03:00:00', '+'), 
(4, 'Tashkent', '05:00:00', '+'), (5, 'Nur-Sultan', '06:00:00', '+'), (6, 'Tokyo', '09:00:00', '+'), 
(7, 'Washington', '05:00:00', '-'), (8, 'Ottawa', '05:00:00', '-'), (9, 'London', '00:00:00', '+'), 
(10, 'Paris', '01:00:00', '+');
	
INSERT INTO airports (city_id, name) VALUES 
(1, 'Sheremetyevo'), (2, 'Zhulyany'), (3, 'Minsk International 1'), (4, 'Islam Karimov Tashkent International'), 
(5, 'Nursultan'), (6, 'Haneda'), (7, 'Bolling AFB'), (8, 'Rockcliffe'), (9, 'London City'), (10, 'Orly');

INSERT INTO airlines (name, phone, adress) VALUES 
('Azur Air', NULL, NULL), ('flydubai', 89286331730, NULL), ('NordStar', 88792233051, 'Airport complex'),
('Nordwind Airlines', 84954887777, NULL), ('Pegasus Airlines', NULL, NULL), ('Ural Airlines', 87933338811, NULL), 
('Red Wings', 88003509977, 'Airport complex'), ('Smartavia', 88002000055, NULL), 
('Turkish Airlines', 83832410200, 'Novosibirsk, Michurina str., 17'), ('S7 Airlines', NULL, NULL),
('Uzbekistan Airways', 88793363636, 'Pyatigorsk, ul. Kraynogo, 49, office 314'),
('Azerbaijan Airlines', 88792233090, 'Airport complex, 2nd floor, AZAL office'),
('Azimuth', NULL, NULL), ('Armenia', NULL, NULL), ('Icarus', NULL, NULL), 
('Aeroflot', 88792258920, 'Airport complex, 2nd floor'),('Izhavia', 73412630609, NULL),
('Victory', NULL, NULL), ('Russia', 83832169899, 'Tolmachevo Airport, Sector A, 3rd floor'),
('RusLine', 83726681009, NULL), ('Severstal', 88202530900, NULL), 
('UTair', 88792233052, 'Airport complex, office 206'), ('Yamal', NULL, NULL);

INSERT INTO aircrafts (airline_id, aircraft_model, aircraft_number) VALUES 
(93, 'Boeing 777-300ER', 'AA-B777-300ER'), (94, 'Boeing 737 MAX', 'FD-B737-M'), (95, 'Boeing 737-800', 'NS-B737-800'),
(96, 'Boeing 777-200ER', 'NA-B777-200ER'), (97, 'Boeing 737-800', 'PA-B737-800'), (98, 'Airbus А321', 'UA-A321'), 
(99, 'Airbus A321', 'RW-A321'), (100, 'Airbus А320 NEO', 'SA-А320-NEO'), (101, 'Boeing 787-9 Dreamliner', 'TA-B787-9-D'), 
(102, 'Embraer 170', 'S7-E170'), (102, 'Airbus A321nx', 'S7-A321NX'), (102, 'Boeing 737-800', 'S7-B737-800'),
(93, 'Boeing 767-300', 'AA-B767-300'), (93, 'Boeing 757-200', 'AA-B757-200'),
(93, 'Boeing 737-900ER', 'AA-B737-900ER'), (93, 'Boeing 737-800', 'AA-B737-800'), (94, ' Boeing 737-800', 'FD-B737-800'),
(95, 'Boeing 737-300', 'NS-B737-300'), (96, 'Boeing 777-300ER', 'NA-B777-300ER'), (96, 'Airbus A330-200', 'NA-A330-200'),
(96, 'Airbus A330-300', 'NA-A330-300'), (96, 'Airbus A321', 'NA-A321'), (96, 'Airbus A321 NEO', 'NA-A321-NEO'),
(96, 'Boeing 737-800', 'NA-B737-800'), (97, 'Airbus A321 NEO', 'PA-A321-200-NEO'), (97, 'Airbus A320 NEO', 'PA-A320-NEO'),
(97, 'Airbus A320 CEO', 'PA-A320-200-CEO'), (98, 'Airbus А320', 'UA-A320'), (98, 'Airbus А319', 'UA-A319'), 
(98, 'Airbus A320 NEO', 'PA-A320-NEO'), (98, 'Airbus A321 NEO', 'PA-A321-NEO'), (99, 'Sukhoi SuperJet', 'RW-SSJ100'),
(99, 'Boeing 777-200ER', 'RW-B777-200ER'), (100, 'Boeing 737-800', 'SA-B737-800'), (100, 'Boeing 737-700', 'SA-B737-700'),
(101, 'Airbus A319-132/100', 'TA-A319-132/100'), (101, 'Boeing 737 MAX 9', 'TA-B737-MAX-9'), 
(101, 'Boeing 737 MAX 8', 'TA-B737-MAX-8');

INSERT INTO flights VALUES 
(1, 'S7 2166', 'Outgoing', 102, 48, 1, 4, '2022-04-17 13:05:00', '2022-04-17 13:15:00', '05:20:00', '2022-04-17 18:25:00', '2022-04-17 18:30:00', 'A', 6, '2022-04-17 10:47:00', '2022-04-17 12:25:00', 1),
(2, 'U6 206', 'Incoming', 98, 44, 2, 3, '2022-04-17 18:30:00', '2022-04-17 18:55:00', NULL, '2022-04-18 01:35:00', '2022-04-18 01:36:00', 'A', NULL, '2022-04-17 16:30:00', '2022-04-17 17:50:00', 2),
(3, 'FZ 977', 'Incoming', 94, 40, 9, 5, NULL, NULL, NULL, '2022-04-18 02:30:00', '2022-04-18 02:23:00', 'B', NULL, NULL, NULL, NULL),
(4, 'NS 1526', 'Outgoing', 95, 41, 8, 2, '2022-04-18 23:05:00', '2022-04-18 22:45:00', '04:20:00', '2022-04-19 03:25:00', '2022-04-19 03:30:00', 'B', 14, '2022-04-17 20:45:00', '2022-04-17 22:20:00', 6),
(5, 'WZ 1133', 'Incoming', 99, 45, 7, 1, NULL, NULL, NULL, '2022-04-19 09:35:00', '2022-04-19 09:32:00', 'A', NULL, NULL, NULL, NULL),
(6, 'PA 0205', 'Outgoing', 97, 43, 5, 10, '2022-04-20 23:05:00', '2022-04-20 23:15:00', '05:20:00', '2022-04-21 04:25:00', '2022-04-21 03:05:00', 'A', 16, '2022-04-20 20:37:00', '2022-04-20 22:35:00', 4),
(7, 'N4 163', 'Incoming', 96, 42, 6, 8, NULL, NULL, NULL, '2022-04-20 12:30:00', '2022-04-20 11:47:00', 'A', NULL, NULL, NULL, NULL),
(8, 'A3 3736', 'Incoming', 93, 39, 3, 6, NULL, NULL, NULL, '2022-04-21 10:25:00', '2022-04-21 09:55:00', 'A', NULL, NULL, NULL, NULL),
(9, 'SA 4647', 'Outgoing', 100, 46, 4, 9, '2022-04-22 05:05:00', '2022-04-22 05:00:00', '04:30:00', '2022-04-22 09:35:00', '2022-04-22 08:46:00', 'A', 11, '2022-04-22 03:36:00', '2022-04-22 04:25:00', 3),
(10, 'TA 7778', 'Outgoing', 101, 47, 10, 7, '2022-04-17 13:05:00', '2022-04-17 13:15:00', '05:20:00', '2022-04-17 18:25:00', '2022-04-17 18:30:00', 'A', 12, '2022-04-17 10:47:00', '2022-04-17 12:25:00', 5);


INSERT INTO prices VALUES 
(DEFAULT, 1, 'S7 2166', 7458.00, 11687.00, 26458.00), (DEFAULT, 2, 'U6 206', 6872.00, 9587.00, 18365.00), 
(DEFAULT, 3, 'FZ 977', 3659.00, 6578.00, 12459.00), (DEFAULT, 4, 'NS 1526', 5950.00, 11590.00, 24590.00),
(DEFAULT, 5, 'WZ 1133', 5650.00, 10800.00, 21500.00), (DEFAULT, 6, 'PA 0205', 7950.00, 14900.00, 30100.00),
(DEFAULT, 7, 'N4 163', 8010.00, 16790.00, 35300.00), (DEFAULT, 8, 'A3 3736', 4230.00, 9550.00, 19900.00),
(DEFAULT, 9, 'SA 4647', 10900.00, 22100.00, 46700.00), (DEFAULT, 10, 'TA 7778', 12500, 27900.00, 45300.00);

INSERT INTO events VALUES 
(1, 'По расписанию'), (2, 'Регистрация'),  (3, 'Идёт посадка'), (4, 'Посадка завершена'), 
(5, 'Вылетел'), (6, 'По расписанию'),  (7, 'Рейс прибыл')? (8, 'Рейс задерживается'), 
(9, 'Рейс отменён'),  (10, 'Вылет задерживается');


INSERT INTO payments VALUES 
(DEFAULT, 'Оплата картой', 00.00), (DEFAULT, 'Оплата наличными', 00.00), (DEFAULT, 'Оплата через СБП', 00.00), 
(DEFAULT, 'Оплата через PayPal', 00.05), (DEFAULT, 'Оплата наложным платежом', 00.15); 

INSERT INTO docs VALUES 
(DEFAULT, 'Паспорт гражданина РФ', '10 цифр, серия и номер без пробелов'), (DEFAULT, 'Заграничный паспорт', '11 цифр');

INSERT INTO users (lastname, firstname, middlename, email, phone) VALUES 
('Уваров', 'Тимур', 'Германнович', 'uvarov@ya.ru', 89199254781), ('Фокин', 'Ибрагил', 'Христофорович', 'fokin@mail.ru', 89506854545),
('Лукин', 'Аскольд', 'Михаилович', 'lukin@gmail.com', 89520689712), ('Ларионова', 'Милиса', 'Робертовна', 'milisalar@gmail.com', 89521789712),
('Хохлов', 'Болеслав', 'Константинович', 'hohlov@yandex.ru', 89523678459), ('Александрова', 'Полианна', 'Платоновна', 'polianna@mail.ru', 89545851235),
('Козлова', 'Эля', 'Викторовна', 'kozlova@mail.ru', 89567845215), ('Трофимова', 'Индира', 'Михайловна', 'trofimova@ya.ru', 89547863215),
('Дьячкова', 'Альбина', 'Владленовна', 'albinad@mail.ru', 89567887215), ('Аксёнова', 'Кара', 'Николаевна', 'kara@yandex.ru', 89561237851);

INSERT INTO passengers VALUES 
(DEFAULT, 2, 'Исмаил', 'Абрамович', 'Лукин', '2009-04-30', 'Male', 11547859991),
(DEFAULT, 2, 'Исаак', 'Улебович', 'Кулаков', '1989-12-25', 'Male', 98547859541),
(DEFAULT, 2, 'Татьяна', 'Парфеньевна', 'Павлова', '2000-01-23', 'Female', 12581236545),
(DEFAULT, 2, 'Кира', NULL, 'Калинина', '2002-02-13', 'Female', 12243336548),
(DEFAULT, 1, 'Гордий', 'Донатович', 'Блинов', '2005-09-22', 'Male', 5554383674),
(DEFAULT, 1, 'Донат', NULL, 'Емельянов', '1996-07-15', 'Male', 1882523653),
(DEFAULT, 1, 'Тимур', 'Германнович', 'Уваров', '1980-10-05', 'Male', 9854123654), 
(DEFAULT, 2, 'Аскольд', 'Михаилович', 'Лукин', '1956-12-31', 'Male', 95631159753),
(DEFAULT, 2, 'Болеслав', 'Константинович','Хохлов', '1993-04-05', 'Male', 78954632574),
(DEFAULT, 1, 'Эля', 'Викторовна', 'Козлова', '2000-11-28', 'Female', 7895456125),
(DEFAULT, 2, 'Альбина', 'Владленовна', 'Дьячкова', '2001-10-30', 'Female', 78942598712),
(DEFAULT, 1, 'Ибрагил', 'Христофорович', 'Фокин', '1974-05-06', 'Male', 7896125423),
(DEFAULT, 1, 'Милиса', 'Робертовна', 'Ларионова', '1999-07-10', 'Female', 4562879456),
(DEFAULT, 2, 'Полианна', 'Платоновна', 'Александрова', '1983-08-15', 'Female', 48456523691),
(DEFAULT, 1, 'Индира', 'Михайловна', 'Трофимова', '1997-02-28', 'Female', 1235478951),
(DEFAULT, 2, 'Кара', 'Николаевна', 'Аксёнова', '1982-06-27', 'Female', 14785236954);

INSERT INTO orders (user_id, passenger_id, payment_id, phone, email, flight_id, class) VALUES 
(1, 21, 1, 89199254781, 'uvarov@ya.ru', 1, 'Econom'), (3, 22, 2, 89520689712, 'lukin@gmail.com', 3, 'First'),
(4, 23, 1, 89521789712, 'milisalar@gmail.com', 4, 'First'), (6, 24, 5, 89545851235, 'polianna@mail.ru', 6, 'Business'),
(1, 25, 1, 89199254781, 'uvarov@ya.ru', 1, 'Econom'), (3, 26, 2, 89520689712, 'lukin@gmail.com', 3, 'First'),
(1, 11, 1, 89199254781, 'uvarov@ya.ru', 1, 'Econom'), (2, 16, 4, 89506854545, 'fokin@mail.ru', 2, 'Business'), 
(3, 12, 2, 89520689712, 'lukin@gmail.com', 3, 'First'), (4, 17, 1, 89521789712, 'milisalar@gmail.com', 4, 'First'), 
(5, 13, 3, 89523678459, 'hohlov@yandex.ru', 5, 'Econom'), (6, 18, 5, 89545851235, 'polianna@mail.ru', 6, 'Business'),
(7, 14, 3, 89567845215, 'kozlova@mail.ru', 7, 'Econom'), (8, 19, 4, 89547863215, 'trofimova@ya.ru', 8, 'First'), 
(9, 15, 1, 89567887215, 'albinad@mail.ru', 9, 'First'), (10, 20, 1, 89561237851, 'kara@yandex.ru', 10, 'Business');

select * FROM passengers p ;