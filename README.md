
# Introduction  
🎬 **Welcome to the Netflix Movie Database Analysis Project!** This project dives deep into Netflix’s expansive content library to uncover fascinating insights, including:  
- The count of movies vs. TV shows 🎥📺  
- Top content-producing countries 🌍  
- The longest movie on Netflix ⏳  
- Common themes like violence and crime in content descriptions 🔪  

🔎 **Curious about the SQL queries behind the analysis?** Check them out here: [solutions](/solutions)

# Background  
Inspired by the enormous variety of content on Netflix, this project was designed to reveal interesting patterns and trends in the streaming giant's movie and TV show library. By analyzing key aspects such as release dates, directors, genres, and more, the project aims to highlight critical insights about content production and viewing trends.

The data in this project is structured and analyzed using SQL queries to derive insights on ratings, genres, directors, actors, and more. It’s perfect for anyone curious about how Netflix’s global content library breaks down!

### The Questions I set out to answer through my SQL Queries:  
- [Count the number of Movies vs TV Shows](/solutions/Count_TV_Shows.sql)  
- [What is the most common rating for movies and TV shows?](/solutions/Common_Rating.sql)  
- [List all movies released in a specific year (e.g., 2020)](/solutions/Movies_in_specific_year.sql)  
- [Which countries have the most content on Netflix?](/solutions/Top_5_Countries.sql)  
- [What is the most common rating for movies and TV shows?](/solutions/Common_Rating.sql)  
- [List all movies released in a specific year (e.g., 2020)](/solutions/Movies_in_specific_year.sql)  
- [Which countries have the most content on Netflix?](/solutions/Top_5_Countries.sql)  
- [Identify the longest movie](/solutions/Longest_movie.sql)  
- [Find content added in the last 5 years](/solutions/New_Content_Last_5_Years.sql)  
- [Find movies/TV shows by director 'Rajiv Chilaka'](/solutions/Rajiv_Chilaka_Movies.sql)  
- [List TV shows with more than 5 seasons](/solutions/More_than_5_Seasons.sql)  
- [Count the number of content items per genre](/sql_load/project_sql/9_genre_counts.sql)  
- [Top 5 years with the highest content release in India](/sql_load/project_sql/10_india_content_release.sql)  
- [List all documentary movies](/sql_load/project_sql/11_documentaries.sql)  
- [Find all content without a director](/sql_load/project_sql/12_no_director_content.sql)  
- [How many movies has actor 'Salman Khan' appeared in the last 10 years?](/sql_load/project_sql/13_salman_khan_movies.sql)  
- [Top 10 actors in the most Indian movies](/sql_load/project_sql/14_top_actors_india_movies.sql)  
- [Categorize content based on keywords like 'kill' and 'violence'](/sql_load/project_sql/15_bad_good_content.sql)  

# Tools I used  
For my in-depth analysis of the Netflix Movie Database, I relied on the following key tools:  
- **SQL:** For writing queries and extracting insights from the database  
- **PostgreSQL:** My database management system of choice for efficient data handling  
- **Visual Studio Code:** Used for writing and running SQL scripts  
- **Git & GitHub:** Crucial for version control and collaboration, ensuring my SQL analysis is accessible and trackable  

---

## 1. Count of Movies vs TV Shows  
This query helped count the number of movies versus TV shows available in the Netflix database, offering insight into the distribution of content types.

```sql
SELECT 
    type,
    COUNT(type) AS count
FROM 
    netflix
GROUP BY 
    type;
```


### Explanation:
This query counts the number of **Movies** and **TV Shows** in the `netflix` table.

1. **`SELECT type`**: Retrieves the `type` column, which indicates whether the content is a Movie or TV Show.
2. **`COUNT(type) AS count`**: Counts the occurrences of each `type` (Movie or TV Show) and labels it as `count`.
3. **`FROM netflix`**: Specifies the source table for the data.
4. **`GROUP BY type`**: Groups the data by `type`, so the `COUNT()` function is applied to each distinct value (Movies and TV Shows).

This query helps analyze the distribution of content types in the dataset.


### Table: Count of Movies vs TV Shows on Netflix

| **Type**   | **Count** |
|------------|------------|
| Movie      | 6,131      |
| TV Show    | 2,676      |

*Table showing the number of movies and TV shows in the Netflix database.*

### Key Insights:

