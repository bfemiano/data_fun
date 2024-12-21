# mta open data project

Playing around with the open MTA datasets.

Follow the below sections to run the get the data, run ingest, and perform analysis.

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

Open `./ingest/stage_all.sql` and change the paths from `/Users/bfemiano/dev/mta_open_data_project/data`
to wherever you downloaded the CSV data. 

You also will have to change the file names if the randomized suffix from the API is different (I just renamed and remove it.)

Run `./ingest/stage_all.sql`

This will load each of the staging tables from the raw CSV files.

## Load staging data to base tables.

Run each of the four load scripts under `./ingest/`

This will take the data from the staging tables and load into the final tables that
contain more useful datatypes for numeric, timestamp, and geospatial.

## Analysis

Run each of the queries under `./analysis`

### Violent arrests by station

Number of violent arrests near station. Definition of near a station is any arrest
within 0.25miles (400m) of the station.

The defintion of 'violent' I just eyed the distinct values of pd_desc and chose some at random.
I probably left some out by accident.

### Coffee badging

Look at morning commuting hours and Origin/Dest pairs (BK origin and M in dest) join to their inverse pair (M in origin and BK in dest) within the same hour or next hour. 

I.E:
 7 --> join to hour 7 and 8
 8 --> 8, 9
 9 --> 9, 10.
 10 --> 10,11.

Look at the origin dest ridership for each hour compared to the inverse ridership in that same period.

Similiar ridership numbers might indicate coffe badging hotspots.

Note: This methodology is very flawed for a multitude of reasons, but fun to experiement with.

### Ridership by fare class per hour

Very simple analysis that looks at how many riders across the different fare classes occur, broken out by hour of day. 

### Top origin-dest during commute hours

Commute hours defined as M - F 7-10am and 4-7pm. What are the top origin/dest (with burough included)

The dataset is broken out by day of week and hour of day, so group by the origin/dest pairs
and sum ridership get a total across all the days and hours of interest.

### Average distance of trips by day, hour. 

What's the average distance between origin/dest pairs in meters for a given day of the week and hour of day?

## Metabase plot

TODO