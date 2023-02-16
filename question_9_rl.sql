--9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won
--the award.

SELECT playerid, --COUNT of awards per manager with >1 award
	   COUNT(*)
FROM awardsmanagers
WHERE awardid = 'TSN Manager of the Year'
	AND (lgid = 'NL' OR lgid = 'AL')
GROUP BY playerid
HAVING COUNT(*) > 1
ORDER BY playerid


SELECT * -- single table sorting by correct award and either 'NL' or 'AL' league id
FROM awardsmanagers
WHERE awardid = 'TSN Manager of the Year'
	AND (lgid = 'NL' OR lgid = 'AL')
ORDER BY playerid



WITH am_al_nl AS (SELECT DISTINCT namefirst, --CTE with first/last names of managers who recieved both NL and AL 'TSN Manager of the Year' awards 
	   							  namelast, 
	   							  UNNEST(ARRAY[am_nl.playerid, am_al.playerid]) AS am_playerid, --stacked manager playerids for NL and AL
	  							  UNNEST(ARRAY[am_nl.yearid, am_al.yearid]) AS am_year --stacked years for NL and AL
				  FROM awardsmanagers AS am_nl INNER JOIN awardsmanagers AS am_al ON am_nl.playerid = am_al.playerid --Self join
							 				   LEFT JOIN people ON (am_nl.playerid, am_al.playerid) = (people.playerid, people.playerid) --join people on both playerids
				  WHERE am_nl.awardid = 'TSN Manager of the Year'
						AND am_al.awardid = 'TSN Manager of the Year'
						AND am_nl.lgid = 'NL'
						AND am_al.lgid = 'AL'
				  GROUP BY am_playerid, am_year, namefirst, namelast)
SELECT namefirst, namelast, am_al_nl.am_year, name
FROM am_al_nl LEFT JOIN managers ON (am_al_nl.am_playerid, am_al_nl.am_year) = (managers.playerid, managers.yearid) --join managers on both playerid and year
			  LEFT JOIN teams ON (am_al_nl.am_year, managers.teamid) = (teams.yearid, teams.teamid) --join teams on both year and teamid
