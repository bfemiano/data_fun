SELECT fare_class_category, 
    EXTRACT(HOUR from transit_timestamp) as hour_of_day, 
    SUM(ridership) as total_ridership
FROM subway_entries
GROUP BY fare_class_category, 
   EXTRACT(HOUR from transit_timestamp)
ORDER BY hour_of_day, total_ridership DESC;