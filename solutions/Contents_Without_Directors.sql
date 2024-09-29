--12. Find all content without a director

SELECT
    type,
    title,
    director
FROM netflix
WHERE director IS NULL
LIMIT 10
