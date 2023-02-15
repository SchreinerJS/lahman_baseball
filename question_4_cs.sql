CHERNAE-- -- 4. Using the fielding table, group players into three groups based on their position: 
-- label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", 
-- and those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these three groups in 2016.

SELECT DISTINCT playerid
FROM fielding;
--total of 18,714 players 

SELECT *
FROM fielding;
--136815 rows 

SELECT SUM(po) as putouts_sum,  
	CASE WHEN pos = 'OF' THEN 'Outfield'
	     WHEN pos = 'SS' THEN 'Infield' 
		 WHEN pos = '1B' THEN 'Infield'
		 WHEN pos = '2B' THEN 'Infield'
		 WHEN pos = '3B' THEN 'Infield'
		 WHEN pos = 'P' THEN 'Battery'
		 WHEN pos = 'C' THEN 'Battery'
		 ELSE 'error' END AS position_group
FROM fielding
GROUP BY position_group
ORDER BY position_group;

