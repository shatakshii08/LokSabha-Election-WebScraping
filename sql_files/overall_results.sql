
--calculate vote percentage of each party

ALTER TABLE overall_results
ADD Vote_Percentage INT;

UPDATE overall_results
SET Vote_Percentage = (Total * 100.0 / (SELECT SUM(Total) FROM overall_results));





