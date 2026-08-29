WITH query AS (
    SELECT
        COUNT(*) as count,
        member_casual,
        rideable_type
    FROM
        schema.biking_data
    GROUP BY
        member_casual,
        rideable_type
)


SELECT
    *
FROM 
    query