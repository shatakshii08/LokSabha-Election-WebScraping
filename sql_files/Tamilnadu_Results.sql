--analysing the vote percentage in tamilnadu

ALTER TABLE Tamilnadu_Results
ADD Vote_Percentage INT;

UPDATE Tamilnadu_Results
SET Vote_Percentage = (Total * 100.0 / (SELECT SUM(Total) FROM Tamilnadu_Results));

--DMK and its alliances fully dominated in Tamilnadu