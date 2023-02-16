--11. Is there any correlation between number of wins and team salary? Use data from 2000 and later to answer this question. As you do this analysis, keep in mind that salaries across the whole 
--league tend to increase together, so you may want to look on a year-by-year basis.

WITH AL_table AS (WITH team_salary_table AS (SELECT teamid, yearid, lgid, SUM(salary)::numeric::money AS team_salary
					 	   FROM salaries 
						   WHERE lgid = 'AL'
					 	   GROUP BY teamid, yearid, lgid
					 	   ORDER BY yearid)
SELECT teams.yearid,
	   teams.teamid,
	   w,
	   ROUND(AVG(w)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid), 0) AS avg_w_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY w) AS quartile_w,
	   team_salary,
	   (AVG(team_salary::numeric)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid)::money) AS avg_salary_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY team_salary) AS quartile_salary
FROM teams LEFT JOIN team_salary_table ON (teams.teamid, teams.yearid) = (team_salary_table.teamid, team_salary_table.yearid)
WHERE teams.yearid >= 2000
	AND teams.lgid = 'AL'
GROUP BY teams.yearid, teams.teamid, g, w, l, team_salary
ORDER BY teams.yearid)
SELECT yearid, teamid, w, avg_w_per_year, team_salary, avg_salary_per_year, quartile_w, quartile_salary
FROM AL_table
WHERE quartile_w = 4
	AND quartile_salary = 4
--22 results for 4/4

WITH AL_table AS (WITH team_salary_table AS (SELECT teamid, yearid, lgid, SUM(salary)::numeric::money AS team_salary
					 	   FROM salaries 
						   WHERE lgid = 'AL'
					 	   GROUP BY teamid, yearid, lgid
					 	   ORDER BY yearid)
SELECT teams.yearid,
	   teams.teamid,
	   w,
	   ROUND(AVG(w)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid), 0) AS avg_w_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY w) AS quartile_w,
	   team_salary,
	   (AVG(team_salary::numeric)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid)::money) AS avg_salary_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY team_salary) AS quartile_salary
FROM teams LEFT JOIN team_salary_table ON (teams.teamid, teams.yearid) = (team_salary_table.teamid, team_salary_table.yearid)
WHERE teams.yearid >= 2000
	AND teams.lgid = 'AL'
GROUP BY teams.yearid, teams.teamid, g, w, l, team_salary
ORDER BY teams.yearid)
SELECT yearid, teamid, w, avg_w_per_year, team_salary, avg_salary_per_year, quartile_w, quartile_salary
FROM AL_table
WHERE (quartile_w = 3 AND quartile_salary = 3)
	OR (quartile_w = 4 AND quartile_salary = 3)
	OR (quartile_w = 3 AND quartile_salary = 4)
--40 results 


WITH team_salary_table AS (SELECT teamid, yearid, lgid, SUM(salary)::numeric::money AS team_salary
					 	   FROM salaries 
						   WHERE lgid = 'AL'
					 	   GROUP BY teamid, yearid, lgid
					 	   ORDER BY yearid)
SELECT teams.yearid,
	   teams.teamid,
	   w,
	   ROUND(AVG(w)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid), 0) AS avg_w_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY w) AS quartile_w,
	   team_salary,
	   (AVG(team_salary::numeric)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid)::money) AS avg_salary_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY team_salary) AS quartile_salary
FROM teams LEFT JOIN team_salary_table ON (teams.teamid, teams.yearid) = (team_salary_table.teamid, team_salary_table.yearid)
WHERE teams.yearid >= 2000
	AND teams.lgid = 'AL'
GROUP BY teams.yearid, teams.teamid, g, w, l, team_salary
ORDER BY teams.yearid
--242 team/year combinations possible



--AMERICAN LEAGUE---
--22/242 teams were in both the top quartile of wins and salaries
--40/242 teams were in the two quartiles for either wins or salaries
--62/242 (25.62%) of the time there is a correlation between team wins and team salary in the American League




