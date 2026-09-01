WITH query AS (
    SELECT
        COUNT(*) AS count_of_trips,
        start_station_id
    FROM
        {{ ref('new_columns')}}
    GROUP BY
        start_station_id
    ORDER BY
        count_of_trips DESC
)

SELECT
    *
FROM
    query