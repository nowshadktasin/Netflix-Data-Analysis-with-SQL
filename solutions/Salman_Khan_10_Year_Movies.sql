--13. Find how many movies actor 'Salman Khan' appeared in last 10 years
SELECT 
    title,
    casts,
    release_year
FROM netflix
WHERE casts LIKE '%Salman Khan%'
AND release_year >= EXTRACT(YEAR FROM CURRENT_DATE) -10 