1. **Movies Dominance**:
   - **Movies** are the dominant type of content on Netflix, making up 6,131 entries, which is more than double the number of TV shows. This could indicate that Netflix offers a vast collection of movies to cater to its global audience.

2. **Significant TV Show Library**:
   - With **2,676** TV shows available, Netflix also maintains a strong focus on serialized content. This may highlight the platform’s strategy to encourage long-term engagement through episodic releases.

3. **Varied Content Strategy**:
   - The split between movies and TV shows suggests Netflix’s balanced approach to providing both short-form (movies) and long-form (TV shows) content, catering to a wide range of viewer preferences. While movies are more abundant, TV shows drive sustained viewership through series formats.

These insights help understand Netflix's content strategy, focusing on both volume (movies) and engagement (TV shows) to attract and retain a diverse audience base.

---

## 2. Most Common Rating for Movies and TV Shows  
This query helps identify the most frequently occurring content ratings for both movies and TV shows in Netflix’s library. The ratings provide insight into the type of content that dominates Netflix’s offerings.

```sql
SELECT  
    type,
    rating,
    count
FROM
    (SELECT
        type,
        rating,
        COUNT(*) as count,
        RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
    FROM netflix
    GROUP BY 1,2
    ) as Table1
WHERE ranking = 1;
```


### Explanation:
This query finds the **most common rating** for each content type (Movies and TV Shows).

1. **`SELECT type, rating, count`**: Retrieves the `type` (Movie or TV Show), `rating`, and the corresponding count of occurrences.
2. **`RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC)`**: This ranks the ratings within each content type (`Movie` or `TV Show`), ordering them by their count in descending order.
3. **`GROUP BY type, rating`**: Groups the data by both `type` and `rating`, so the count of each rating for each content type can be calculated.
4. **`WHERE ranking = 1`**: Filters the results to show only the top-ranked (most common) rating for each content type.

This query helps identify the most frequent rating for both Movies and TV Shows.

### Table: Most Common Ratings for Movies and TV Shows on Netflix

| **Type**   | **Rating** | **Count** |
|------------|------------|-----------|
| Movie      | TV-MA      | 2,062     |
| TV Show    | TV-MA      | 1,145     |

*Table showing the most frequent rating for movies and TV shows on Netflix.*

### Key Insights:

1. **TV-MA Dominance**:
   - The rating **TV-MA** (Mature Audience) is the most common for both movies and TV shows. This rating appears **2,062** times for movies and **1,145** times for TV shows, reflecting that a significant portion of Netflix’s content is targeted toward mature audiences.
  
2. **Content for Adults**:
   - The prevalence of the TV-MA rating highlights Netflix's focus on adult-oriented content, particularly in genres like drama, crime, and thriller, which often cater to mature viewers.

3. **Audience Preferences**:
   - Given that both movies and TV shows share the same most common rating, it suggests that Netflix tailors much of its library to a similar audience demographic, possibly to meet the preferences of binge-watchers and adult viewers who consume serialized content as well as standalone films.

This analysis demonstrates that mature-rated content plays a central role in Netflix's catalog, offering a variety of shows and films aimed at adult audiences.

--- 
## 3. Movies Released in 2020  
This query identifies all the movies that were released in the year 2020, helping us understand the volume and variety of content that Netflix added during that year.

```sql
SELECT 
    title,
    type,
    release_year
FROM 
    netflix
WHERE 
    type = 'Movie' 
    AND release_year = 2020;
```

### Explanation:
This query lists all **movies released in 2020** from the `netflix` table.

1. **`SELECT title, type, release_year`**: Retrieves the `title` of the content, its `type` (in this case, it will always be 'Movie'), and the `release_year`.
2. **`FROM netflix`**: Specifies the `netflix` table as the source of data.
3. **`WHERE type = 'Movie' AND release_year = 2020`**: Filters the data to include only content where the `type` is 'Movie' and the `release_year` is 2020.

This query helps find all the movies that were released in the year 2020.

### Table: Movies Released in 2020 on Netflix

| **Title**                                                     | **Type** | **Release Year** |
|---------------------------------------------------------------|----------|------------------|
| Dick Johnson Is Dead                                           | Movie    | 2020             |
| Europe's Most Dangerous Man: Otto Skorzeny in Spain            | Movie    | 2020             |
| Tughlaq Durbar                                                 | Movie    | 2020             |
| Omo Ghetto: the Saga                                           | Movie    | 2020             |
| Shadow Parties                                                 | Movie    | 2020             |
| Here and There                                                 | Movie    | 2020             |
| Shikara                                                        | Movie    | 2020             |
| Really Love                                                    | Movie    | 2020             |
| The Old Ways                                                   | Movie    | 2020             |
| A Faraway Land                                                 | Movie    | 2020             |

