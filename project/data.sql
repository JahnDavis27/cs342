--Positions for basketball players
INSERT INTO Position VALUES(1, 'PG');
INSERT INTO Position VALUES(2, 'SG');
INSERT INTO Position VALUES(3, 'SF');
INSERT INTO Position VALUES(4, 'PF');
INSERT INTO Position VALUES(5, 'C');

--Added Warriors and Cavaliers to database
INSERT INTO Team VALUES (1, 'Golden State Warriors', 'San Francisco', 'California', 'West');
INSERT INTO Team VALUES (2, 'Cleveland Cavaliers', 'Cleveland', 'Ohio', 'East');

--Three players into the database
INSERT INTO Player VALUES(1, 1, 'Stephen', 'Curry', 75.0, 190, 1, 30.1, 6.7, 5.4, 2.1, 0.2, .504, .454, .908, 3.3, 2.0, 34.2);
INSERT INTO Player VALUES(2, 2,'LeBron', 'James', 80.0, 250, 3, 25.3, 6.8, 7.4, 1.4, 0.6, .520, .309, .731, 3.3, 1.9, 35.6);
INSERT INTO Player VALUES(3, 2, 'Kyrie', 'Irving', 75.0, 193, 1, 19.6, 4.7, 3.0, 1.1, 0.3, .448, .321, .885, 2.3, 2.0, 31.5);

--2015-2016 season
INSERT INTO Season VALUES(1, 2015, 2016, 2, 1);

--4 games where Golden State and Cleveland faced off
INSERT INTO Games VALUES(1, 1, 2, 89, 83, '12-25-2015', 1, 'San Francisco');
INSERT INTO Games VALUES(2, 2, 1, 98, 132, '01-18-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(3, 2, 1, 89, 104, '06-02-2016', 1, 'San Francisco');
INSERT INTO Games VALUES(4, 2, 1, 77, 110, '06-05-2016', 1, 'San Francisco');

--Game stats for Stephen Curry in 4 games against Cleveland
INSERT INTO GameStats VALUES(1, 1, 1, 1, 1, 15, 6, 4, 1, 6, 6, 19, 7, 7, 2, 0, 3, 3, 37);
INSERT INTO GameStats VALUES(2, 1, 2, 1, 1, 18, 12, 12, 7, 4, 4, 35, 4, 5, 3, 0, 3, 1, 28);
INSERT INTO GameStats VALUES(3, 1, 3, 1, 1, 15, 4, 8, 3, 0, 0, 11, 6, 5, 0, 0, 5, 2, 36);
INSERT INTO GameStats VALUES(4, 1, 4, 1, 1, 11, 7, 8, 4, 0, 0, 18, 4, 9, 0, 1, 4, 4, 25);

--Game stats for LeBron James in 4 games against Golden State
INSERT INTO GameStats VALUES(5, 2, 1, 3, 1, 26, 10, 5, 1, 9, 4, 25, 2, 9, 1, 2, 4, 0, 39);
INSERT INTO GameStats VALUES(6, 2, 2, 3, 1, 16, 7, 3, 0, 2, 2, 16, 5, 5, 1, 1, 3, 1, 33);
INSERT INTO GameStats VALUES(7, 2, 3, 3, 1, 21, 9, 4, 2, 4, 3, 23, 9, 12, 2, 1, 4, 2, 41);
INSERT INTO GameStats VALUES(8, 2, 4, 3, 1, 17, 7, 5, 1, 4, 4, 19, 9, 8, 4, 1, 7, 3, 34);

--Game stats for Kyrie Irving in 4 games against Golden State
INSERT INTO GameStats VALUES(9, 3, 1, 1, 1, 15, 4, 6, 0, 5, 5, 13, 2, 3, 1, 0, 2, 1, 26);
INSERT INTO GameStats VALUES(10, 3, 2, 1, 1, 11, 3, 3, 1, 1, 1, 8, 3, 5, 0, 0, 2, 0, 23);
INSERT INTO GameStats VALUES(11, 3, 3, 1, 1, 22, 7, 4, 1, 12, 11, 26, 4, 3, 3, 0, 3, 2, 38);
INSERT INTO GameStats VALUES(12, 3, 4, 1, 1, 14, 5, 3, 0, 0, 0, 10, 1, 3, 3, 0, 3, 1, 33);
