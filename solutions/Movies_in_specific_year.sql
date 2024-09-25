--3. List all movies released in a specific year (e.g., 2020)

SELECT 
    title,
    type,
    release_year   
FROM netflix
WHERE 
    type =  'Movie'
    AND release_year = 2020

