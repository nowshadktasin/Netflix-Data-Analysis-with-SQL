-- 2. Find the most common rating for movies and TV shows
SELECT  
    type,
    rating,
    count
FROM
    (SELECT
        type,
        rating,
        COUNT (*) as count,
        RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
    FROM netflix
    GROUP BY 1,2
    ) as Table1
    WHERE ranking = 1