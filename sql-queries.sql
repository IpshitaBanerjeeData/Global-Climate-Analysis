-- Query 1: Find the total number of records to verify data integrity.
-- This shows you're checking for completeness after the data load.
SELECT
    COUNT(*) AS total_records
FROM
    global_climate_data;

-- Query 2: Find the average temperature anomaly and CO2 emissions for the past 25 years.
-- This demonstrates the use of a WHERE clause and aggregation to focus on a recent period.
SELECT
    AVG(temp_anomaly_annual) AS avg_temp_anomaly_past_25_years,
    AVG(total_co2_emissions) AS avg_co2_emissions_past_25_years
FROM
    global_climate_data
WHERE
    year >= 2000;

-- Query 3: Identify the year with the highest temperature anomaly on record.
-- This showcases your ability to find key data points and use ORDER BY/LIMIT.
SELECT
    year,
    temp_anomaly_annual
FROM
    global_climate_data
ORDER BY
    temp_anomaly_annual DESC
LIMIT 1;

-- Query 4: Identify the year with the largest increase in CO2 emissions from the previous year.
-- This is a powerful demonstration of a window function (LAG) and a subquery.
SELECT
    year,
    co2_increase
FROM
    (
        SELECT
            year,
            total_co2_emissions - LAG(total_co2_emissions, 1) OVER (ORDER BY year) AS co2_increase
        FROM
            global_climate_data
    ) AS subquery
ORDER BY
    co2_increase DESC
LIMIT 1;

-- Query 5: Calculate the 5-year rolling average for temperature anomaly.
-- This is an impressive, more advanced query that shows your understanding of long-term trends by smoothing out yearly fluctuations.
SELECT
    year,
    temp_anomaly_annual,
    AVG(temp_anomaly_annual) OVER (ORDER BY year ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS rolling_avg_temp
FROM
    global_climate_data;

-- Query 6: Find the difference in temperature and CO2 emissions between 1880 and the most recent year.
-- This demonstrates a combination of aggregation and subqueries to compare two distinct periods.
SELECT
    (
        (SELECT temp_anomaly_annual FROM global_climate_data ORDER BY year DESC LIMIT 1) -
        (SELECT temp_anomaly_annual FROM global_climate_data WHERE year = 1880)
    ) AS temp_difference,
    (
        (SELECT total_co2_emissions FROM global_climate_data ORDER BY year DESC LIMIT 1) -
        (SELECT total_co2_emissions FROM global_climate_data WHERE year = 1880)
    ) AS co2_difference;