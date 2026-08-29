WITH query AS (
    SELECT
        AVG(trip_duration) as avg_trip_duration,
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