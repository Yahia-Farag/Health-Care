# 🏥 Healthcare Data Cleaning & Auditing Project

A professional, end-to-end data cleaning and auditing project using **T-SQL (SQL Server)** to transform a messy healthcare dataset into a reliable, analytics-ready format.

---

## 📌 Project Overview
Real-world data is rarely clean. This project focuses on identifying anomalies, handling missing values, standardizing data types, and implementing data governance best practices using manual SQL verification rather than destructive automated tools. The cleaned dataset is prepared for integration into **Power BI** for advanced healthcare analytics.

---

## 📂 Project Structure
```text
Health-Care/
│
├── Healthcare_Messy_Data.csv   # Raw, uncleaned dataset containing real-world anomalies
├── Health Care.sql             # Comprehensive T-SQL cleaning and auditing script
└── README.md                   # Project documentation
🔍 Key Data Cleaning Steps (T-SQL Implementation)
Database Setup & Record Count:

Established the environment and audited initial record counts.

Standardizing Text Cases:

Converted the Medication column to lowercase for consistency across categories.

Handling Missing & Invalid Text Values:

Replaced placeholder values ('nan', 'NaN', '') with true SQL NULL values across columns like Age, Email, Phone_Number, Blood_Pressure, and Cholesterol to prevent skewed analytical results.

Fixed textual string numbers in the Age column (e.g., converting 'Forty' to 40).

Data Type Conversions:

Altered table constraints (ALTER TABLE) to permit NULL values before executing data updates.

Successfully converted column data types (Age to INT, Visit_Date to DATE, and Cholesterol to FLOAT) after ensuring all textual errors and anomalies were cleaned.

Cleaning Contact Information:

Standardized fake or dummy phone number patterns (e.g., repeating sequences) and placeholder emails to NULL to ensure accurate communication analytics.

Data Quality Audit:

Executed validation queries to compute missing value percentages and verify data integrity post-cleaning.

🛠️ Technologies Used
SQL Server (T-SQL): Data exploration, manipulation, constraints alteration, and schema cleaning.

Git & GitHub: Version control and portfolio documentation.

🚀 How to Use
Clone or download this repository.

Import Healthcare_Messy_Data.csv into your SQL Server database.

Run the Health Care.sql script sequentially to execute the full data auditing and cleaning pipeline.
