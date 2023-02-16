--10. Find all players who hit their career highest number of home runs in 2016. Consider only players who have played in the league for at least 10 years, and who hit at least one home run in 2016. 
--Report the players' first and last names and the number of home runs they hit in 2016.

WITH max_hr_table AS (SELECT playerid, MAX(hr) AS max_hr --CTE with unique playerid paired with max # of homeruns overall
					  FROM batting
					  GROUP BY playerid),
	 players_10_years_plus AS (SELECT playerid, COUNT(yearid) --CTE with playerid only >= 10 years played
				 			   FROM batting
							   GROUP BY playerid
							   HAVING COUNT(yearid) >= 10
							   ORDER BY playerid)
SELECT namefirst, namelast, MAX(hr) AS max_hr
FROM batting INNER JOIN max_hr_table USING(playerid)
			 INNER JOIN people USING(playerid)
			 INNER JOIN players_10_years_plus USING(playerid)
WHERE yearid = 2016 --filtering for only max_hr in 2016
	AND hr > 0 --filtering for max_hr greater than 0 
GROUP BY namefirst, namelast, playerid, players_10_years_plus.playerid, max_hr
HAVING MAX(hr) = max_hr_table.max_hr --only produces results where the 2016 max_hr is equal to overall max_hr from the first CTE
	AND playerid = players_10_years_plus.playerid; --only produces results where the playerid is has played for more than 10 years ( )
	
--Adam Rosales, 13; Adam Wainwright, 2; Angel Pagan, 12; Bartolo Colon, 1; Bobby Wilson, 4; Danny Valencia, 17; Edwin Encarnacion, 42; Francisco Liriano, 1; Justin Upton, 31;
--Mat Latos, 1; Mat Latos, 1; Mike Napoli, 34; Rajai Davis, 12; Robinson Cano, 39.
