WITH query AS (
    SELECT
        COUNT(*) AS count,
        day_of_wk_started,
        member_casual
    FROM
        {{ ref('new_columns') }}
    GROUP BY
        day_of_wk_started,
        member_casual
    ORDER BY
        count DESC
)

SELECT
    *
FROM
    query