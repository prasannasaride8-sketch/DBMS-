CREATE DATABASE IF NOT EXISTS GameDB; -- Creates the database
USE GameDB; -- Selects the GameDB database
CREATE TABLE Games (
    game_id INT PRIMARY KEY,              -- Unique ID of the game
    game_name VARCHAR(50) NOT NULL,       -- Name of the game
    game_type VARCHAR(50),                -- Type of the game
    min_age INT,                          -- Minimum age required
    platform VARCHAR(30)                 -- Platform of the game
);

-- Inserting 3 different games into the Games table
INSERT INTO Games
(game_id, game_name, game_type, min_age, platform)
VALUES
(1, 'BGMI', 'Battle Royale', 16, 'Mobile'),
(2, 'Free Fire', 'Battle Royale', 16, 'Mobile'),
(3, 'Valorant', 'First Person Shooter', 18, 'PC');
CREATE TABLE Players (
    player_id INT PRIMARY KEY,             -- Unique ID of the player
    player_name VARCHAR(50) NOT NULL,      -- Name of the player
    age INT,                               -- Age of the player
    country VARCHAR(50),                   -- Country of the player
    rank_name VARCHAR(30),                 -- Game rank
    game_id INT,                           -- ID of the game played
    FOREIGN KEY (game_id) REFERENCES Games(game_id) -- Connects Players with Games
);

-- Inserting player details
INSERT INTO Players
(player_id, player_name, age, country, rank_name, game_id)
VALUES
(101, 'Prasanna', 19, 'India', 'Ace', 1),
(102, 'Rahul', 15, 'India', 'Diamond', 1),
(103, 'Anitha', 20, 'India', 'Heroic', 2),
(104, 'Kiran', 14, 'India', 'Master', 2),
(105, 'Suresh', 21, 'India', 'Immortal', 3),
(106, 'Ravi', 17, 'India', 'Gold', 3);
CREATE TABLE Tournament (
    tournament_id INT PRIMARY KEY,         -- Unique ID of tournament
    tournament_name VARCHAR(60),            -- Name of tournament
    game_id INT,                            -- Game ID
    prize_pool DECIMAL(10,2),               -- Prize money
    location VARCHAR(50),                  -- Tournament location
    FOREIGN KEY (game_id) REFERENCES Games(game_id) -- Connects Tournament with Games
);

-- Inserting tournament details
INSERT INTO Tournament
(tournament_id, tournament_name, game_id, prize_pool, location)
VALUES
(1, 'BGMI Championship', 1, 500000.00, 'Hyderabad'),
(2, 'Free Fire Cup', 2, 300000.00, 'Vijayawada'),
(3, 'Valorant Masters', 3, 1000000.00, 'Bangalore');
CREATE VIEW Eligible_Players AS
SELECT
    p.player_id,
    p.player_name,
    p.age,
    g.game_name,
    g.min_age,
    p.rank_name
FROM Players p
JOIN Games g
ON p.game_id = g.game_id
WHERE p.age >= g.min_age;
CREATE VIEW Not_Eligible_Players AS
SELECT
    p.player_id,
    p.player_name,
    p.age,
    g.game_name,
    g.min_age,
    p.rank_name
FROM Players p
JOIN Games g
ON p.game_id = g.game_id
WHERE p.age < g.min_age;




SELECT * FROM Games;




SELECT * FROM Players;



SELECT * FROM Tournament;





SELECT * FROM Eligible_Players;




SELECT * FROM Not_Eligible_Players;



SELECT
    p.player_name,
    p.age,
    g.game_name,
    g.game_type,
    p.rank_name
FROM Players p
JOIN Games g
ON p.game_id = g.game_id;
