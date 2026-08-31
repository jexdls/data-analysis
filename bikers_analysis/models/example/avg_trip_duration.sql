WITH query AS (
    SELECT
        COUNT(*) AS count_of_trips,
        AVG(trip_duration) as avg_trip_duration,
        MAX(trip_duration) as max_trip_duration,
        MIN(trip_duration) as min_trip_duration,
        member_casual
    FROM
        {{ ref('new_columns') }}
    GROUP BY
        member_casual
    ORDER BY
        avg_trip_duration DESC
)

SELECT 
    *
FROM 
    query