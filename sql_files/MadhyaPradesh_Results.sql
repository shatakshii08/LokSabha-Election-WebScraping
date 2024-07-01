--analysing the vote percentage in Madhya Pradesh
ALTER TABLE MadhyaPradesh_Results
ADD Vote_Percentage INT;

UPDATE MadhyaPradesh_Results
SET Vote_Percentage = (Total * 100.0 / (SELECT SUM(Total) FROM MadhyaPradesh_Results));

--BJP fully dominated in Madhya Pradesh
