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
INSERT INTO Team VALUES (1, 'Golden State Warriors', 'San Francisco', 'California', 'West', 73, 9);
INSERT INTO Team VALUES (2, 'Cleveland Cavaliers', 'Cleveland', 'Ohio', 'East', 57, 25);
INSERT INTO Team VALUES (3, 'San Antonio Spurs', 'San Antonio', 'Texas', 'West', 67, 15);
INSERT INTO Team VALUES (4, 'Atlanta Hawks', 'Atlanta', 'Georgia', 'East', 48, 34);
INSERT INTO Team VALUES (5, 'Oklahoma City Thunder', 'Oklahoma City', 'Oklahoma', 'West', 55, 27);
INSERT INTO Team VALUES (6, 'Toronto Raptors', 'Toronto', 'Canada', 'East', 56, 26);
INSERT INTO Team VALUES (7, 'Houston Rockets', 'Houston', 'Texas', 'West', 41, 41);
INSERT INTO Team VALUES (8, 'Portland Trailblazers', 'Portland', 'Oregon', 'West', 44, 38);
INSERT INTO Team VALUES (9, 'Boston Celtics', 'Boston', 'Massachusetts', 'East', 48, 34);
INSERT INTO Team VALUES (10, 'Charlotte Hornets', 'Charlotte', 'North Carolina', 'East', 48, 34);
INSERT INTO Team VALUES (11, 'Dallas Mavericks', 'Dallas', 'Texas', 'West', 42, 40);
INSERT INTO Team VALUES (12, 'Los Angeles Clippers', 'Los Angeles', 'California', 'West', 53, 29);
INSERT INTO Team VALUES (13, 'Miami Heat', 'Miami', 'Florida', 'East', 48, 34);
INSERT INTO Team VALUES (14, 'Detroit Pistons', 'Detroit', 'Michigan', 'East', 44, 38);
INSERT INTO Team VALUES (15, 'Memphis Grizzlies', 'Memphis', 'Tennessee', 'West', 42, 40);
INSERT INTO Team VALUES (16, 'Indiana Pacers', 'Indianapolis', 'Indiana', 'East', 45, 37);

--Inserting starting players from both teams into the database
INSERT INTO Player VALUES(1, 'Stephen', 'Curry', 75.0, 190, 1, 12112359);
INSERT INTO Player VALUES(2, 'Klay', 'Thompson', 79.0, 215, 2, 16663575);
INSERT INTO Player VALUES(3, 'Harrison', 'Barnes', 80.0, 225, 3, 22116750);
INSERT INTO Player VALUES(4, 'Draymond', 'Green', 79.0, 230, 4, 15330435);
INSERT INTO Player VALUES(5, 'Andrew', 'Bogut', 84.0, 260, 5, 11027027);

INSERT INTO Player VALUES(6, 'Kyrie', 'Irving', 75.0, 193, 1, 17638063);
INSERT INTO Player VALUES(7, 'JR', 'Smith', 78.0, 225, 2, 12800000);
INSERT INTO Player VALUES(8, 'LeBron', 'James', 80.0, 250, 3, 30963450);
INSERT INTO Player VALUES(9, 'Kevin', 'Love', 82.0, 251, 4, 21165675);
INSERT INTO Player VALUES(10, 'Tristan', 'Thompson', 81.0, 238, 5, 15330435);

INSERT INTO Player VALUES(11, 'Tony', 'Parker', 74.0, 185, 1, 14445313);
INSERT INTO Player VALUES(12, 'Manu', 'Ginobili', 78.0, 205, 2, 14000000);
INSERT INTO Player VALUES(13, 'Kawhi', 'Leonard', 79.0, 230, 3, 17638063);
INSERT INTO Player VALUES(14, 'Tim', 'Duncan', 83.0, 250, 4, 1881250);
INSERT INTO Player VALUES(15, 'Tiago', 'Splitter', 83.0, 245, 5, 8550000);

INSERT INTO Player VALUES(16, 'Jeff', 'Teague', 73.0, 186, 1, 8800000);
INSERT INTO Player VALUES(17, 'Kyle', 'Korver', 79.0, 212, 2, 5239437);
INSERT INTO Player VALUES(18, 'Kent', 'Bazemore', 79.0, 231, 3, 15730338);
INSERT INTO Player VALUES(19, 'Paul', 'Millsap', 80.0, 246, 4, 20072033);
INSERT INTO Player VALUES(20, 'Al', 'Horford', 82.0, 245, 5, 26540100);