WITH AL_table AS (WITH team_salary_table AS (SELECT teamid, yearid, lgid, SUM(salary)::numeric::money AS team_salary
					 	   FROM salaries 
						   WHERE lgid = 'NL'
					 	   GROUP BY teamid, yearid, lgid
					 	   ORDER BY yearid)
SELECT teams.yearid,
	   teams.teamid,
	   w,
	   ROUND(AVG(w)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid), 0) AS avg_w_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY w) AS quartile_w,
	   team_salary,
	   (AVG(team_salary::numeric)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid)::money) AS avg_salary_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY team_salary) AS quartile_salary
FROM teams LEFT JOIN team_salary_table ON (teams.teamid, teams.yearid) = (team_salary_table.teamid, team_salary_table.yearid)
WHERE teams.yearid >= 2000
	AND teams.lgid = 'NL'
GROUP BY teams.yearid, teams.teamid, g, w, l, team_salary
ORDER BY teams.yearid)
SELECT yearid, teamid, w, avg_w_per_year, team_salary, avg_salary_per_year, quartile_w, quartile_salary
FROM AL_table
WHERE quartile_w = 4
	AND quartile_salary = 4
--21 results for 4/4

WITH AL_table AS (WITH team_salary_table AS (SELECT teamid, yearid, lgid, SUM(salary)::numeric::money AS team_salary
					 	   FROM salaries 
						   WHERE lgid = 'NL'
					 	   GROUP BY teamid, yearid, lgid
					 	   ORDER BY yearid)
SELECT teams.yearid,
	   teams.teamid,
	   w,
	   ROUND(AVG(w)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid), 0) AS avg_w_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY w) AS quartile_w,
	   team_salary,
	   (AVG(team_salary::numeric)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid)::money) AS avg_salary_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY team_salary) AS quartile_salary
FROM teams LEFT JOIN team_salary_table ON (teams.teamid, teams.yearid) = (team_salary_table.teamid, team_salary_table.yearid)
WHERE teams.yearid >= 2000
	AND teams.lgid = 'NL'
GROUP BY teams.yearid, teams.teamid, g, w, l, team_salary
ORDER BY teams.yearid)
SELECT yearid, teamid, w, avg_w_per_year, team_salary, avg_salary_per_year, quartile_w, quartile_salary
FROM AL_table
WHERE (quartile_w = 3 AND quartile_salary = 3)
	OR (quartile_w = 4 AND quartile_salary = 3)
	OR (quartile_w = 3 AND quartile_salary = 4)
--71 results 


WITH team_salary_table AS (SELECT teamid, yearid, lgid, SUM(salary)::numeric::money AS team_salary
					 	   FROM salaries 
						   WHERE lgid = 'NL'
					 	   GROUP BY teamid, yearid, lgid
					 	   ORDER BY yearid)
SELECT teams.yearid,
	   teams.teamid,
	   w,
	   ROUND(AVG(w)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid), 0) AS avg_w_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY w) AS quartile_w,
	   team_salary,
	   (AVG(team_salary::numeric)OVER(PARTITION BY teams.yearid ORDER BY teams.yearid)::money) AS avg_salary_per_year,
	   NTILE(4)OVER(PARTITION BY teams.yearid ORDER BY team_salary) AS quartile_salary
FROM teams LEFT JOIN team_salary_table ON (teams.teamid, teams.yearid) = (team_salary_table.teamid, team_salary_table.yearid)
WHERE teams.yearid >= 2000
	AND teams.lgid = 'NL'
GROUP BY teams.yearid, teams.teamid, g, w, l, team_salary
ORDER BY teams.yearid
--268 team/year combinations possible


---NATIONAL LEAGUE---
--21/268 teams were in both the top quartile of wins and salaries.
--71/268 teams were in the two quartiles for either wins or salaries.
--92/268 (34.43%) of the time there is a correlation between team wins and team salary in the National League.
