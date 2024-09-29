--11. List all movies that are documentaries

SELECT
    type,
    title,
    listed_in AS genre
FROM netflix
WHERE type = 'Movie' AND
listed_in ILIKE '%Documentaries%'
LIMIT 10