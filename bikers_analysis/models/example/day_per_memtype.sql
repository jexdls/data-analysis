WITH query AS (
    SELECT
        COUNT(*) AS count_of_trips,
        AVG(trip_duration) as avg_trip_duration,
        MAX(trip_duration) as max_trip_duration,
        MIN(trip_duration) as min_trip_duration,
        day_of_wk_started,
        member_casual
    FROM
        {{ ref('new_columns') }}
    GROUP BY
        day_of_wk_started,
        member_casual
    ORDER BY
        count_of_trips DESC
)

SELECT
    *
FROM
    query