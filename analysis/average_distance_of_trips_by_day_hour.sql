SELECT day_of_week, 
    hour_of_day,
    AVG(ST_Distance(ST_SetSRID(t.origin_point::geometry, 4326)::geography, 
                ST_SetSRID(t.destination_point::geometry, 4326)::geography)) as avg_dist
FROM subway_trips t
WHERE t.origin_point is not null and t.destination_point is not null
GROUP BY day_of_week, hour_of_day;