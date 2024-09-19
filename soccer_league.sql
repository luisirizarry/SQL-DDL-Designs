DROP DATABASE IF EXISTS soccer_league_db;
CREATE DATABASE soccer_league_db;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    current_standing INTEGER UNIQUE NOT NULL,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    team_id INTEGER REFERENCES teams(id) ON DELETE NULL
);

CREATE TABLE games(
    id SERIAL PRIMARY KEY,
    home_score INTEGER NOT NULL,
    away_score INTEGER NOT NULL,
    date DATE NOT NULL,
    home_team_id INTEGER REFERENCES teams(id) ON DELETE SET NULL,
    away_team_id INTEGER REFERENCES teams(id) ON DELETE SET NULL,
    mvp_id INTEGER REFERENCES players(id) ON DELETE SET NULL
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL,
    last_name TEXT
);

CREATE TABLE game_referees(
    referee_id INTEGER REFERENCES referees(id),
    game_id INTEGER REFERENCES games(id),
    PRIMARY KEY (game_id, referee_id)
);

CREATE TABLE goals(
    player_id INTEGER REFERENCES players(id),
    game_id INTEGER REFERENCES games(id),
    PRIMARY KEY (game_id, player_id)
);

CREATE TABLE start_end_dates(
    id SERIAL PRIMARY KEY, 
    start DATE NOT NULL,
    end DATE NOT NULL
);
