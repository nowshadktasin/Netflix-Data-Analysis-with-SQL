--6. Find content added in the last 5 years
SELECT 
    type,
    title,
    date_added
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL'5 years'
AND date_added IS NOT NULL
ORDER BY TO_DATE(date_added, 'Month DD, YYYY') DESC 