*Table showing a list of 10 movies released in 2020 on Netflix.*

### Key Insights:

1. **Diverse Movie Offerings**:
   - Netflix released a variety of movies in 2020, ranging from documentaries like **"Dick Johnson Is Dead"** to international films such as **"Tughlaq Durbar"** and **"A Faraway Land"**.

2. **International Productions**:
   - Several movies in this list, such as **"Tughlaq Durbar"** and **"Omo Ghetto: the Saga"**, indicate that Netflix continues to focus on global content, catering to diverse audiences.

3. **Variety of Genres**:
   - The range of movie types suggests that Netflix added content in multiple genres in 2020, providing options for different viewer preferences. From emotional dramas like **"Really Love"** to thrillers like **"The Old Ways"**, the diversity of content helped meet the varied tastes of its audience.

This analysis demonstrates Netflix’s continued investment in adding original and international movies to its platform, ensuring a wide array of content in 2020.

--- 

### 4. Top 5 Countries with the Most Content on Netflix

This query helps to identify the countries that contribute the most content to Netflix. By analyzing the country field, we split and clean the data to get a more accurate count for each individual country.

```sql
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
```

### Explanation:

1. **TRIM and UNNEST Functions**:
   - The `TRIM()` function is used to remove any leading or trailing spaces from the country names to ensure uniformity.
   - The `UNNEST()` function splits entries where multiple countries are listed, ensuring each country is treated individually.
   
2. **Grouping by Country**:
   - The query groups the cleaned country names and counts the number of content items (movies or TV shows) from each country.
   
3. **Top 5 Results**:
   - After cleaning and counting, the top 5 countries with the most Netflix content are displayed in descending order.

### Table of Top 5 Countries with the Most Content:

| **Country**       | **Count of Content** |
|-------------------|----------------------|
| United States      | 3,690                |
| India              | 1,046                |
| United Kingdom     | 806                  |
| Canada             | 445                  |
| France             | 393                  |

*Table: The top 5 countries contributing the most content on Netflix.*

### Key Insights:

1. **United States Leading the Way**:
   - The **United States** dominates Netflix's content library with 3,690 titles. This indicates the U.S. as the largest content producer on the platform, reflecting its robust entertainment industry.
   
2. **India’s Growing Contribution**:
   - **India** ranks second with 1,046 titles, showcasing the growing influence of Indian cinema and TV shows on the global stage, with platforms like Netflix contributing to its widespread reach.

3. **United Kingdom and Other Countries**:
   - **United Kingdom** follows with 806 titles, **Canada** with 445, and **France** with 393. These countries represent strong contributors to Netflix’s international catalog, highlighting their global media influence.

4. **Diversity of Content**:
   - The top 5 countries illustrate the diverse origins of Netflix content, with a mix of North American, European, and Asian countries. This diversity caters to a broad global audience and reflects Netflix’s strategy of acquiring and producing content from around the world.

This analysis provides a clear view of which countries dominate the Netflix content library, with the U.S. and India leading the charge.

---
### 5. Identify the Longest Movie

This query helps identify the longest movie available on Netflix based on its duration.

```sql
WITH movie_durations AS (
    SELECT DISTINCT 
        title AS movie,
        SPLIT_PART(duration, ' ', 1) :: NUMERIC AS duration
    FROM netflix
    WHERE type = 'Movie'
)
SELECT *
FROM movie_durations
WHERE duration = (
    SELECT MAX(SPLIT_PART(duration, ' ', 1) :: NUMERIC)
    FROM netflix
    WHERE type = 'Movie'
);
```

### Explanation:

This query uses a **Common Table Expression (CTE)** to extract the duration of each movie and find the movie with the maximum duration on Netflix. It splits the `duration` string (which typically looks like "312 min") and converts the numeric part into a numerical value to identify the longest movie.

### Result:

| **Movie**                       | **Duration (minutes)** |
|----------------------------------|------------------------|
| Black Mirror: Bandersnatch       | 312                    |

*Table showing the longest movie in the Netflix catalog*

### Key Insights:

