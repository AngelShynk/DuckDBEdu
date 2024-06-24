-- Create table as select

CREATE TABLE atp_matches_2023 AS
SELECT * FROM read_csv_auto('https://raw.githubusercontent.com/JeffSackmann/tennis_atp/master/atp_matches_2023.csv');

SELECT * FROM atp_matches_2023;

DESCRIBE TABLE atp_matches_2023;

-- Query Without Materialized CTE
-- This query calculates the total aces for each player and then filters 
-- for those who have more than 100 total aces in both winning and losing scenarios.

SET explain_output = 'all';



EXPLAIN ANALYZE WITH cte AS (
	SELECT 
	tourney_name, 
	winner_age
	FROM atp_matches_2023
	QUALIFY ROW_NUMBER() OVER (PARTITION BY tourney_name ORDER BY winner_age ASC) = 1

)
select max(winner_age) from cte
union all
select avg(winner_age) from cte
union all
select min(winner_age) from cte
;


EXPLAIN ANALYZE WITH cte AS MATERIALIZED (
	SELECT 
	tourney_name, 
	winner_age
	FROM atp_matches_2023
	QUALIFY ROW_NUMBER() OVER (PARTITION BY tourney_name ORDER BY winner_age ASC) = 1

)
select max(winner_age) from cte
union all
select avg(winner_age) from cte
union all
select min(winner_age) from cte
;