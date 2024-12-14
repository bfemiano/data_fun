DROP TABLE IF EXISTS subway_stations_staging;
CREATE TABLE subway_stations_staging (
    complex_id TEXT,
    is_complex TEXT,
    number_of_stations_in_complex TEXT,
    stop_name TEXT,
    display_name TEXT,
    constituent_station_names TEXT,
    station_ids TEXT,
    gtfs_stop_ids TEXT,
    borough TEXT,
    cbd TEXT,
    daytime_routes TEXT,
    structure_type TEXT,
    latitude TEXT,
    longitude TEXT,
    ada TEXT,
    ada_notes TEXT
);


DROP TABLE IF EXISTS subway_stations;
CREATE TABLE subway_stations (
    complex_id NUMERIC,
    is_complex TEXT,
    number_of_stations_in_complex TEXT,
    stop_name TEXT,
    display_name TEXT,
    constituent_station_names TEXT,
    station_ids TEXT,
    gtfs_stop_ids TEXT,
    borough TEXT,
    cbd TEXT,
    daytime_routes TEXT,
    structure_type TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    georeference POINT,
    ada TEXT,
    ada_notes TEXT
);


CREATE INDEX stations_geo ON subway_stations USING gist (georeference);