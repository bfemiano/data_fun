SELECT day_of_week, 
    hour_of_day,
    AVG(ST_Distance(t.origin_point, t.destination_point)) as avg_dist
FROM subway_trips t
WHERE t.origin_point is not null and t.destination_point is not null
GROUP BY day_of_week, hour_of_day;