--7. Find all the movies/TV shows by director 'Rajiv Chilaka'

SELECT 
    type,
    title,
    director
FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%'
ORDER BY title DESC
LIMIT 5