INSERT INTO Player VALUES(21, 'Russell', 'Westbrook', 75.0, 187, 1, 26540100);
INSERT INTO Player VALUES(22, 'Dion', 'Waiters', 76.0, 225, 2, 2898000);
INSERT INTO Player VALUES(23, 'Kevin', 'Durant', 79.0, 240, 3, 26540100);
INSERT INTO Player VALUES(24, 'Serge', 'Ibaka', 82.0, 235, 4, 12250000);
INSERT INTO Player VALUES(25, 'Steven', 'Adams', 84.0, 255, 5, 3140517);

INSERT INTO Player VALUES(26, 'Kyle', 'Lowry', 72.0, 205, 1, 12000000);
INSERT INTO Player VALUES(27, 'Demar', 'Derozan', 79.0, 221, 2, 26540100);
INSERT INTO Player VALUES(28, 'Terrence', 'Ross', 79.0, 207, 3, 10000000);
INSERT INTO Player VALUES(29, 'Patrick', 'Patterson', 81.0, 230, 4, 6050000);
INSERT INTO Player VALUES(30, 'Bismack', 'Biyombo', 81.0, 225, 5, 17000000);

INSERT INTO Player VALUES(31, 'Patrick', 'Beverly', 73.0, 185, 1, 6000000);
INSERT INTO Player VALUES(32, 'James', 'Harden', 77.0, 220, 2, 26540100);
INSERT INTO Player VALUES(33, 'Trevor', 'Ariza', 80.0, 215, 3, 7806971);
INSERT INTO Player VALUES(34, 'Terrence', 'Jones', 81.0, 252, 4, 1050961);
INSERT INTO Player VALUES(35, 'Dwight', 'Howard', 83.0, 265, 5, 23180275);

INSERT INTO Player VALUES(36, 'Damian', 'Lillard', 75.0, 195, 1, 24328425);
INSERT INTO Player VALUES(37, 'CJ', 'McCollum', 76.0, 200, 2, 3219579);
INSERT INTO Player VALUES(38, 'Al-Farouq', 'Aminu', 81.0, 220, 3, 7680965);
INSERT INTO Player VALUES(39, 'Ed', 'Davis', 82.0, 240, 4, 6666667);
INSERT INTO Player VALUES(40, 'Mason', 'Plumlee', 83.0, 245, 5, 2328530);

INSERT INTO Player VALUES(41, 'Isaiah', 'Thomas', 69.0, 185, 1, 6587132);
INSERT INTO Player VALUES(42, 'Avery', 'Bradley', 74.0, 180, 2, 8269663);
INSERT INTO Player VALUES(43, 'Jae', 'Crowder', 78.0, 235, 3, 6286408);
INSERT INTO Player VALUES(44, 'Amir', 'Johnson', 81.0, 240, 4, 12000000);
INSERT INTO Player VALUES(45, 'Kelly', 'Olynyk', 84.0, 238, 5, 3094014);

INSERT INTO Player VALUES(46, 'Kemba', 'Walker', 73.0, 172, 1, 12000000);
INSERT INTO Player VALUES(47, 'Jeremy', 'Lin', 75.0, 200, 2, 11483254);
INSERT INTO Player VALUES(48, 'Nicolas', 'Batum', 80.0, 200, 3, 20869566);
INSERT INTO Player VALUES(49, 'Marvin', 'Williams', 81.0, 237, 4, 12250000);
INSERT INTO Player VALUES(50, 'Cody', 'Zeller', 84.0, 240, 5, 5318313);

INSERT INTO Player VALUES(51, 'Raymond', 'Felton', 73.0, 205, 1, 1551659);
INSERT INTO Player VALUES(52, 'John', 'Jenkins', 76.0, 215, 2, 469841);
INSERT INTO Player VALUES(53, 'Wesley', 'Matthews', 77.0, 220, 3, 17100000);
INSERT INTO Player VALUES(54, 'Dirk', 'Nowitzki', 84.0, 245, 4, 25000000);
INSERT INTO Player VALUES(55, 'Zaza', 'Pachulia', 83.0, 270, 5, 2898000);

