-- 1. Count the number of Movies vs TV Shows

SELECT 
type,
COUNT (type) as count
 FROM 
    netflix
 GROUP BY 
    type;
    
