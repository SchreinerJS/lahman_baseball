--7.  From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? What is the smallest number of wins for a team that did win the world series? Doing this will 
--probably result in an unusually small number of wins for a world series champion – determine why this is the case. Then redo your query, excluding the problem year. How often from 1970 – 2016 was 
--it the case that a team with the most wins also won the world series? What percentage of the time?

SELECT yearid, teamID, w, l, wswin -- largest wins for team that did not win world series
FROM teams
WHERE wswin <> 'Y'
ORDER BY w DESC;
--116 wins in 2001 by SEA

SELECT yearid, teamID, w, l, wswin -- smallest wins for team that did win world series
FROM teams
WHERE wswin = 'Y'
ORDER BY w;
--63 wins in 1981 by LAN; this year's season there was a player's striek which lasted from June 12-31 and split the season into two halves (first split season in American league history)

SELECT yearid, teamID, w, l, wswin 
FROM teams
WHERE wswin = 'Y'
	AND yearid <> 1981	--excluding problem year
ORDER BY w;
--75 wins in 1918 by BOS

SELECT yearid, -- shows w/l of world series winners per year compared to max win (w_max) for that year
	   teamID, 
	   w, 
	   l , 
	   wswin, 
	   MAX(w)OVER(PARTITION BY yearid ORDER BY yearid) AS w_max, --max wins partitioned by year as w_max
	   CASE WHEN w = MAX(w)OVER(PARTITION BY yearid ORDER BY yearid) THEN 'Y'
	   		WHEN w <> MAX(w)OVER(PARTITION BY yearid ORDER BY yearid) THEN NULL
			END AS ws_winner_is_max --ws_winner_is_max column that returns 'Y' if the w column for the world series winning team that year matches the w_max column for that year 
FROM teams
WHERE yearid BETWEEN 1970 AND 2016
	AND wswin = 'Y'; --filtered for only world series winners per year


WITH ws_winning_teams AS (SELECT yearid, --CTE of query above
						  		 teamID, 
						  		 w, 
						  		 l , 
						  		 wswin, 
	   					  		 MAX(w)OVER(PARTITION BY yearid ORDER BY yearid) AS w_max, 
	   					  		 CASE WHEN w = MAX(w)OVER(PARTITION BY yearid ORDER BY yearid) THEN 'Y'
	   								  WHEN w <> MAX(w)OVER(PARTITION BY yearid ORDER BY yearid) THEN NULL
								  	  END AS ws_winner_is_max 
						  FROM teams
						  WHERE yearid BETWEEN 1970 AND 2016
						  	AND wswin = 'Y')
SELECT (COUNT(ws_winner_is_max)/COUNT(*))*100 AS percent_highest_win_ws
FROM ws_winning_teams
WHERE ws_winner_is_max = 'Y';

--from 1970-2016 the world series winner also had the most wins for that year 100% of the time