INSERT INTO Player VALUES(56, 'Chris', 'Paul', 72.0, 175, 1, 22868828);
INSERT INTO Player VALUES(57, 'Jamal', 'Crawford', 77.0, 200, 2, 13253012);
INSERT INTO Player VALUES(58, 'Wesley', 'Johnson', 79.0, 215, 3, 5628000);
INSERT INTO Player VALUES(59, 'Blake', 'Griffin', 82.0, 251, 4, 20140838);
INSERT INTO Player VALUES(60, 'DeAndre', 'Jordan', 83.0, 265, 5, 21165675);

INSERT INTO Player VALUES(61, 'Goran', 'Dragic', 75.0, 190, 1, 15890000);
INSERT INTO Player VALUES(62, 'Dwyane', 'Wade', 76.0, 220, 2, 23200000);
INSERT INTO Player VALUES(63, 'Justise', 'Winslow', 79.0, 225, 3, 2593440);
INSERT INTO Player VALUES(64, 'Luol', 'Deng', 81.0, 220, 4, 18000000);
INSERT INTO Player VALUES(65, 'Hassan', 'Whiteside', 84.0, 265, 5, 22116750);

INSERT INTO Player VALUES(66, 'Reggie', 'Jackson', 75.0, 208, 1, 14956522);
INSERT INTO Player VALUES(67, 'Kentavious', 'Caldwell-Pope', 77.0, 205, 2, 3678319);
INSERT INTO Player VALUES(68, 'Marcus', 'Morris', 81.0, 235, 3, 4625000);
INSERT INTO Player VALUES(69, 'Ersan', 'Ilyasova', 82.0, 235, 4, 8400000);
INSERT INTO Player VALUES(70, 'Andre', 'Drummond', 83.0, 279, 5, 22116750);

INSERT INTO Player VALUES(71, 'Mike', 'Conley', 73.0, 175, 1, 26540100);
INSERT INTO Player VALUES(72, 'Tony', 'Allen', 76.0, 213, 2, 5505618);
INSERT INTO Player VALUES(73, 'Matt', 'Barnes', 79.0, 226, 3, 6125000);
INSERT INTO Player VALUES(74, 'Zach', 'Randolph', 81.0, 260, 4, 10361445);
INSERT INTO Player VALUES(75, 'Marc', 'Gasol', 85.0, 255, 5, 21165675);

INSERT INTO Player VALUES(76, 'George', 'Hill', 75.0, 188, 1, 8000000);
INSERT INTO Player VALUES(77, 'Monta', 'Ellis', 75.0, 185, 2, 10770000);
INSERT INTO Player VALUES(78, 'Paul', 'George', 81.0, 220, 3, 18314532);
INSERT INTO Player VALUES(79, 'Lavoy', 'Allen', 81.0, 260, 4, 4000000);
INSERT INTO Player VALUES(80, 'Ian', 'Mahinmi', 83.0, 250, 5, 15944154);

--Defines the members of a team in the PlayerTeam table for all 16 teams in the database
INSERT INTO PlayerTeam VALUES(1, 1);
INSERT INTO PlayerTeam VALUES(2, 1);
INSERT INTO PlayerTeam VALUES(3, 1);
INSERT INTO PlayerTeam VALUES(4, 1);
INSERT INTO PlayerTeam VALUES(5, 1);

INSERT INTO PlayerTeam VALUES(6, 2);
INSERT INTO PlayerTeam VALUES(7, 2);
INSERT INTO PlayerTeam VALUES(8, 2);
INSERT INTO PlayerTeam VALUES(9, 2);
INSERT INTO PlayerTeam VALUES(10, 2);

INSERT INTO PlayerTeam VALUES(11, 3);
INSERT INTO PlayerTeam VALUES(12, 3);
INSERT INTO PlayerTeam VALUES(13, 3);
INSERT INTO PlayerTeam VALUES(14, 3);
INSERT INTO PlayerTeam VALUES(15, 3);

INSERT INTO PlayerTeam VALUES(16, 4);
INSERT INTO PlayerTeam VALUES(17, 4);
INSERT INTO PlayerTeam VALUES(18, 4);
INSERT INTO PlayerTeam VALUES(19, 4);
INSERT INTO PlayerTeam VALUES(20, 4);

