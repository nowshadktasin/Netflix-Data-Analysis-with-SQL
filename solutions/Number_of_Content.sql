--9. Count the number of content items in each genre

SELECT 
    TRIM(UNNEST(STRING_TO_ARRAY(listed_in,','))) AS genre,
    COUNT (*) AS count_of_contents
FROM netflix
GROUP BY 1
ORDER BY 2 DESC