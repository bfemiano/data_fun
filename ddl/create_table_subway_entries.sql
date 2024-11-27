DROP TABLE IF EXISTS subway_entries_staging;
CREATE TABLE subway_entries_staging (
    transit_timestamp TEXT,
    transit_mode TEXT,
    station_complex_id TEXT,
    station_complex TEXT,
    borough TEXT,
    payment_method TEXT,
    fare_class_category TEXT,
    ridership TEXT,
    transfers TEXT,
    latitude TEXT,
    longitude TEXT,
    georeference TEXT
);

DROP TABLE IF EXISTS subway_entries;
CREATE TABLE subway_entries (
    transit_timestamp TIMESTAMP,
    transit_mode TEXT,
    station_complex_id TEXT,
    station_complex TEXT,
    borough TEXT,
    payment_method TEXT,
    fare_class_category TEXT,
    ridership NUMERIC,
    transfers NUMERIC,
    latitude NUMERIC,
    longitude NUMERIC,
    georeference POINT
);
