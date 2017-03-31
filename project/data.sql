--Data to be entered into the basketball database.
--Jahn Davis, CS342
--------------------------------------------------
--Positions for basketball players
INSERT INTO Position VALUES(1, 'PG');
INSERT INTO Position VALUES(2, 'SG');
INSERT INTO Position VALUES(3, 'SF');
INSERT INTO Position VALUES(4, 'PF');
INSERT INTO Position VALUES(5, 'C');

--Added Warriors and Cavaliers teams to database
INSERT INTO Team VALUES (1, 'Golden State Warriors', 'San Francisco', 'California', 'West');
INSERT INTO Team VALUES (2, 'Cleveland Cavaliers', 'Cleveland', 'Ohio', 'East');

--Inserting starting players from both teams into the database
INSERT INTO Player VALUES(1, 1, 'Stephen', 'Curry', 75.0, 190, 1, 30.1, 6.7, 5.4, 2.1, 0.2, .504, .454, .908, 3.3, 2.0, 34.2);
INSERT INTO Player VALUES(2, 1, 'Klay', 'Thompson', 79.0, 215, 2, 22.1, 2.1, 3.8, 0.9, 0.6, .470, .425, .850, 1.7, 1.9, 33.3);
INSERT INTO Player VALUES(3, 1, 'Harrison', 'Barnes', 80.0, 225, 3, 11.7, 1.8, 4.9, 0.6, 0.2, .466, .383, .761, 0.9, 2.1, 30.9);
INSERT INTO Player VALUES(4, 1, 'Draymond', 'Green', 79.0, 230, 4, 14.0, 7.4, 9.5, 1.5, 1.4, .490, .388, .696, 3.2, 3.0, 34.7);
INSERT INTO Player VALUES(5, 1, 'Andrew', 'Bogut', 84.0, 260, 5, 5.4, 2.3, 7.0, 0.5, 1.6, .627, 1.00, .480, 1.2, 3.2, 20.7);
INSERT INTO Player VALUES(6, 2, 'Kyrie', 'Irving', 75.0, 193, 1, 19.6, 4.7, 3.0, 1.1, 0.3, .448, .321, .885, 2.3, 2.0, 31.5);
INSERT INTO Player VALUES(7, 2, 'JR', 'Smith', 78.0, 225, 2, 12.4, 1.7, 2.8, 1.1, 0.3, .415, .400, .634, 0.8, 2.6, 30.7);
INSERT INTO Player VALUES(8, 2,'LeBron', 'James', 80.0, 250, 3, 25.3, 6.8, 7.4, 1.4, 0.6, .520, .309, .731, 3.3, 1.9, 35.6);
INSERT INTO Player VALUES(9, 2, 'Kevin', 'Love', 82.0, 251, 4, 16.0, 2.4, 9.9, 0.8, 0.5, .419, .360, .822, 1.8, 2.1, 31.5);
INSERT INTO Player VALUES(10, 2, 'Tristan', 'Thompson', 81.0, 238, 5, 7.8, 0.8, 9.0, 0.5, 0.6, .588, .000, .616, 0.7, 2.5, 27.7);

--2015-2016 season
INSERT INTO Season VALUES(1, 2015, 2016, 2, 1);

