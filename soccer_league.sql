DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

-- all teams/wins
CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    wins INT
);

-- all refs
CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    ref_name TEXT NOT NULL
);

-- players/team_id
CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id REFERENCES teams
);

-- matches/team_id/ref_id/winning_team_id
CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team_id REFERENCES teams,
    away_team_id REFERENCES teams,
    ref_id REFERENCES referees,
    winning_team_id REFERENCES teams
);

-- goals/player_id/team_id/game_id
CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player_id REFERENCES players,
    team_id REFERENCES teams,
    match_id REFERENCES matches
);


-- TODO: start/end dates


-- INSERTING --

INSERT INTO teams(team_name, wins)
VALUES
    ('Random Racoons'),
    ('Flying Penguins'),
    ('Lightning Panthers'),
    ('Sitting Ducks');

