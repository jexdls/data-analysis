WITH query AS (
    SELECT
        COUNT(*) as count_of_trips,
        AVG(trip_duration) as avg_trip_duration,
        MAX(trip_duration) as max_trip_duration,
        MIN(trip_duration) as min_trip_duration,
        member_casual,
        rideable_type
    FROM
        {{ ref('new_columns') }}
    GROUP BY
        member_casual,
        rideable_type
)


SELECT
    *
FROM 
    query