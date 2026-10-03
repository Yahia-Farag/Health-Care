--------------------------------------------------------------------------------
-- PROJECT: Healthcare Data Cleaning & Auditing
-- SQL Server (T-Script)
--------------------------------------------------------------------------------

-- 1. Database Setup
USE Health_Care_Messy_Data;
GO

--------------------------------------------------------------------------------
-- 2. Initial Data Exploration & Row Count Audit
--------------------------------------------------------------------------------
-- Check total number of records in the dataset
SELECT COUNT(*) AS Total_Rows
FROM HealthCare;

-- Quick exploration of specific columns and patterns
SELECT * FROM HealthCare WHERE Gender = 'male';
SELECT * FROM HealthCare WHERE Visit_Date LIKE '%April%';


--------------------------------------------------------------------------------
-- 3. Cleaning 'Patient_Name' Column
--------------------------------------------------------------------------------
-- Check for missing or null values represented as text strings
SELECT * FROM HealthCare 
WHERE Patient_Name IS NULL 
   OR Patient_Name = 'nan' 
   OR Patient_Name = 'Nan';


--------------------------------------------------------------------------------
-- 4. Cleaning & Standardizing 'Age' Column
--------------------------------------------------------------------------------
-- Check for invalid text values in Age column
SELECT * FROM HealthCare WHERE Age = 'nan' OR Age = 'Nan';
SELECT * FROM HealthCare WHERE Age = 'forty' OR Age = 'Forty';

-- Fix textual string numbers (e.g., 'Forty' -> 40)
UPDATE HealthCare 
SET Age = 40
WHERE Age = 'Forty' OR Age = 'forty';

-- Convert placeholder missing text to actual NULL values
UPDATE HealthCare 
SET Age = NULL
WHERE Age = 'nan' OR Age = 'NaN' OR Age = '';

-- Alter column data type from NVARCHAR to INT
ALTER TABLE HealthCare
ALTER COLUMN Age INT;


--------------------------------------------------------------------------------
-- 5. Cleaning & Standardizing 'Gender' Column
--------------------------------------------------------------------------------
-- Explore unique gender values and inspect 'Other' entries
SELECT DISTINCT Gender FROM HealthCare;
SELECT * FROM HealthCare WHERE Gender = 'Other';


--------------------------------------------------------------------------------
-- 6. Cleaning & Standardizing 'Condition' Column
--------------------------------------------------------------------------------
-- Standardize missing or unspecified conditions to 'Unknown'
UPDATE HealthCare
SET Condition = 'Unknown'
WHERE Condition IS NULL
   OR Condition = 'None' 
   OR Condition = 'none';


--------------------------------------------------------------------------------
-- 7. Cleaning & Standardizing 'Medication' Column
--------------------------------------------------------------------------------
-- Normalize medication text casing
UPDATE HealthCare
SET Medication = LOWER(Medication);


--------------------------------------------------------------------------------
-- 8. Cleaning & Standardizing 'Visit_Date' Column
--------------------------------------------------------------------------------
-- Verify date formats
SELECT DISTINCT Visit_Date FROM HealthCare;

-- Alter column data type to standard DATE format
ALTER TABLE HealthCare
ALTER COLUMN Visit_Date DATE;


--------------------------------------------------------------------------------
-- 9. Cleaning & Standardizing 'Blood_Pressure' Column
--------------------------------------------------------------------------------
-- Explore unique blood pressure values
SELECT DISTINCT Blood_Pressure FROM HealthCare;

-- Alter column to allow NULL values before processing missing data
ALTER TABLE HealthCare
ALTER COLUMN Blood_Pressure NVARCHAR(50) NULL;

-- Replace 'nan' string values with true SQL NULLs
UPDATE HealthCare
SET Blood_Pressure = NULL
WHERE Blood_Pressure = 'Nan' OR Blood_Pressure = 'nan';


--------------------------------------------------------------------------------
-- 10. Cleaning & Standardizing 'Cholesterol' Column
--------------------------------------------------------------------------------
-- Explore unique cholesterol entries
SELECT DISTINCT Cholesterol FROM HealthCare;

-- Prepare column to accept NULL values
ALTER TABLE HealthCare
ALTER COLUMN Cholesterol NVARCHAR(50) NULL;

-- Convert text placeholders ('NaN') to true NULLs
UPDATE HealthCare
SET Cholesterol = NULL 
WHERE Cholesterol = 'NaN' OR Cholesterol = 'nan';

-- Alter column data type to FLOAT for numerical analysis
ALTER TABLE HealthCare
ALTER COLUMN Cholesterol FLOAT NULL;


--------------------------------------------------------------------------------
-- 11. Cleaning Contact Columns ('Email' & 'Phone_Number')
--------------------------------------------------------------------------------
-- Standardize missing Email entries to NULL
UPDATE HealthCare
SET Email = NULL
WHERE Email = 'nan';

-- Remove dummy/fake phone number sequences and set to NULL
UPDATE HealthCare
SET Phone_Number = NULL
WHERE Phone_Number LIKE '%-555-%'
   OR Phone_Number = '123-456-7890'
   OR Phone_Number = 'nan'
   OR Phone_Number = 'Nan';


--------------------------------------------------------------------------------
-- 12. Post-Cleaning Data Quality & Audit Check
--------------------------------------------------------------------------------
-- Calculate missing value percentages across critical columns
SELECT 
    (COUNT(*) - COUNT(Age)) * 100.0 / COUNT(*) AS Missing_Age_Percentage,
    (COUNT(*) - COUNT(Condition)) * 100.0 / COUNT(*) AS Missing_Condition_Percentage
FROM HealthCare;