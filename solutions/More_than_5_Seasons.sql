--8. List all TV shows with more than 5 seasons
SELECT 
    type,
    title,
    duration
FROM netflix
WHERE type = 'TV Show' 
AND SPLIT_PART(duration,' ',1):: NUMERIC > 5 
ORDER BY SPLIT_PART(duration,' ',1):: NUMERIC DESC
LIMIT 10