--9 games where Golden State and Cleveland faced off (regular season and NBA finals)
INSERT INTO Games VALUES(1, 2, 1, 89, 104, '06-02-2016', 1, 'San Francisco');
INSERT INTO Games VALUES(2, 2, 1, 77, 110, '06-05-2016', 1, 'San Francisco');
INSERT INTO Games VALUES(3, 1, 2, 90, 120, '06-08-2016', 2, 'Cleveland');
INSERT INTO Games VALUES(4, 1, 2, 108, 97, '06-10-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(5, 2, 1, 112, 97, '06-13-2016', 2, 'San Francisco');
INSERT INTO Games VALUES(6, 1, 2, 101, 115, '06-16-2016', 2, 'Cleveland');
INSERT INTO Games VALUES(7, 2, 1, 93, 89, '06-19-2016', 2, 'San Francisco');

--Game stats for Stephen Curry in 7 games against Cleveland in the Finals
INSERT INTO GameStats VALUES(1, 1, 1, 1, 1, 15, 4, 8, 3, 0, 0, 11, 6, 5, 0, 0, 5, 2, 36);
INSERT INTO GameStats VALUES(2, 1, 2, 1, 1, 11, 7, 8, 4, 0, 0, 18, 4, 9, 0, 1, 4, 4, 25);
INSERT INTO GameStats VALUES(3, 1, 3, 1, 1, 13, 6, 9, 3, 4, 4, 19, 3, 1, 2, 0, 6, 4, 31);
INSERT INTO GameStats VALUES(4, 1, 4, 1, 1, 25, 11, 13, 7, 10, 9, 38, 6, 5, 2, 0, 3, 3, 40);
INSERT INTO GameStats VALUES(5, 1, 5, 1, 1, 21, 8, 15, 5, 4, 4, 25, 4, 7, 0, 3, 4, 2, 40);
INSERT INTO GameStats VALUES(6, 1, 6, 1, 1, 20, 8, 13, 6, 9, 8, 30, 1, 2, 1, 0, 4, 6, 35);
INSERT INTO GameStats VALUES(7, 1, 7, 1, 1, 19, 6, 14, 4, 1, 1, 17, 2, 5, 1, 1, 4, 4, 39);

--Game stats for Klay Thompson in 7 games against Cleveland in the NBA Finals
INSERT INTO GameStats VALUES(8, 2, 1, 2, 1, 12, 4, 5, 1, 1, 0, 9, 2, 5, 0, 2, 0, 3, 24);
INSERT INTO GameStats VALUES(9, 2, 2, 2, 1, 13, 6, 8, 4, 1, 1, 17, 5, 2, 2, 0, 4, 1, 31);
INSERT INTO GameStats VALUES(10, 2, 3, 2, 1, 13, 4, 7, 1, 3, 1, 10, 1, 2, 1, 0, 2, 1, 31);
INSERT INTO GameStats VALUES(11, 2, 4, 2, 1, 14, 7, 9, 4, 7, 7, 25, 1, 4, 1, 1, 1, 2, 39);
INSERT INTO GameStats VALUES(12, 2, 5, 2, 1, 20, 11, 11, 6, 9, 9, 37, 1, 3, 0, 0, 1, 2, 41);
INSERT INTO GameStats VALUES(13, 2, 6, 2, 1, 21, 9, 10, 3, 7, 4, 25, 1, 3, 2, 1, 4, 2, 38);
INSERT INTO GameStats VALUES(14, 2, 7, 2, 1, 17, 6, 10, 2, 0, 0, 14, 2, 2, 1, 0, 3, 2, 42);

--Game stats for Harrison Barnes in 7 games against Cleveland in the NBA Finals
INSERT INTO GameStats VALUES(15, 3, 1, 3, 1, 10, 6, 2, 0, 1, 1, 13, 2, 1, 1 ,0, 0, 1, 30);
INSERT INTO GameStats VALUES(16, 3, 2, 3, 1, 7, 2, 2, 0, 2, 1, 5, 1, 5, 1, 1, 3, 0, 35);
INSERT INTO GameStats VALUES(17, 3, 3, 3, 1, 11, 7, 5, 2, 3, 2, 18, 3, 8, 0, 0, 1, 2, 33);
INSERT INTO GameStats VALUES(18, 3, 4, 3, 1, 11, 5, 5, 4, 0, 0, 14, 2, 8, 1, 0, 0, 1, 40);
INSERT INTO GameStats VALUES(19, 3, 5, 3, 1, 14, 2, 6, 1, 2, 0, 5, 1, 5, 1, 1, 0, 1, 38);
INSERT INTO GameStats VALUES(20, 3, 6, 3, 1, 8, 0, 5, 0, 2, 0, 0, 0, 2, 0, 1, 0, 2, 16);
INSERT INTO GameStats VALUES(21, 3, 7, 3, 1, 10, 3, 4, 2, 2, 2, 10, 1, 2, 1, 0, 0, 4, 29);

--Game stats for Draymond Green in 7 games against Cleveland in the NBA Finals
INSERT INTO GameStats VALUES(22, 4, 1, 4, 1, 11, 5, 6, 2, 4, 4, 16, 7, 11, 4, 1, 3, 1, 40);
INSERT INTO GameStats VALUES(23, 4, 2, 4, 1, 20, 11, 8, 5, 1, 1, 28, 5, 7, 1, 0, 1, 2, 34);
INSERT INTO GameStats VALUES(24, 4, 3, 4, 1, 8, 2, 4, 0, 4, 2, 6, 7, 7, 0, 1, 2, 4, 36);
INSERT INTO GameStats VALUES(25, 4, 4, 4, 1, 9, 2, 4, 0, 8, 5, 9, 4, 12, 2, 3, 3, 4, 42);
INSERT INTO GameStats VALUES(26, 4, 5, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO GameStats VALUES(27, 4, 6, 4, 1, 7, 3, 2, 0, 2, 2, 8, 6, 10, 1, 1, 1, 5, 41);
INSERT INTO GameStats VALUES(28, 4, 7, 4, 1, 15, 11, 8, 6, 4, 4, 32, 9, 15, 2, 0, 2, 3, 47);

--Game stats for Andrew Bogut in 7 games against Cleveland in the NBA Finals
INSERT INTO GameStats VALUES(29, 5, 1, 5, 1, 7, 5, 0, 0, 0, 0, 10, 2, 3, 0, 0, 0, 2, 15);
INSERT INTO GameStats VALUES(30, 5, 2, 5, 1, 4, 1, 0, 0, 0, 0, 2, 0, 6, 2, 5, 2, 4, 15);
INSERT INTO GameStats VALUES(31, 5, 3, 5, 1, 6, 2, 1, 0, 0, 0, 4, 0, 2, 0, 1, 1, 2, 12);
INSERT INTO GameStats VALUES(32, 5, 4, 5, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 10);
INSERT INTO GameStats VALUES(33, 5, 5, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 2, 4, 8);
INSERT INTO GameStats VALUES(34, 5, 6, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO GameStats VALUES(35, 5, 7, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

--Game stats for Kyrie Irving in 7 games against Golden State in the NBA Finals
INSERT INTO GameStats VALUES(36, 6, 1, 1, 1, 22, 7, 4, 1, 12, 11, 26, 4, 3, 3, 0, 3, 2, 38);
INSERT INTO GameStats VALUES(37, 6, 2, 1, 1, 14, 5, 3, 0, 0, 0, 10, 1, 3, 3, 0, 3, 1, 33);
INSERT INTO GameStats VALUES(38, 6, 3, 1, 1, 25, 12, 7, 3, 3, 3, 30, 8, 4, 1, 0, 2, 4, 37);
INSERT INTO GameStats VALUES(39, 6, 4, 1, 1, 28, 14, 6, 2, 5, 4, 34, 4, 4, 3, 1, 1, 2, 43);
INSERT INTO GameStats VALUES(40, 6, 5, 1, 1, 24, 17, 7, 5, 2, 2, 41, 6, 3, 2, 1, 4, 4, 40);
INSERT INTO GameStats VALUES(41, 6, 6, 1, 1, 18, 7, 5, 2, 7, 7, 23, 3, 4, 2, 2, 3, 2, 39);
INSERT INTO GameStats VALUES(42, 6, 7, 1, 1, 23, 10, 5, 2, 4, 4, 26, 1, 6, 1, 1, 2, 3, 43);

--Game stats for JR Smith in 7 games against Golden State in the NBA Finals
INSERT INTO GameStats VALUES(43, 7, 1, 2, 1, 3, 1, 3, 1, 0, 0, 3, 1, 1, 0, 1, 1, 5, 36);
INSERT INTO GameStats VALUES(44, 7, 2, 2, 1, 6, 2, 4, 1, 2, 0, 5, 2, 2, 2, 0, 1, 3, 33);
INSERT INTO GameStats VALUES(45, 7, 3, 2, 1, 13, 7, 10, 5, 2, 1, 20, 1, 4, 3, 0, 0, 1, 38);
INSERT INTO GameStats VALUES(46, 7, 4, 2, 1, 10, 3, 8, 2, 2, 2, 10, 1, 2, 0, 0, 0, 5, 43);
INSERT INTO GameStats VALUES(47, 7, 5, 2, 1, 9, 3, 2, 1, 3, 3, 10, 1, 2, 1, 0, 1, 5, 31);
INSERT INTO GameStats VALUES(48, 7, 6, 2, 1, 11, 5, 10, 4, 0, 0, 14, 3, 4, 3, 1, 0, 5, 40);
INSERT INTO GameStats VALUES(49, 7, 7, 2, 1, 13, 5, 8, 2, 0, 0, 12, 2, 4, 1, 0, 2, 3, 39);


--Game stats for LeBron James in 7 games against Golden State in the NBA Finals
INSERT INTO GameStats VALUES(50, 8, 1, 3, 1, 21, 9, 4, 2, 4, 3, 23, 9, 12, 2, 1, 4, 2, 41);
INSERT INTO GameStats VALUES(51, 8, 2, 3, 1, 17, 7, 5, 1, 4, 4, 19, 9, 8, 4, 1, 7, 3, 34);
INSERT INTO GameStats VALUES(52, 8, 3, 3, 1, 26, 14, 2, 1, 5, 3, 32, 6, 11, 1, 2, 5, 2, 40);
INSERT INTO GameStats VALUES(53, 8, 4, 3, 1, 21, 11, 5, 1, 4, 2, 25, 9, 13, 2, 3, 7, 4, 46);
INSERT INTO GameStats VALUES(54, 8, 5, 3, 1, 30, 16, 8, 4, 8, 5, 41, 7, 16, 3, 3, 2, 1, 43);
INSERT INTO GameStats VALUES(55, 8, 6, 3, 1, 27, 16, 6, 3, 8, 6, 41, 11, 8, 4, 3, 1, 3, 43);
INSERT INTO GameStats VALUES(56, 8, 7, 3, 1, 24, 9, 5, 1, 10, 8, 27, 11, 11, 2, 3, 5, 1, 47);

--Games stats for Kevin Love in 7 games against Golden State in the NBA Finals
INSERT INTO GameStats VALUES(57, 9, 1, 4, 1, 17, 7, 5, 2, 1, 1, 17, 2, 13, 1, 0, 4, 2, 37);
INSERT INTO GameStats VALUES(58, 9, 2, 4, 1, 7, 2, 4, 1, 0, 0, 5, 0, 3, 1, 0, 1, 0, 21);
INSERT INTO GameStats VALUES(59, 9, 3, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO GameStats VALUES(60, 9, 4, 4, 1, 6, 3, 2, 1, 6, 4, 11, 0, 5, 0, 1, 0, 1, 25); 
INSERT INTO GameStats VALUES(61, 9, 5, 4, 1, 5, 1, 3, 0, 0, 0, 2, 1, 3, 0, 1, 2, 4, 33);
INSERT INTO GameStats VALUES(61, 9, 6, 4, 1, 3, 1, 2, 1, 6, 4, 7, 2, 3, 0, 0, 1, 3, 12);
INSERT INTO GameStats VALUES(62, 9, 7, 4, 1, 9, 3, 3, 0, 4, 3, 9, 3, 14, 2, 0, 1, 2, 30);

--Game stats for Tristan Thompson in 7 games against Golden State in the NBA Finals
INSERT INTO GameStats VALUES(63, 10, 1, 5, 1, 11, 5, 0, 0, 0, 0, 10, 0, 12, 0, 1, 0, 3, 31);
INSERT INTO GameStats VALUES(64, 10, 2, 5, 1, 8, 3, 0, 0, 2, 2, 8, 0, 5, 1, 0, 0, 4, 19);
INSERT INTO GameStats VALUES(65, 10, 3, 5, 1, 6, 5, 0, 0, 5, 4, 14, 2, 13, 0, 0, 0, 2, 31);
INSERT INTO GameStats VALUES(66, 10, 4, 5, 1, 7, 5, 0, 0, 5, 0, 10, 0, 7, 0, 1, 0, 3, 29);
INSERT INTO GameStats VALUES(67, 10, 5, 5, 1, 3, 1, 0, 0, 10, 4, 6, 0, 15, 1, 2, 0, 1, 42);
INSERT INTO GameStats VALUES(68, 10, 6, 5, 1, 6, 6, 0, 0, 4, 3, 15, 3, 16, 0, 0, 3, 4, 43);
INSERT INTO GameStats VALUES(69, 10, 7, 5, 1, 3, 3, 0, 0, 4, 3, 9, 0, 3, 0, 2, 0, 4, 32);