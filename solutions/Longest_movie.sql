--5. Identify the longest movie

WITH movie_durations AS (
    SELECT DISTINCT 
        title AS movie,
        SPLIT_PART(duration, ' ', 1) :: NUMERIC AS duration
    FROM netflix
    WHERE type = 'Movie'
)
SELECT *
FROM movie_durations
WHERE duration = (
    SELECT MAX(SPLIT_PART(duration, ' ', 1) :: NUMERIC)
    FROM netflix
    WHERE type = 'Movie'
);

