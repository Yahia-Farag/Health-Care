# 🏥 Healthcare Data Cleaning & Auditing Project

A professional, end-to-end data cleaning, auditing, and business intelligence project using **T-SQL (SQL Server)** and **Power BI** to transform a messy healthcare dataset into a reliable, analytics-ready format.

---

## 📂 Repository Structure & Project Files

This repository contains all necessary resources to run, review, and interact with the project:

* 📊 **Interactive Power BI Report:** [`HealthCare.pbix`](./HealthCare.pbix) *(Download & open in Power BI Desktop for full interactivity)*
* 📜 **SQL Cleaning Script:** [`Health Care.sql`](./Health%20Care.sql) *(T-SQL script for data auditing, missing value replacements, and type conversions)*
* 📂 **Dataset:** [`Healthcare_Messy_Data.csv`](./Healthcare_Messy_Data.csv) *(Raw, uncleaned healthcare dataset)*
* 🖼️ **Executive Dashboard:** High-resolution preview screenshot included below.

---

## 📌 Project Overview
Real-world data is rarely clean. This project focuses on identifying anomalies, handling missing values, standardizing data types, and implementing data governance best practices using manual SQL verification rather than destructive automated tools. The cleaned dataset is prepared and integrated into **Power BI** for advanced healthcare analytics.

---

## 🔍 Key Data Cleaning Steps (T-SQL Implementation)

1. **Database Setup & Record Count:**
   - Established the environment and audited initial record counts.

2. **Standardizing Text Cases:**
   - Converted the `Medication` column to lowercase for consistency across categories.

3. **Handling Missing & Invalid Text Values:**
   - Replaced placeholder values (`'nan'`, `'NaN'`, `''`) with true SQL `NULL` values across columns like `Age`, `Email`, `Phone_Number`, `Blood_Pressure`, and `Cholesterol` to prevent skewed analytical results.
   - Fixed textual string numbers in the `Age` column (e.g., converting `'Forty'` to `40`).

4. **Data Type Conversions:**
   - Altered table constraints (`ALTER TABLE`) to permit `NULL` values before executing data updates.
   - Successfully converted column data types (`Age` to `INT`, `Visit_Date` to `DATE`, and `Cholesterol` to `FLOAT`) after ensuring all textual errors and anomalies were cleaned.

5. **Cleaning Contact Information:**
   - Standardized fake or dummy phone number patterns (e.g., repeating sequences) and placeholder emails to `NULL` to ensure accurate communication analytics.

6. **Data Quality Audit:**
   - Executed validation queries to compute missing value percentages and verify data integrity post-cleaning.

---

## 📊 Dashboard Preview

Below is a high-resolution snapshot of the interactive **Power BI** executive dashboard built on top of the cleaned healthcare dataset:

### 🏥 Healthcare Analytics Overview
![Healthcare Analytics Dashboard](./HealthCare%20Analytics%20Dashboard.png)

---

## 🛠️ Technologies Used
- **SQL Server (T-SQL):** Data exploration, manipulation, constraints alteration, and schema cleaning via `Health Care.sql`.
- **Power BI Desktop:** Dynamic dashboarding, KPI tracking, and analytical visualization via `HealthCare.pbix`.
- **Git & GitHub:** Version control, structured repository organization, and professional portfolio documentation.

---

## 🚀 How to Run & Use
1. **Clone or Download:** Clone this repository to your local machine.
2. **Database Setup:** Import the [`Healthcare_Messy_Data.csv`](./Healthcare_Messy_Data.csv) dataset into your SQL Server database.
3. **Execute Cleaning Pipeline:** Run the [`Health Care.sql`](./Health%20Care.sql) script sequentially to execute the full data auditing and cleaning pipeline.
4. **Interactive Dashboard:** Download and open the [`HealthCare.pbix`](./HealthCare.pbix) file in **Power BI Desktop** to explore the visualizations and interact with the cleaned data directly.
