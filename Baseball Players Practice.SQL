CREATE DATABASE Baseball;

CREATE TABLE League (
  League_id INTEGER NOT NULL AUTO_INCREMENT,
  League VARCHAR(255),
  PRIMARY KEY(League_id)
) ENGINE = InnoDB;

CREATE TABLE Division (
  Division_id INTEGER NOT NULL AUTO_INCREMENT,
  Division VARCHAR(255),
  League_id INTEGER,

  PRIMARY KEY(Division_id),
  INDEX USING BTREE (Division),

  CONSTRAINT FOREIGN KEY (League_id)
    REFERENCES League (League_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Team (
  Team_id INTEGER NOT NULL AUTO_INCREMENT,
  Team VARCHAR(255),
  Division_id INTEGER,

  PRIMARY KEY(Team_id),
  INDEX USING BTREE (Team),

  CONSTRAINT FOREIGN KEY (Division_id)
    REFERENCES Division (Division_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Player (
  Player_id INTEGER NOT NULL AUTO_INCREMENT,
  Player VARCHAR(255),
  Batting_Avg FLOAT,
  Homeruns INTEGER,
  RBI INTEGER,
  MVP_Year INTEGER,
  Team_id INTEGER,

  PRIMARY KEY(Player_id),
  INDEX USING BTREE (Player),

  CONSTRAINT FOREIGN KEY (Team_id) REFERENCES Team (Team_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

INSERT INTO League (League) VALUES ('National');
INSERT INTO League (League) VALUES ('American');

INSERT INTO Division (Division, League_id) VALUES ('West',1);
INSERT INTO Division (Division, League_id) VALUES ('East',1);
INSERT INTO Division (Division, League_id) VALUES ('Central',1);
INSERT INTO Division (Division, League_id) VALUES ('West',2);
INSERT INTO Division (Division, League_id) VALUES ('East',2);
INSERT INTO Division (Division, League_id) VALUES ('Central',2);

INSERT INTO Team (team, Division_id) VALUES ('Giants', 1);
INSERT INTO Team (team, Division_id) VALUES ('Dodgers', 1);
INSERT INTO Team (team, Division_id) VALUES ('Padres', 1);
INSERT INTO Team (team, Division_id) VALUES ('Rockies', 1);
INSERT INTO Team (team, Division_id) VALUES ('Diamondbacks', 1);

INSERT INTO Team (team, Division_id) VALUES ('Cubs', 3);
INSERT INTO Team (team, Division_id) VALUES ('Reds', 3);
INSERT INTO Team (team, Division_id) VALUES ('Brewers', 3);
INSERT INTO Team (team, Division_id) VALUES ('Pirates', 3);
INSERT INTO Team (team, Division_id) VALUES ('Cardinals', 3);

INSERT INTO Team (team, Division_id) VALUES ('Braves', 2);
INSERT INTO Team (team, Division_id) VALUES ('Marlins', 2);
INSERT INTO Team (team, Division_id) VALUES ('Mets', 2);
INSERT INTO Team (team, Division_id) VALUES ('Phillies', 2);
INSERT INTO Team (team, Division_id) VALUES ('Nationals', 2);

INSERT INTO Team (team, Division_id) VALUES ('Orioles', 5);
INSERT INTO Team (team, Division_id) VALUES ('Red Sox', 5);
INSERT INTO Team (team, Division_id) VALUES ('Yankees', 5);
INSERT INTO Team (team, Division_id) VALUES ('Rays', 5);
INSERT INTO Team (team, Division_id) VALUES ('Blue Jays', 5);

INSERT INTO Team (team, Division_id) VALUES ('White Sox', 6);
INSERT INTO Team (team, Division_id) VALUES ('Indians', 6);
INSERT INTO Team (team, Division_id) VALUES ('Tigers', 6);
INSERT INTO Team (team, Division_id) VALUES ('Royals', 6);
INSERT INTO Team (team, Division_id) VALUES ('Twins', 6);

INSERT INTO Team (team, Division_id) VALUES ('Astros', 4);
INSERT INTO Team (team, Division_id) VALUES ('Angels', 4);
INSERT INTO Team (team, Division_id) VALUES ('Athletics', 4);
INSERT INTO Team (team, Division_id) VALUES ('Mariners', 4);
INSERT INTO Team (team, Division_id) VALUES ('Rangers', 4);

INSERT INTO Player (Player, Batting_AVG, MVP_Year, Homeruns, RBI, Team_ID) VALUES ('Mike Trout', .291, 2019, 45, 104, 27);
INSERT INTO Player (Player, Batting_AVG, MVP_Year, Homeruns, RBI, Team_ID) VALUES ('Cody Bellinger', .305, 2019, 47, 115, 2);
INSERT INTO Player (Player, Batting_AVG, MVP_Year, Homeruns, RBI, Team_ID) VALUES ('Mookie Betts', .346, 2018, 32, 80, 17);
INSERT INTO Player (Player, Batting_AVG, MVP_Year, Homeruns, RBI, Team_ID) VALUES ('Christian Yelich', .326, 2018, 36, 110, 8);
INSERT INTO Player (Player, Batting_AVG, MVP_Year, Homeruns, RBI, Team_ID) VALUES ('Jose Altuve', .346, 2017, 24, 81, 26);
INSERT INTO Player (Player, Batting_AVG, MVP_Year, Homeruns, RBI, Team_ID) VALUES ('Giancarl Stanton', .281, 2017, 59, 132, 12);
INSERT INTO Player (Player, Batting_AVG, MVP_Year, Homeruns, RBI, Team_ID) VALUES ('Mike Trout', .315, 2016, 29, 100, 27);
INSERT INTO Player (Player, Batting_AVG, MVP_Year, Homeruns, RBI, Team_ID) VALUES ('Kris Bryant', .292, 2016, 39, 102, 6);
INSERT INTO Player (Player, Batting_AVG, MVP_Year, Homeruns, RBI, Team_ID) VALUES ('Josh Donaldson', .297, 2015, 41, 123, 20);
INSERT INTO Player (Player, Batting_AVG, MVP_Year, Homeruns, RBI, Team_ID) VALUES ('Bryce Harper', .330, 2015, 42, 99, 15);

SELECT Player.Player, Team.Team, Division.Division, League.League, MVP_year, Batting_AVG, Homeruns, RBI 
    FROM Player JOIN Team JOIN Division JOIN League 
    ON Player.Team_id = Team.Team_id AND Team.Division_id = 
    Division.Division_id AND Division.League_id = League.League_id
