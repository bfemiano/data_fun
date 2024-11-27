INSERT INTO subway_trips (
    year,
    month,
    day_of_week,
    hour_of_day,
    timestamp,
    origin_station_complex_id,
    origin_station_complex_name,
    origin_latitude,
    origin_longitude,
    destination_station_complex_id,
    destination_station_complex_name,
    destination_latitude,
    destination_longitude,
    estimated_average_ridership,
    origin_point,
    destination_point
)
SELECT
    year::NUMERIC,
    month::NUMERIC,
    day_of_week,
    hour_of_day::NUMERIC,
    timestamp::TIMESTAMP,
    origin_station_complex_id::NUMERIC,
    origin_station_complex_name,
    origin_latitude::NUMERIC,
    origin_longitude::NUMERIC,
    destination_station_complex_id::NUMERIC,
    destination_station_complex_name,
    destination_latitude::NUMERIC,
    destination_longitude::NUMERIC,
    estimated_average_ridership::NUMERIC,
    REPLACE(REPLACE(origin_point, 'POINT ', ''), ' ', ',')::POINT,
    REPLACE(REPLACE(destination_point, 'POINT ', ''), ' ', ',')::POINT
   
FROM
    subway_trips_staging;