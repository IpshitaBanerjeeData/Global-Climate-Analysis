import pandas as pd

# Load the datasets
try:
    df_nasa = pd.read_csv('GLB.Ts+dSST.csv', skiprows=1)
    df_owid = pd.read_csv('owid-co2-data.csv')
except FileNotFoundError:
    print("Error: Make sure GLB.Ts+dSST.csv and owid-co2-data.csv are in the same directory.")
    exit()

# Clean and Prepare the NASA GISS dataset
df_nasa = df_nasa.rename(columns={'J-D': 'temp_anomaly_annual'})
df_nasa = df_nasa[['Year', 'temp_anomaly_annual']]
df_nasa['temp_anomaly_annual'] = pd.to_numeric(df_nasa['temp_anomaly_annual'], errors='coerce')

# Clean and Prepare the OWID dataset
df_owid = df_owid[df_owid['country'] == 'World']
df_owid = df_owid[['year', 'co2']]
df_owid = df_owid.rename(columns={'year': 'Year', 'co2': 'total_co2_emissions'})
df_owid = df_owid.fillna(method='ffill')

# Merge the two datasets on the 'Year' column
df_merged = pd.merge(df_nasa, df_owid, on='Year')
df_merged = df_merged.dropna()

print("--- Final Merged Dataset Head ---")
print(df_merged.head())
print("\n--- Final Merged Dataset Info ---")
print(df_merged.info())

# Save the merged DataFrame to a new CSV file
df_merged.to_csv('cleaned_global_climate_data.csv', index=False)
print("\nMerged dataset saved to cleaned_global_climate_data.csv.")

import sqlite3

# Define the database file name
db_file = 'climate_data.db'

# Create a connection to the SQLite database file
# If the file does not exist, it will be created automatically
conn = sqlite3.connect(db_file)

# Use the pandas .to_sql() function to save the DataFrame to a table
# The 'if_exists' parameter will replace the table if it already exists
df_merged.to_sql('global_climate_data', conn, if_exists='replace', index=False)

# Close the connection
conn.close()

print(f"\nData successfully loaded into the SQLite database file: {db_file}")