INSERT INTO PlayerTeam VALUES(21, 5);
INSERT INTO PlayerTeam VALUES(22, 5);
INSERT INTO PlayerTeam VALUES(23, 5);
INSERT INTO PlayerTeam VALUES(24, 5);
INSERT INTO PlayerTeam VALUES(25, 5);

INSERT INTO PlayerTeam VALUES(26, 6);
INSERT INTO PlayerTeam VALUES(27, 6);
INSERT INTO PlayerTeam VALUES(28, 6);
INSERT INTO PlayerTeam VALUES(29, 6);
INSERT INTO PlayerTeam VALUES(30, 6);

INSERT INTO PlayerTeam VALUES(31, 7);
INSERT INTO PlayerTeam VALUES(32, 7);
INSERT INTO PlayerTeam VALUES(33, 7);
INSERT INTO PlayerTeam VALUES(34, 7);
INSERT INTO PlayerTeam VALUES(35, 7);

INSERT INTO PlayerTeam VALUES(36, 8);
INSERT INTO PlayerTeam VALUES(37, 8);
INSERT INTO PlayerTeam VALUES(38, 8);
INSERT INTO PlayerTeam VALUES(39, 8);
INSERT INTO PlayerTeam VALUES(40, 8);

INSERT INTO PlayerTeam VALUES(41, 9);
INSERT INTO PlayerTeam VALUES(42, 9);
INSERT INTO PlayerTeam VALUES(43, 9);
INSERT INTO PlayerTeam VALUES(44, 9);
INSERT INTO PlayerTeam VALUES(45, 9);

INSERT INTO PlayerTeam VALUES(46, 10);
INSERT INTO PlayerTeam VALUES(47, 10);
INSERT INTO PlayerTeam VALUES(48, 10);
INSERT INTO PlayerTeam VALUES(49, 10);
INSERT INTO PlayerTeam VALUES(50, 10);

INSERT INTO PlayerTeam VALUES(51, 11);
INSERT INTO PlayerTeam VALUES(52, 11);
INSERT INTO PlayerTeam VALUES(53, 11);
INSERT INTO PlayerTeam VALUES(54, 11);
INSERT INTO PlayerTeam VALUES(55, 11);

INSERT INTO PlayerTeam VALUES(56, 12);
INSERT INTO PlayerTeam VALUES(57, 12);
INSERT INTO PlayerTeam VALUES(58, 12);
INSERT INTO PlayerTeam VALUES(59, 12);
INSERT INTO PlayerTeam VALUES(60, 12);

INSERT INTO PlayerTeam VALUES(61, 13);
INSERT INTO PlayerTeam VALUES(62, 13);
INSERT INTO PlayerTeam VALUES(63, 13);
INSERT INTO PlayerTeam VALUES(64, 13);
INSERT INTO PlayerTeam VALUES(65, 13);

INSERT INTO PlayerTeam VALUES(66, 14);
INSERT INTO PlayerTeam VALUES(67, 14);
INSERT INTO PlayerTeam VALUES(68, 14);
INSERT INTO PlayerTeam VALUES(69, 14);
INSERT INTO PlayerTeam VALUES(70, 14);

INSERT INTO PlayerTeam VALUES(71, 15);
INSERT INTO PlayerTeam VALUES(72, 15);
INSERT INTO PlayerTeam VALUES(73, 15);
INSERT INTO PlayerTeam VALUES(74, 15);
INSERT INTO PlayerTeam VALUES(75, 15);

INSERT INTO PlayerTeam VALUES(76, 16);
INSERT INTO PlayerTeam VALUES(77, 16);
INSERT INTO PlayerTeam VALUES(78, 16);
INSERT INTO PlayerTeam VALUES(79, 16);
INSERT INTO PlayerTeam VALUES(80, 16);

--2015-2016 season
INSERT INTO Season VALUES(1, 2015, 2016, 2, 1);

