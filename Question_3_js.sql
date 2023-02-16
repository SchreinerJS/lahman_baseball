-- 3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?  Which Vanderbilt player earned the most money in the majors?

SELECT namefirst, namelast, SUM(salary::numeric::money) AS total_salary
FROM people INNER JOIN collegeplaying USING(playerid)
			INNER JOIN schools USING(schoolid)
			INNER JOIN salaries USING (playerid)
WHERE schoolname LIKE 'Vanderbilt University' --65 results ILIKE '%vand%', all showed 'Vanderbilt University'
GROUP by namefirst, namelast
ORDER by total_salary DESC
LIMIT 1;

-----------------------------------------------------------------------------------------------------------------
--ANSWER: David Price is the Vanderbilt player who has earned the most money in the majors, at $245,553,888.00
-----------------------------------------------------------------------------------------------------------------

--NOTE: When the Tigers fell out of the postseason race in 2015, they traded him to the Blue Jays, who won their division and advanced to the ALCS. That following off-season, the Red Sox signed Price to a franchise-record seven-year, $217 million contract. At the time, it was the largest contract total for a pitcher in Major League history. 

--Price was drafted with the first-overall pick of the 2007 Major League Baseball Draft. He signed his first professional contract on August 15, 2007. The six-year contract was worth $11.25 million ($8.5 million guaranteed), including a $5.6 million signing bonus. After the contract was approved by the MLB, he was added to the Devil Rays 40-man roster before being optioned to the minor leagues to begin his career.[7]  The total value of Price's bonus was the largest in draft history. The signing bonus was second-largest in draft history.

--https://en.wikipedia.org/wiki/David_Price_(baseball)

-----------------------------------------------------------------------------------------------------------------
--SCRATCHPAD

-- people namefirst namelast JOINS to collegeplaying through playerid
-- collegeplaying JOINS to schools through schoolid to reach schoolname
-- people links to salaries through playerid
-- salary as double precision ::numeric::money
-- database is for major league only, so don't need to filter out data for minor leagues