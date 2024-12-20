SELECT t.origin_station_complex_name as origin_name,
    t.destination_station_complex_name as dest_name,
    os.burough as origin_burough,
    ds.burough as dest_burough,
    COUNT(*) as rides
FROM subway_trips t
JOIN subway_stations os
    ON os.complex_id = t.origin_station_complex_id
JOIN subway_stations ds
    ON ds.complex_id = t.destination_station_complex_id
WHERE day_of_week IN ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
    AND hour_of_day IN (7, 8, 9, 10, 16, 17, 18, 19, 20)
GROUP BY
    t.origin_station_complex_name,
    t.destination_station_complex_name,
    os.burough,
    ds.burough