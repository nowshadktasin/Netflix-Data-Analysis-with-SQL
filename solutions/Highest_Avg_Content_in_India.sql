--10.Find each year and the average numbers of content release in India on netflix. 
--Return top 5 year with highest average content release.
SELECT
    EXTRACT(YEAR FROM(TO_DATE(date_added, 'Month DD,YYYY'))) as added_year,
    COUNT(*) as count_of_content,
    ROUND(
        COUNT(*)::numeric/
        (SELECT COUNT(*)FROM netflix WHERE country LIKE '%India%')::numeric*100,2) 
        as average_content_in_a_year
FROM netflix
WHERE country LIKE '%India%'
GROUP BY added_year
ORDER BY average_content_in_a_year DESC
LIMIT 5