INSERT INTO subway_entries (
    transit_timestamp,
    latitude,
    longitude,
    georeference,
    transit_mode,
    station_complex_id,
    station_complex,
    borough,
    payment_method,
    fare_class_category,
    ridership,
    transfers
)
SELECT
    transit_timestamp::TIMESTAMP,
    latitude::NUMERIC,
    longitude::NUMERIC,
    CASE
        WHEN georeference IS NOT NULL THEN REPLACE(REPLACE(georeference, 'POINT ', ''), ' ', ',')::POINT
        ELSE NULL
    END as georeference,
    transit_mode,
    station_complex_id,
    station_complex,
    borough,
    payment_method,
    fare_class_category,
    ridership::NUMERIC,
    transfers::NUMERIC
FROM
    subway_entries_staging;
