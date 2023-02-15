--9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won
--the award.

SELECT playerid,
	   COUNT(*)
FROM awardsmanagers
WHERE awardid = 'TSN Manager of the Year'
	AND (lgid = 'NL' OR lgid = 'AL')
GROUP BY playerid
HAVING COUNT(*) > 1
ORDER BY playerid
--johnsda02

SELECT *
FROM awardsmanagers
WHERE awardid = 'TSN Manager of the Year'
	AND (lgid = 'NL' OR lgid = 'AL')
ORDER BY playerid