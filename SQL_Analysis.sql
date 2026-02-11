CREATE DATABASE Individual_Incident_DB;

USE Individual_Incident_DB;

SELECT * FROM incident_table;

-- 1. How many total incidents are recorded
SELECT COUNT(ID) AS total_incidents
FROM incident_table;

-- 2. Which states have the highest number of incidents
SELECT state, COUNT(ID) AS incident_count
FROM incident_table
GROUP BY state
ORDER BY incident_count DESC;

-- 3. What is the total number of offenses, victims, and offenders recorded
SELECT 
    SUM(total_offense) AS total_offenses,
    SUM(total_victim) AS total_victims,
    SUM(total_offender) AS total_offenders
FROM incident_table;

-- 4. Which offense category occurs most frequently
SELECT 
    SUM(violence_offense) AS total_violence,
    SUM(theft_offense) AS total_theft,
    SUM(drug_offense) AS total_drug
FROM incident_table;

-- 5. How many incidents involve guns or drugs?
SELECT 
    SUM(gun_involvement) AS total_gun_cases,
    SUM(drug_involvement) AS total_drug_cases
FROM incident_table;

-- 6. What is the total property value lost and how many stolen motor cases occurred
SELECT 
    SUM(property_value) AS total_property_loss,
    SUM(stolen_motor) AS total_motor_theft
FROM incident_table;

-- 7. What is the distribution of victims by gender
SELECT 
    SUM(male_victim) AS male_victims,
    SUM(female_victim) AS female_victims,
    SUM(unknown_sex_victim) AS unknown_gender_victims
FROM incident_table;

-- 8. How many victims are minors versus adults?
SELECT 
    SUM(minor_victim) AS minor_victims,
    SUM(non_minor_victim) AS adult_victims,
    SUM(unknown_age_victim) AS unknown_age_victims
FROM incident_table;

-- 9. What is the relationship between offenders and victims
SELECT 
    SUM(offender_wi_family) AS family_related,
    SUM(offender_outside_family) AS outside_family,
    SUM(offender_not_known) AS unknown_relationship
FROM incident_table;

-- 10. How are victims distributed across racial categories
SELECT 
    SUM(w_victim) AS white_victims,
    SUM(b_victim) AS black_victims,
    SUM(i_victim) AS indian_victims,
    SUM(a_victim) AS asian_victims,
    SUM(p_victim) AS pacific_victims,
    SUM(unknown_race_victim) AS unknown_race
FROM incident_table;

-- 11. What is the count of completed versus attempted crimes
SELECT completed_attempted2, COUNT(ID) AS case_count
FROM incident_table
GROUP BY completed_attempted2;

-- 12. At which hour do most incidents occur?
SELECT hour, COUNT(ID) AS total_cases
FROM incident_table
GROUP BY hour
ORDER BY total_cases DESC;

-- 13. Which states have the highest property loss
SELECT state,
	SUM(property_value) AS total_loss,
    DENSE_RANK() OVER (ORDER BY SUM(property_value) DESC) AS loss_rank
FROM incident_table
GROUP BY state;

-- 14. How do incidents change over different dates
SELECT date_SIF,
       COUNT(ID) AS daily_cases
FROM incident_table
GROUP BY date_SIF
ORDER BY date_SIF;

-- 15. What percentage of total offenses are sex-related
SELECT 
    (SUM(sex_offense) * 100.0 / SUM(total_offense)) AS sex_offense_percentage
FROM incident_table;

-- 16. How many incidents involve both drug and violence offenses?
SELECT COUNT(ID) AS combined_cases
FROM incident_table
WHERE drug_offense > 0 AND violence_offense > 0;

-- 17. Which state reports the highest number of minor victims?
SELECT state, SUM(minor_victim) AS total_minor_victims
FROM incident_table
GROUP BY state
ORDER BY total_minor_victims DESC;

-- 18. What is the gender ratio of victims in each state?
SELECT state,
       SUM(male_victim) AS male_victims,
       SUM(female_victim) AS female_victims
FROM incident_table
GROUP BY state;

-- 19. Which states rank highest in gun-related incidents
SELECT state,
       SUM(gun_involvement) AS gun_cases,
       DENSE_RANK() OVER (ORDER BY SUM(gun_involvement) DESC) AS gun_rank
FROM incident_table
GROUP BY state;




