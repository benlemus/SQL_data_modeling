DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

-- TEAM NAMES
CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL
);

-- REFEREEES NAMES
CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    ref_name TEXT NOT NULL
);

-- PLAYERS NAMES
CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL
);

-- SEASON
CREATE TABLE season(
    id SERIAL PRIMARY KEY,
    season_start_date DATE NOT NULL,
    season_end_date DATE NOT NULL
);

-- INSERTING --

INSERT INTO teams(team_name)
VALUES
    ('Random Racoons'),
    ('Flying Penguins'),
    ('Lightning Panthers'),
    ('Sitting Ducks');

INSERT INTO referees(ref_name)
VALUES
    ('Jeff'),
    ('Marko'),
    ('Sam');

INSERT INTO players(player_name)
VALUES
    ('Milo'),
    ('Marvin'),
    ('Mojo'),
    ('Ben'),
    ('Kori'),
    ('Laura'),
    ('Meganne'),
    ('Max');

INSERT INTO season(season_start_date, season_end_date)
VALUES
    ('2025-02-10','2025-08-10');


-- ******************************
-- RELATIONS
-- ******************************


-- HOME TEAM, AWAY TEAM, RESULT / MATCH
CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES teams,
    away_team_id INT REFERENCES teams,
    winning_team_id INT REFERENCES teams
);

INSERT INTO matches(home_team_id, away_team_id, winning_team_id)
VALUES
    (1,2,1),
    (2,3,3),
    (3,1,3),
    (3,4,3),
    (4,1,4),
    (4,2,4);


-- REF/GAME
CREATE TABLE ref_game(
    id SERIAL PRIMARY KEY,
    ref_id INT REFERENCES referees,
    match_id INT REFERENCES matches
);

INSERT INTO ref_game(match_id, ref_id)
VALUES
    (1,1),
    (1,3),
    (2,2),
    (2,3),
    (3,1),
    (3,2),
    (3,3),
    (4,1),
    (5,1),
    (5,2),
    (6,2),
    (6,3);


-- GOALS/ PLAYER,MATCH
CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players NOT NULL,
    match_id INT REFERENCES matches NOT NULL,
    goals INT NOT NULL
);

INSERT INTO goals(match_id, player_id, goals)
VALUES
    (1,1,2),
    (1,2,1),
    (1,5,1),
    (2,2,1),
    (2,3,1),
    (2,7,1),
    (3,5,1),
    (3,7,2),
    (4,3,3),
    (4,4,1),
    (4,8,1),
    (5,4,1),
    (5,8,1),
    (5,1,1),
    (6,2,1),
    (6,6,2),
    (6,4,2),
    (6,8,2);


-- PLAYERS_TEAMS
CREATE TABLE players_teams(
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players NOT NULL,
    team_id INT REFERENCES teams NOT NULL
);

INSERT INTO players_teams(player_id, team_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 1),
    (6, 2),
    (7, 3),
    (8, 4);


-- STANDINGS
CREATE TABLE standings(
    id SERIAL PRIMARY KEY,
    team_id INT REFERENCES teams NOT NULL,
    wins INT NOT NULL
);

INSERT INTO standings(team_id, wins)
VALUES
    (1, 1),
    (2, 0),
    (3, 3),
    (4, 2);

