DROP TABLE IF EXISTS subway_trips_staging;
CREATE TABLE subway_trips_staging (
    year TEXT,
    month TEXT,
    day_of_week TEXT,
    hour_of_day TEXT,
    timestamp TEXT,
    origin_station_complex_id TEXT,
    origin_station_complex_name TEXT,
    origin_latitude TEXT,
    origin_longitude TEXT,
    destination_station_complex_id TEXT,
    destination_station_complex_name TEXT,
    destination_latitude TEXT,
    destination_longitude TEXT,
    estimated_average_ridership TEXT,
    origin_point TEXT,
    destination_point TEXT
);


DROP TABLE IF EXISTS subway_trips;
CREATE TABLE subway_trips (
    year NUMERIC,
    month NUMERIC,
    day_of_week TEXT,
    hour_of_day NUMERIC,
    timestamp TIMESTAMP,
    origin_station_complex_id NUMERIC,
    origin_station_complex_name TEXT,
    origin_latitude NUMERIC,
    origin_longitude NUMERIC,
    destination_station_complex_id NUMERIC,
    destination_station_complex_name TEXT,
    destination_latitude NUMERIC,
    destination_longitude NUMERIC,
    estimated_average_ridership NUMERIC,
    origin_point POINT,
    destination_point POINT
);