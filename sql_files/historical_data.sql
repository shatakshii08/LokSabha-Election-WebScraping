CREATE TABLE historical_data (
Party VARCHAR(100),
Won2014 INT,
Won2019 INT,
Won2024 INT
);

INSERT INTO historical_data (Party, Won2014, Won2019, Won2024) VALUES
('Bharatiya Janata Party - BJP', 282, 303, 240),
('Indian National Congress - INC', 44, 52, 99),
('National Democratic Alliance - NDA', 336, 353, 293),
('United Progressive Alliance - UPA', 59, 91, 0),
('Indian National Development Inclusive Alliance - I.N.D.I.A', 0, 0, 234);

--calculating percentage

ALTER TABLE historical_data
ADD VotePercentage INT;

UPDATE historical_data
SET VotePercentage = (Won2024 * 100.0 / (SELECT SUM(Won2024) FROM historical_data));

--analysing which party forms the government

SELECT Party, Won2024
FROM historical_data
WHERE Won2024 > 272;

--analysing the growth each year

SELECT
    Party,
    Won2014,
    Won2019,
    Won2024,
    CASE
        WHEN Won2019 > Won2014 AND Won2024 > Won2019 THEN 'Continuous Growth'
        WHEN Won2019 < Won2014 AND Won2024 < Won2019 THEN 'Continuous Decline'
        WHEN Won2019 > Won2014 AND Won2024 < Won2019 THEN 'Growth and then Decline'
        WHEN Won2019 < Won2014 AND Won2024 > Won2019 THEN 'Decline and then Growth'
        WHEN Won2019 = Won2014 AND Won2024 > Won2019 THEN 'Stagnant and then Growth'
        WHEN Won2019 = Won2014 AND Won2024 < Won2019 THEN 'Stagnant and then Decline'
        ELSE 'No Change'
    END AS GrowthDeclineStatus
FROM
    historical_data;



