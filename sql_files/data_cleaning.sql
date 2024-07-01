SELECT * 
FROM overall_results

--Identifying Missing Values

SELECT * 
FROM overall_results 
WHERE Party IS NULL;

UPDATE overall_results
SET Party = 0
WHERE Party IS NULL;

--Identifying Duplicate Values

SELECT Party 
FROM overall_results
GROUP BY Party
HAVING COUNT(Party) > 1;


