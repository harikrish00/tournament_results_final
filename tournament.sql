-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

\c tournament;

CREATE TABLE tournaments (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  t_id INTEGER REFERENCES tournaments(id) ON DELETE CASCADE
);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  winner INTEGER REFERENCES players(id),
  loser INTEGER REFERENCES players(id),
  draw BOOLEAN,
  t_id INTEGER REFERENCES tournaments(id) ON DELETE CASCADE
);

CREATE TABLE player_match_points(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players(id),
  bye INTEGER DEFAULT 0,
  t_id INTEGER REFERENCES tournaments(id) ON DELETE CASCADE,
  match_id INTEGER REFERENCES matches(id),
  points INTEGER
);

CREATE VIEW standings AS
SELECT players.t_id, players.id, players.name,
(SELECT count(*) FROM matches WHERE players.id = matches.winner and matches.draw = FALSE) AS wins,
(SELECT count(*) FROM matches WHERE players.id = matches.winner OR players.id = matches.loser ) AS matches,
(SELECT COALESCE(SUM(points), 0) FROM player_match_points WHERE players.id = player_match_points.player_id) AS total_points,
(SELECT COALESCE(SUM(points), 0) FROM player_match_points WHERE match_id IN (SELECT id FROM matches WHERE loser = players.id) OR match_id IN (SELECT id FROM matches WHERE winner = players.id) and player_id <> players.id) AS omw FROM players ORDER BY wins DESC, omw DESC;
