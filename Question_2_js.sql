-- 2. a. Find the name and height of the shortest player in the database. 

SELECT namegiven, namelast, height
FROM people
WHERE height = (SELECT MIN(height) AS shortest_height
				FROM people);

--2b. How many games did he play in? What is the name of the team for which he played?

SELECT namegiven, namelast, height AS shortest_height, name AS team, g_all
FROM people
LEFT JOIN appearances USING (playerid)
LEFT JOIN teams USING (teamid)
WHERE height = (SELECT MIN(height) 
				FROM people)
GROUP BY namegiven, namelast, height, name, g_all
ORDER BY shortest_height;

----------------------------------------------------
--ANSWER: Player: Edward Carl "Eddie" Gaedel, 43" tall (3'7")) Team - St. Louis Browns, Games Played = 1,    
---------------------------------------------------



--CHECKS:
SELECT *
FROM people
WHERE namelast LIKE 'Gaedel'
--playerid=gaedeed01

SELECT *
FROM appearances
WHERE playerid = 'gaedeed01'

-- https://en.wikipedia.org/wiki/Eddie_Gaedel
-- 'Edward Carl Gaedel (June 8, 1925 – June 18, 1961) was the smallest player to appear in a Major League Baseball game' at 3'4''

------------------
--NOTES:
-- Thought players often go by their nicknames, the team decided to use their given name in this query.
-- people, appearance, teams
-- height = inches
-- some height fields are null
-- JOIN to appearances on playerid, JOIN to teams on teamid
-- Choice made by team to use namegiven (legal name) versus namefirst (nickname)
-- subquery ORDER BY may not carry over to outer query, so much be in outer query
