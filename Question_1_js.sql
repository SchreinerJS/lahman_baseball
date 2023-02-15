-- 1. What range of years for baseball games played does the provided database cover? 

--NOTE: (from data dictionary) This database contains pitching, hitting, and fielding statistics for Major League Baseball from 1871 through 2016.  It includes data from the two current leagues (American and National), the four other "major" leagues (American Association, Union Association, Players League, and Federal League), and the National Association of 1871-1875. 

SELECT MIN(yearid) AS min_year, MAX(yearid) AS max_year
FROM teams

--ANSWER: RANGE OF YEARS THAT TEAMS EXISTED = 1871 to 2016

--Year in teams relative to leagues and games played

SELECT g, MAX(yearid) AS earliest_year_game_played
FROM teams
GROUP BY g
ORDER BY earliest_year_game_played
LIMIT 1;

--ANSWER: EARLIEST GAMES WERE PLAYED IN 1871

SELECT g, MAX(yearid) AS latest_year_game_played
FROM teams
GROUP BY g
ORDER BY latest_year_game_played DESC
LIMIT 1;

--ANSWER: LATEST GAMES WERE PLAYED IN 2016