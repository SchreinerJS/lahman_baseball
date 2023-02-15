--10. Find all players who hit their career highest number of home runs in 2016. Consider only players who have played in the league for at least 10 years, and who hit at least one home run in 2016. 
--Report the players' first and last names and the number of home runs they hit in 2016.

WITH max_hr_table AS (SELECT playerid, MAX(hr) AS max_hr --CTE with unique playerid paired with max # of homeruns overall
					  FROM batting
					  GROUP BY playerid),
	 players_06 AS (SELECT playerid --CTE only comprised of players with games in 2006 (to filter for players in league at least 10 years)
				    FROM batting
				    WHERE yearid = 2006)
SELECT namefirst, namelast, MAX(hr) AS max_hr
FROM batting INNER JOIN max_hr_table USING(playerid)
			 INNER JOIN people USING(playerid)
			 INNER JOIN players_06 USING(playerid)
WHERE yearid = 2016 --filtering for only max_hr in 2016
	AND hr > 0 --filtering for max_hr greater than 0 
GROUP BY namefirst, namelast, playerid, players_06.playerid, max_hr
HAVING MAX(hr) = max_hr_table.max_hr --only produces results where the 2016 max_hr is equal to overall max_hr from the first CTE
	AND playerid = players_06.playerid --only produces results where the playerid is also in the player_id list for 2006 ( )
