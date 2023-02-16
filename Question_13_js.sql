-- 13. It is thought that since left-handed pitchers are more rare, causing batters to face them less often, that they are more effective. Investigate this claim and present evidence to either support or dispute this claim. 

--		First, determine just how rare left-handed pitchers are compared with right-handed pitchers. 
--		Are left-handed pitchers more likely to win the Cy Young Award? Are they more likely to make it into the hall of fame?
-- rare = percentage left to right, and then right to left?
-- How many distinct pitchers are there?
-- do we including pitchingpost table for effectiveness? (post season and regular season - is post season all stars and playoffs?) 

--MORE EFFECTIVE: just based on -- BFP Batters faced by Pitcher
--OR ALSO on shutouts? strikeouts (SOA teams, anywhere else)? intentional walks, any others?  
--LESS EFFECTIVE wild pitches, batters hit by pitch, walks


--Pull ids for pitchers only
-- BFP Batters faced by Pitcher

WITH count_of_handedness AS (WITH pitchers AS (SELECT DISTINCT playerid, SUM(g) AS games_pitched
											FROM pitching
											WHERE g > 50   -- need this to be an AVG
											GROUP BY playerid)

					SELECT COUNT(*) AS total_pitchers,
					COUNT(CASE WHEN throws LIKE 'R' THEN throws END) AS right_handed,
					COUNT(CASE WHEN throws LIKE 'L' THEN throws END) AS left_handed
					FROM pitching
					INNER JOIN people
					USING(playerid))

SELECT 	ROUND(((right_handed::numeric / total_pitchers::numeric)*100), 2) AS percentage_right_handed,
		ROUND(((left_handed::numeric / total_pitchers::numeric)*100), 2)  AS percentage_left_handed
FROM count_of_handedness

-- About 27.8% left handed pitchers, compared to the general population which is less than 3% strongly/completely left-handed.  So it's more than 9 times more likely to find a left-handed pitcher versus a left-handed person in society.

--https://www.rightleftrightwrong.com/statistics.html#:~:text=Most%20people%20fall%20towards%20the,evenly%20mixed%2Dhanded%20or%20ambidextrous.

SELECT playerid, awardid
FROM awardsshareplayers
WHERE awardid ILIKE 'cy%'
	
--total games pitched = 1064803
										  
	total_games_pitched AS (SELECT DISTINCT playerid, SUM(g) AS games_pitched
							FROM pitching
							WHERE g > 0
							GROUP BY playerid)
		SELECT SUM(games_pitched)
		FROM pitchers
SELECT 

FROM people
WHERE playerid = (SELECT playerid
	  			 FROM fielding
				 WHERE pos LIKE 'P')
GROUP BY playerid

ORDER BY playerid

SELECT 	DISTINCT playerid AS total_pitchers,

FROM people
INNER JOIN pitching


people, throws = handed for throwing




----------------
--SCRATCH PAD
--G_p = games as pitcher
--G == pitching, games, some fields are 0

SELECT COUNT (DISTINCT playerid)
FROM fielding
WHERE pos LIKE 'P'
--9302 -- is this just pitchers? just less than half the total number of people in database

SELECT playerid, pos, SUM(G_p) AS total_games_pitched
FROM fielding
INNER JOIN appearances USING(playerid)
WHERE pos LIKE 'P' AND
	G_p > 0
GROUP BY playerid, pos
ORDER BY total_games_pitched DESC

--Is this right for total games pitched?
SELECT playerid, SUM(G_p) AS total_games_pitched
FROM appearances
WHERE G_p > 0
GROUP BY playerid
ORDER BY total_games_pitched DESC
--9302 pitchers 
--G_p = games as pitcher

--Named for the winningest pitcher in baseball history, the Cy Young Award is voted upon by the Baseball Writers' Association of America prior to the beginning of the postseason. From 1956 to 1966, the award was given to one pitcher, but has been given to one pitcher per league since 1967. The vote totals are based on a weighted points system.

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