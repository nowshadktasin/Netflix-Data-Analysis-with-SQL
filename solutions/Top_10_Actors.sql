/* 14. Find the top 10 actors who have appeared in the highest number 
of movies produced in India.*/
SELECT
    TRIM(UNNEST(STRING_TO_ARRAY(casts,','))) AS actors,
    COUNT (*) as count_of_movies
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10


SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10
