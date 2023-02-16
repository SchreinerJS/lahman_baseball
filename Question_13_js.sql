-- 13. It is thought that since left-handed pitchers are more rare, causing batters to face them less often, that they are more effective. Investigate this claim and present evidence to either support or dispute this claim. 

--		First, determine just how rare left-handed pitchers are compared with right-handed pitchers. 
--		Are left-handed pitchers more likely to win the Cy Young Award? Are they more likely to make it into the hall of fame?
-- rare = percentage left to right, and then right to left?
-- How many distinct pitchers are there?
-- do we including pitchingpost table for effectiveness? (post season and regular season - is post season all stars and playoffs?) 

--MORE EFFECTIVE: just based on -- BFP Batters faced by Pitcher
--OR ALSO on shutouts? strikeouts (SOA teams, anywhere else)? intentional walks, any others?  
--LESS EFFECTIVE wild pitches, batters hit by pitch, walks


--GOAL: Pull ids for pitchers only
SELECT playerid
FROM people
--19112

SELECT DISTINCT playerid
FROM pitching
ORDER BY playerid
--9302 -- is this just pitchers? just less than half the total number of people in database

SELECT playerid, pos
FROM fielding
WHERE pos LIKE 'P'
--9302 -- is this just pitchers? just less than half the total number of people in database

--This doesn't seem right
SELECT playerid, SUM(G_p) AS total_games_pitched
FROM appearances
WHERE G_p > 0
GROUP BY playerid
ORDER BY total_games_pitched DESC
--9302 pitchers 
--G_p = games as pitcher

AS total_games_as_pitcher

appearances g_p games as pitcher

SELECT COUNT (DISTINCT playerid)
FROM fielding
WHERE pos LIKE 'P'
--9302 -- really?



SELECT 	DISTINCT playerid AS total_pitchers,
		COUNT(CASE WHEN throws LIKE 'R' THEN throws END) AS right_handed,
		COUNT(CASE WHEN throws LIKE 'L' THEN throws END) AS left_handed,
FROM people
INNER JOIN pitching

		DISTINCT playerid AS total_distinct_players
			(right_handed / DISTINCT playerid) AS percentage_left_handed


people, throws = handed for throwing

--Named for the winningest pitcher in baseball history, the Cy Young Award is voted upon by the Baseball Writers' Association of America prior to the beginning of the postseason. From 1956 to 1966, the award was given to one pitcher, but has been given to one pitcher per league since 1967. The vote totals are based on a weighted points system.

SELECT playerid, awardid
FROM awardsshareplayers
WHERE awardid ILIKE 'cy%'

-- Pitching table

-- playerID       Player ID code
-- yearID         Year
-- stint          player's stint (order of appearances within a season)
-- teamID         Team
-- lgID           League
-- W              Wins
-- L              Losses
-- G              Games
-- GS             Games Started
-- CG             Complete Games 
-- SHO            Shutouts
-- SV             Saves
-- IPOuts         Outs Pitched (innings pitched x 3)
-- H              Hits
-- ER             Earned Runs
-- HR             Homeruns
-- BB             Walks
-- SO             Strikeouts
-- BAOpp          Opponent's Batting Average
-- ERA            Earned Run Average
-- IBB            Intentional Walks
-- WP             Wild Pitches
-- HBP            Batters Hit By Pitch
-- BK             Balks
-- BFP            Batters faced by Pitcher
-- GF             Games Finished
-- R              Runs Allowed
-- SH             Sacrifices by opposing batters
-- SF             Sacrifice flies by opposing batters
-- GIDP           Grounded into double plays by opposing batter