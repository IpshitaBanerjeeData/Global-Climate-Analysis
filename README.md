# Global Climate Analysis

### **Project Overview**

This is a comprehensive, end-to-end data analysis project that explores the historical relationship between global temperature anomalies and CO2 emissions. The project demonstrates a full data pipeline, from data sourcing and cleaning to advanced analysis and professional visualization.

### **Key Findings**

* A strong visual correlation exists between global temperature anomalies and total CO2 emissions since 1880.
* While both metrics show a gradual increase throughout the 20th century, the rate of increase has accelerated dramatically since the 1970s.
* The analysis confirms a clear, long-term warming trend that is closely mirrored by the rise in CO2 emissions.

### **Tools and Technologies**

* **Python:** Used for data cleaning, preparation, and merging of disparate datasets.
* **Pandas:** The primary Python library used for data manipulation.
* **SQL (SQLite):** Utilized for data storage and to perform complex queries for analysis.
* **Tableau:** The main business intelligence tool used to create an interactive and professional dashboard.
* **Google Sheets:** Utilized for transparent project documentation and as a clear log of all data cleaning and transformation steps.

### **Project Structure & Files**

* `data_cleaning.py`: The Python script used to clean and merge the datasets.
* `cleaned_global_climate_data.csv`: The final, cleaned dataset.
* `climate_data.db`: The SQLite database file containing the cleaned data.
* `[Your Tableau Workbook Name].twbx`: The Tableau workbook containing all sheets and the final dashboard.
* `queries.sql`: A SQL script containing all of the analytical queries used in this project.

### **Documentation & Data Sources**

* **Data Documentation & Cleaning Log:** (https://docs.google.com/spreadsheets/d/1LoJWHgR90QtiVLOkVbUwLNmS4HoakTyCNiCYJzCG9MU/edit?usp=sharing)
* **Global Temperature Data:** [NASA Goddard Institute for Space Systems (GISS)](https://data.giss.nasa.gov/gistemp/) 
* **CO2 Emissions Data:** [Our World in Data (OWID)](https://ourworldindata.org/co2-and-greenhouse-gas-emissions)

### **Final Dashboard**

View the interactive dashboard on Tableau Public:
(https://public.tableau.com/app/profile/ipshita.banerjee/viz/TheClimateConnectionADataAnalysis/GlobalTemperatureCO2Analysis?publish=yes)
