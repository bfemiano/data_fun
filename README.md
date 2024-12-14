# mta open data project
For messing around

Follow the below sections to run the analysis.

# Get the data:

Note: The hourly ridership and origin/destination datasets I only got small partial downloads and are thus very incomplete. The bulk downloads timed out and I didnt' feel like building a loader that could crawl their API with a valid token.

Download the CSV below datasets.

### Origin Destination
https://data.ny.gov/Transportation/MTA-Subway-Origin-Destination-Ridership-Estimate-2/uhf3-t34z/about_data

### Hourly ridership
https://data.ny.gov/Transportation/MTA-Subway-Hourly-Ridership-Beginning-July-2020/wujg-7c2s/about_data

### Arrests
https://data.cityofnewyork.us/Public-Safety/NYPD-Arrests-Data-Historic-/8h9b-rp9u/about_data

### Stations

https://data.ny.gov/Transportation/MTA-Subway-Stations-and-Complexes/5f5g-n3cz/about_data


## Install the psql client. 

```bash
brew install libpq
```

## Create the tables and indices

From within psql run the create table scripts under ./ddl

## Load data to staging tables

Having staging tables help simplify the bulk COPY steps.

Open ./ingest/stage_all.sql and change the paths from `/Users/bfemiano/dev/mta_open_data_project/data`
to wherever you downloaded the CSV data. 

You also will have to change the file names if the randomized suffix from the API is different (I just renamed and remove it.)

Run ./ingest/stage_all.sql

This will load each of the staging tables from the raw CSV files.

## Load staging data to base tables.

Run each of the four load scripts under ./ingest/

This will take the data from the staging tables and load into the final tables that 
contain more useful datatypes for numeric, timestamp, and geospatial.

## Analysis

### Violent arrests by station

