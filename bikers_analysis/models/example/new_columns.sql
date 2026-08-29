WITH query AS(
    SELECT
        *,
        started_at::TIME >= '09:00:00'
            AND ended_at::TIME <= '18:00:00'
            AND ended_at::DATE = started_at::DATE AS is_trip_within_9_to_6,
        TO_CHAR(started_at, 'Day') AS day_of_wk_started,
        TO_CHAR(ended_at, 'Day') AS day_of_wk_ended,
        ended_at - started_at AS trip_duration,
        (ended_at - started_at)::TIME <= '01:00:00' AS is_trip_1hr_or_less
    FROM
        schema.biking_data
    ORDER BY
        trip_duration DESC
)

SELECT
    *
FROM
    query