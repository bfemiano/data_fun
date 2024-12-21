WITH leave_at_7 AS (
    SELECT 
        t1.origin_station_complex_name as leave_home_station, 
        t1.destination_station_complex_name as arrive_at_work_station,
        t2.origin_station_complex_name as leaving_work_station, 
        t2.destination_station_complex_name as back_home_station,
        SUM(t1.estimated_average_ridership) as ridership_to_work,
        SUM(t2.estimated_average_ridership) as ridership_leaving_work,
        ABS(SUM(t1.estimated_average_ridership) - SUM(t2.estimated_average_ridership)) as inverse_delta
    FROM subway_trips t1, subway_trips t2
    WHERE t1.origin_station_complex_id = t2.destination_station_complex_id 
    AND t1.destination_station_complex_id = t2.origin_station_complex_id
    AND t1.day_of_week = t2.day_of_week
    AND t1.day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
    AND t1.hour_of_day = 7
    AND t2.hour_of_day IN (7, 8)
    GROUP BY 
        t1.origin_station_complex_name, 
        t1.destination_station_complex_name,
        t2.origin_station_complex_name,
        t2.destination_station_complex_name
),
leave_at_8 AS (
    SELECT 
        t1.origin_station_complex_name as leave_home_station, 
        t1.destination_station_complex_name as arrive_at_work_station,
        t2.origin_station_complex_name as leaving_work_station, 
        t2.destination_station_complex_name as back_home_station,
        SUM(t1.estimated_average_ridership) as ridership_to_work,
        SUM(t2.estimated_average_ridership) as ridership_leaving_work,
        ABS(SUM(t1.estimated_average_ridership) - SUM(t2.estimated_average_ridership)) as inverse_delta
    FROM subway_trips t1, subway_trips t2
    WHERE t1.origin_station_complex_id = t2.destination_station_complex_id 
    AND t1.destination_station_complex_id = t2.origin_station_complex_id
    AND t1.day_of_week = t2.day_of_week
    AND t1.day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
    AND t1.hour_of_day = 8
    AND t2.hour_of_day IN (8, 9)
    GROUP BY 
        t1.origin_station_complex_name, 
        t1.destination_station_complex_name,
        t2.origin_station_complex_name,
        t2.destination_station_complex_name
),
leave_at_9 AS (
    SELECT 
        t1.origin_station_complex_name as leave_home_station, 
        t1.destination_station_complex_name as arrive_at_work_station,
        t2.origin_station_complex_name as leaving_work_station, 
        t2.destination_station_complex_name as back_home_station,
        SUM(t1.estimated_average_ridership) as ridership_to_work,
        SUM(t2.estimated_average_ridership) as ridership_leaving_work,
        ABS(SUM(t1.estimated_average_ridership) - SUM(t2.estimated_average_ridership)) as inverse_delta
    FROM subway_trips t1, subway_trips t2
    WHERE t1.origin_station_complex_id = t2.destination_station_complex_id 
    AND t1.destination_station_complex_id = t2.origin_station_complex_id
    AND t1.day_of_week = t2.day_of_week
    AND t1.day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
    AND t1.hour_of_day = 9
    AND t2.hour_of_day IN (9, 10)
    GROUP BY 
        t1.origin_station_complex_name, 
        t1.destination_station_complex_name,
        t2.origin_station_complex_name,
        t2.destination_station_complex_name
),
leave_at_10 AS (
    SELECT 
        t1.origin_station_complex_name as leave_home_station, 
        t1.destination_station_complex_name as arrive_at_work_station,
        t2.origin_station_complex_name as leaving_work_station, 
        t2.destination_station_complex_name as back_home_station,
        SUM(t1.estimated_average_ridership) as ridership_to_work,
        SUM(t2.estimated_average_ridership) as ridership_leaving_work,
        ABS(SUM(t1.estimated_average_ridership) - SUM(t2.estimated_average_ridership)) as inverse_delta
    FROM subway_trips t1, subway_trips t2
    WHERE t1.origin_station_complex_id = t2.destination_station_complex_id 
    AND t1.destination_station_complex_id = t2.origin_station_complex_id
    AND t1.day_of_week = t2.day_of_week
    AND t1.day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
    AND t1.hour_of_day = 10
    AND t2.hour_of_day IN (10, 11)
    GROUP BY 
        t1.origin_station_complex_name, 
        t1.destination_station_complex_name,
        t2.origin_station_complex_name,
        t2.destination_station_complex_name
)
SELECT 
    l7.leave_home_station, 
    l7.arrive_at_work_station, 
    l7.inverse_delta + l8.inverse_delta + l9.inverse_delta + l10.inverse_delta AS inverse_commute_delta
FROM leave_at_7 l7
JOIN leave_at_8 l8
  ON l7.leave_home_station = l8.leave_home_station 
  AND l7.arrive_at_work_station = l8.arrive_at_work_station
JOIN leave_at_9 l9
  ON l8.leave_home_station = l9.leave_home_station 
  AND l8.arrive_at_work_station = l9.arrive_at_work_station
JOIN leave_at_10 l10
  ON l9.leave_home_station = l10.leave_home_station 
  AND l9.arrive_at_work_station = l10.arrive_at_work_station
ORDER BY inverse_commute_delta ASC
LIMIT 50;
