--4. Find the top 5 countries with the most content on Netflix
SELECT *
FROM(
    SELECT
    TRIM(UNNEST(STRING_TO_ARRAY(country,','))) AS country,
    COUNT(*) AS count_of_content
    FROM netflix
    GROUP BY 1
)
as Table1
WHERE country IS NOT NULL
ORDER BY count_of_content DESC
LIMIT 5;
