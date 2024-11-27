\COPY arrests_staging FROM '/Users/bfemiano/dev/mta_open_data_project/data/NYPD_Arrests_Data__Historic.csv' DELIMITER ',' CSV HEADER

\COPY subway_trips_staging FROM '/Users/bfemiano/dev/mta_open_data_project/data/MTA_Subway_Origin-Destination_Ridership_Estimate__2023.csv' DELIMITER ',' CSV HEADER

\COPY subway_entries_staging FROM '/Users/bfemiano/dev/mta_open_data_project/data/MTA_Subway_Hourly_Ridership__Beginning_July_2020.csv' DELIMITER ',' CSV HEADER

\COPY stations FROM '/Users/bfemiano/dev/mta_open_data_project/data/MTA_Subway_Hourly_Ridership__Beginning_July_2020.csv' DELIMITER ',' CSV HEADER