--9 games where Golden State and Cleveland faced off (regular season and NBA finals)
INSERT INTO Games VALUES(1, 2, 1, 89, 104, '02-June-2016', 1, 'San Francisco');
INSERT INTO Games VALUES(2, 2, 1, 77, 110, '05-June-2016', 1, 'San Francisco');
INSERT INTO Games VALUES(3, 1, 2, 90, 120, '08-June-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(4, 1, 2, 108, 97, '10-June-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(5, 2, 1, 112, 97, '13-June-2016', 1, 'San Francisco');
INSERT INTO Games VALUES(6, 1, 2, 101, 115, '16-June-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(7, 2, 1, 93, 89, '19-June-2016', 1, 'San Francisco');
INSERT INTO Games VALUES(8, 6, 2, 84, 115, '17-May-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(9, 6, 2, 89, 108, '19-May-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(10, 2, 6, 84, 99, '21-May-2016', 1, 'Toronto');
INSERT INTO Games VALUES(11, 2, 6, 99, 105, '23-May-2016', 1, 'Toronto');
INSERT INTO Games VALUES(12, 6, 2, 78, 116, '25-May-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(13, 2, 6, 113, 87, '27-May-2016', 1, 'Toronto');
INSERT INTO Games VALUES(14, 4, 2, 93, 104, '02-May-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(15, 4, 2, 98, 123, '04-May-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(16, 2, 4, 121, 108, '06-May-2016', 1, 'Atlanta');
INSERT INTO Games VALUES(17, 2, 4, 100, 99, '08-May-2016', 1, 'Atlanta');
INSERT INTO Games VALUES(18, 14, 2, 106, 101, '17-Apr-2016', 1, 'Cleveland'):
INSERT INTO Games VALUES(19, 14, 2, 90, 107, '19-Apr-2016', 1, 'Cleveland');
INSERT INTO Games VALUES(20, 2, 14, 101, 91, '21-Apr-2016', 1, 'Detroit');
INSERT INTO Games VALUES(21, 2, 14, 100, 98, '23-Apr-2016', 1, 'Detroit');

INSERT INTO Games VALUES(22, 9, 4, 101, 102, '16-Apr-2016', 1, 'Atlanta');
INSERT INTO Games VALUES(23, 9, 4, 72, 89, '18-Apr-2016', 1, 'Atlanta');
INSERT INTO Games VALUES(24, 4, 9, 103, 111, '20-Apr-2016', 1, 'Boston');
INSERT INTO Games VALUES(25, 4, 9, 95, 104, '22-Apr-2016', 1, 'Boston');
INSERT INTO Games VALUES(26, 9, 4, 83, 110, '24-Apr-2016', 1, 'Atlanta');
INSERT INTO Games VALUES(27, 4, 9, 104, 92, '26-Apr-2016', 1, 'Boston');


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
INSERT INTO GameStats VALUES(62, 9, 6, 4, 1, 3, 1, 2, 1, 6, 4, 7, 2, 3, 0, 0, 1, 3, 12);
INSERT INTO GameStats VALUES(63, 9, 7, 4, 1, 9, 3, 3, 0, 4, 3, 9, 3, 14, 2, 0, 1, 2, 30);

--Game stats for Tristan Thompson in 7 games against Golden State in the NBA Finals
INSERT INTO GameStats VALUES(64, 10, 1, 5, 1, 11, 5, 0, 0, 0, 0, 10, 0, 12, 0, 1, 0, 3, 31);
INSERT INTO GameStats VALUES(65, 10, 2, 5, 1, 8, 3, 0, 0, 2, 2, 8, 0, 5, 1, 0, 0, 4, 19);
INSERT INTO GameStats VALUES(66, 10, 3, 5, 1, 6, 5, 0, 0, 5, 4, 14, 2, 13, 0, 0, 0, 2, 31);
INSERT INTO GameStats VALUES(67, 10, 4, 5, 1, 7, 5, 0, 0, 5, 0, 10, 0, 7, 0, 1, 0, 3, 29);
INSERT INTO GameStats VALUES(68, 10, 5, 5, 1, 3, 1, 0, 0, 10, 4, 6, 0, 15, 1, 2, 0, 1, 42);
INSERT INTO GameStats VALUES(69, 10, 6, 5, 1, 6, 6, 0, 0, 4, 3, 15, 3, 16, 0, 0, 3, 4, 43);
INSERT INTO GameStats VALUES(70, 10, 7, 5, 1, 3, 3, 0, 0, 4, 3, 9, 0, 3, 0, 2, 0, 4, 32);