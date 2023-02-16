-- -- -- -- 5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. 
-- -- -- Do the same for home runs per game. Do you see any trends?
   
-- --  Upon review of all the strikeouts, there are 6 different types of strikeouts.
-- --  Strikeouts:
-- --  *Strikeouts from the Batting Table which total 1,949,871 
-- --  *Strikeouts from the Pitching Table which total 2,090,818
-- --  *Strikeouts by batters from the Teams Table which total 2,020,375******
-- --  *Strikeouts by pitchers from the Teams Table which total 2,090,080
-- --  *Strikeouts from the Batting Post Table which total 20,162
-- --  *Strikeouts from the Pitching Post Table which total 20,241 
 
-- -- Seeing the data is comprised of 145 years of statistics (1871 to 2016), it would does not seem reasonable to consider the strikeouts from the Batting Post and Pitching Post.
-- -- For the purposes of this project we will consider strikeouts from batter from the Teams Table. This figure is supported by strikeouts from the Pitching Table and strikeouts 
-- -- from the pitchers on the Teams Table.  

-- -- GAMES:
-- -- *Games from the Batting Table which total 5,278,927***** 
-- -- *Games from the Pitching Table which total 1,064,803
-- -- *Games started from the Pitching Table which total 426,496 
-- -- *Complete games from the Pitching Table which total 141,680  
-- -- *Games finished from the Pitching Table which total 284,458
-- -- *Games from the Fielding Table which total 4,849,516
-- -- *Games started from the Fielding Table which total 2,275,137
-- -- *Excluded games managed 
-- -- *Games played from the Teams Table which total 426,582 
-- -- *Exluced games played at home 
-- -- *Complete games from the Teams Table which total 141,682
-- -- *Games from the Batting Post Table which total 42,494
-- -- *Games from the Pitching Post Table which total 10,091 
-- -- *Games started from the Pitching Post Table which total 3,144  
-- -- *Complete games from the Pitching Post Table which total 660
-- -- *Games finished from the Pitching Post Table which total 2,484
-- -- *Games played from the TeamsHalf Table which total 2,778
-- -- *Games from the Fielding Post Table which total 37,347
-- -- *Games started from the Fielding Post Table which total 27,162
-- -- *Total games played from the Appearance Table which total 5,279,957
-- -- *Games from the Fieldingofsplit Table which total 902,195
-- -- *Games started from the Fieldingofsplit Table which total 510,682

-- -- The total games vary from one table to the next. The data includes statistics for two current leagues (American and National) and four other major leagues (American Association,
-- -- Union Association, Players League, and Federal League). I will use the games listed under the Batting Table as this figure is supported by the total games played. This figure is 
-- -- also supported by the years of data accumulated over 145 years. 

-- -- Homeruns:
-- -- *Homeruns from the Batting Table which total 289,283******
-- -- *Homeruns from the Pitching Table which total 289,301
-- -- *Homeruns by batter from the Teams Table which total 289,298 
-- -- *Homeruns from the Batting Post Table which total 2,623 
-- -- *Homeruns from the Pitching Post Table which total 2,622 

-- -- I will consider the homeruns from the Batting Table as this figure is supported by the Pitching Table and the Teams Table. 

-- SELECT SUM(HR)
-- FROM pitchingpost; 

-- SELECT SUM(g)
-- FROM pitching; 

-- WITH avg_so_per_game AS SELECT AVG(teams.so/ batting.g)
-- 						FROM teams
-- 						INNER JOIN batting
-- 						USING(yearid)

-- WITH avg_hr_per_game AS SELECT AVG(batting.hr/batting.g)
-- 						FROM batting
						
________________________CODE BELOW________________
Strikeouts:
SELECT  
	CASE WHEN yearid BETWEEN '1920' AND '1929' THEN '1920s'
	     WHEN yearid BETWEEN '1930' AND '1939' THEN '1930s' 
		 WHEN yearid BETWEEN '1940' AND '1949' THEN '1940s'
		 WHEN yearid BETWEEN '1950' AND '1959' THEN '1950s'
		 WHEN yearid BETWEEN '1960' AND '1969' THEN '1960s'
		 WHEN yearid BETWEEN '1970' AND '1979' THEN '1970s'
		 WHEN yearid BETWEEN '1980' AND '1989' THEN '1980s'
		 WHEN yearid BETWEEN '1990' AND '1999' THEN '1990s'
		 WHEN yearid BETWEEN '2000' AND '2010' THEN '2000s'
		 WHEN yearid BETWEEN '2010' AND '2016' THEN '2010s'
		 ELSE '1910s and before' END AS decades,
		 ROUND(AVG(teams.so::numeric/ batting.g::numeric), 2) as avg_strikeouts_per_game
FROM teams
INNER JOIN batting
USING(yearid)
GROUP BY decades;

Homeruns:
SELECT   
		CASE WHEN yearid BETWEEN '1920' AND '1929' THEN '1920s'
	     WHEN yearid BETWEEN '1930' AND '1939' THEN '1930s' 
		 WHEN yearid BETWEEN '1940' AND '1949' THEN '1940s'
		 WHEN yearid BETWEEN '1950' AND '1959' THEN '1950s'
		 WHEN yearid BETWEEN '1960' AND '1969' THEN '1960s'
		 WHEN yearid BETWEEN '1970' AND '1979' THEN '1970s'
		 WHEN yearid BETWEEN '1980' AND '1989' THEN '1980s'
		 WHEN yearid BETWEEN '1990' AND '1999' THEN '1990s'
		 WHEN yearid BETWEEN '2000' AND '2010' THEN '2000s'
		 WHEN yearid BETWEEN '2010' AND '2016' THEN '2010s'
		 ELSE '1910s and before' END AS decades,
		 ROUND(AVG(batting.hr::numeric/ batting.g::numeric), 4) as avg_homeruns_per_game ----I moved the decimal place out to 8 because at 2 everything is 0.
FROM batting
GROUP BY decades;