1. **Black Mirror: Bandersnatch**:
   - The movie **"Black Mirror: Bandersnatch"** stands out as the longest movie in Netflix's catalog, with a runtime of **312 minutes** (5 hours and 12 minutes). This makes it one of the most unique interactive movies on the platform.

2. **Interactive Movie Format**:
   - As an interactive movie, **"Bandersnatch"** allows viewers to choose different narrative paths, contributing to its extended runtime. This could be a significant reason for its long duration.

This query successfully identifies the movie with the longest runtime, providing insights into the content available on Netflix and the varied formats that can lead to extended runtimes.

---
### 6. Find Content Added in the Last 5 Years

This query helps identify the movies and TV shows that were added to Netflix within the last five years. It retrieves the type of content, title, and the date it was added, providing insights into recent additions to the platform.

```sql
SELECT 
    type,
    title,
    date_added
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'
AND date_added IS NOT NULL
ORDER BY TO_DATE(date_added, 'Month DD, YYYY') DESC;
```

### Explanation:

This query filters out the Netflix content added in the past five years. The query uses the following logic:
1. **`TO_DATE(date_added, 'Month DD, YYYY')`**: This converts the `date_added` field from a string to a date format.
2. **`CURRENT_DATE - INTERVAL '5 years'`**: This checks if the content was added within the last 5 years, comparing it against the current date.
3. **`ORDER BY TO_DATE(date_added, 'Month DD, YYYY') DESC`**: This sorts the results in descending order, showing the most recent content first.

### Key Insights:

![Movies added in last 5 years](/assets/image(1).png)
*Here is a bar graph showing the number of movies added to Netflix by year for 2019, 2020, and 2021. The year 2020 had the highest number of movies added, with 1,879 movies.*

1. **Recent Additions**:
   - The query will list all movies and TV shows added to Netflix in the last five years. This can help track recent trends in content availability and the platform's focus on new content.

2. **Impact of Recent Content**:
   - Understanding which content was added in the last five years provides valuable insights into Netflix’s evolving content strategy and focus areas, such as particular genres, regions, or content types.

This analysis can help users or researchers examine how Netflix's library has grown in the recent past and track the most current additions.

---
### 7. Find All Movies/TV Shows by Director 'Rajiv Chilaka'

This query identifies all movies and TV shows on Netflix that are directed by **Rajiv Chilaka**. It retrieves the type of content, title, and the director's name, allowing us to explore the contributions of this director to the Netflix content library.

```sql
SELECT 
    type,
    title,
    director
FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%'
```

### Explanation:

This SQL query is designed to find content directed by **Rajiv Chilaka**, a prominent name known for creating popular animated shows and movies, particularly in Indian children's programming. The query includes:

1. **`ILIKE '%Rajiv Chilaka%'`**: This part of the query performs a case-insensitive search for the name "Rajiv Chilaka" within the `director` field. This ensures that any content where Chilaka is listed as a director will be retrieved, even if other co-directors are mentioned.
   
2. **Result Sorting**: The result displays the content type (whether it’s a movie or a TV show), the title, and the director's name.

### Key Insights:

1. **Content by Rajiv Chilaka**:
   - The query returns several animated movies directed by **Rajiv Chilaka**, such as *"Mighty Raju Rio Calling"* and *"Chhota Bheem: Journey to Petra"*. These results showcase Chilaka’s major contributions, particularly in children’s animated content.

2. **Collaborative Works**:
   - In some cases, the director collaborated with others, such as in *"Mighty Raju Rio Calling"*, where **Rajiv Chilaka** worked with **Anirban Majumder** and **Alka Amarkant Dubey**.

This analysis highlights Rajiv Chilaka’s impact on Netflix’s animated movie collection, with a focus on popular titles from the *Chhota Bheem* and *Mighty Raju* series.

---
### 8. List All TV Shows with More Than 5 Seasons

This query focuses on TV shows on Netflix that have more than 5 seasons, identifying the longest-running series available on the platform. The SQL query retrieves the type, title, and the number of seasons for each show, helping to explore the most established TV shows on Netflix.

```sql
SELECT 
    type,
    title,
    duration
FROM netflix
WHERE type = 'TV Show' 
AND SPLIT_PART(duration,' ',1):: NUMERIC > 5 
ORDER BY SPLIT_PART(duration,' ',1):: NUMERIC DESC
LIMIT 10
```

### Explanation:

1. **`SPLIT_PART(duration, ' ', 1)::NUMERIC`**: This part extracts the numeric portion of the `duration` column (which indicates the number of seasons) by splitting the string at the space and converting the result into a numeric value. This ensures that the query only considers the number of seasons when filtering the results.

2. **`> 5` Seasons**: This condition filters out any shows with 5 or fewer seasons, allowing us to focus only on long-running series.

3. **`LIMIT 10`**: The query limits the result to the top 10 longest-running shows on Netflix.

### Table of TV Shows with More Than 5 Seasons

| **Type**    | **Title**               | **Duration**   |
|-------------|-------------------------|----------------|
| TV Show     | Grey's Anatomy           | 17 Seasons     |
| TV Show     | Supernatural             | 15 Seasons     |
| TV Show     | NCIS                     | 15 Seasons     |
| TV Show     | Heartland                | 13 Seasons     |
| TV Show     | Red vs. Blue             | 13 Seasons     |
| TV Show     | COMEDIANS of the world   | 13 Seasons     |
| TV Show     | Criminal Minds           | 12 Seasons     |
| TV Show     | Trailer Park Boys        | 12 Seasons     |
| TV Show     | Frasier                  | 11 Seasons     |
| TV Show     | Cheers                   | 11 Seasons     |

*Table: The top 10 TV Shows with More Than 5 Seasons.*

### Key Insights:

1. **Long-running Series**:
   - *Grey's Anatomy* is one of the longest-running shows on Netflix, with an impressive **17 seasons**. Other top shows like *Supernatural* and *NCIS* follow closely with **15 seasons** each.
   
2. **Popular Genres**:
   - The list features a range of genres, including medical dramas (*Grey's Anatomy*), crime procedurals (*NCIS*, *Criminal Minds*), and comedy (*Cheers*, *Frasier*). This diversity indicates that long-running shows span various audience interests.

3. **Fan-favorite Shows**:
   - Shows like *Supernatural* and *Trailer Park Boys* have cultivated large fan bases, reflected in their ability to continue for many seasons.

This analysis highlights Netflix's vast collection of long-running TV shows, providing viewers with extensive content to enjoy over multiple seasons.

---

## 9. Count the Number of Content Items in Each Genre

This query was used to determine the distribution of content across various genres available on Netflix.


```sql
SELECT 
    TRIM(UNNEST(STRING_TO_ARRAY(listed_in,','))) AS genre,
    COUNT (*) AS count_of_contents
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
```
### Explanation:
- The query starts by using the `STRING_TO_ARRAY` function to split the **listed_in** column (which contains genres) by commas, and then uses `UNNEST` to expand this array into individual rows.
- The `TRIM` function is applied to remove any extra spaces from the genres.
- It counts the number of occurrences of each genre with `COUNT(*)` and groups them by the genre.
- The results are ordered by the number of content items in descending order to highlight the most common genres on Netflix.

### Table of Content Counts by Genre

| **Genre**                   | **Count of Contents** |
|-----------------------------|-----------------------|
| International Movies         | 2752                 |
| Dramas                       | 2427                 |
| Comedies                     | 1674                 |
| International TV Shows       | 1351                 |
| Documentaries                | 869                  |
| Action & Adventure           | 859                  |
| TV Dramas                    | 763                  |
| Independent Movies           | 756                  |
| Children & Family Movies     | 641                  |
| Romantic Movies              | 616                  |

*Table of the number of contents in the top 10 genres on Netflix*

### Key Insights:
1. **International Movies and TV Shows**:
   - **International Movies** top the list with 2752 content items, showing Netflix's strong focus on global cinema.
   - **International TV Shows** also appear prominently with 1351 items, reflecting the increasing demand for non-English content worldwide.

2. **Dramas**:
   - **Dramas** is another dominant genre with 2427 content items, suggesting that Netflix audiences have a strong preference for emotionally engaging and narrative-driven stories.

3. **Comedies** and **Action & Adventure**:
   - **Comedies** rank third with 1674 titles, while **Action & Adventure** stands at 859, highlighting a balance between humor and high-energy content on Netflix's platform.

4. **Documentaries**:
   - With 869 titles, **Documentaries** showcase Netflix's commitment to providing educational and informative content.

This breakdown helps understand the content focus of Netflix, with International Movies and Dramas being the most prominent genres, followed by Comedies and a variety of other genres that cater to diverse audience preferences.

---
