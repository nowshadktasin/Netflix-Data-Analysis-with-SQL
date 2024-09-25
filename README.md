
# Introduction  
🎬 **Welcome to the Netflix Movie Database Analysis Project!** This project dives deep into Netflix’s expansive content library to uncover fascinating insights, including:  
- The count of movies vs. TV shows 🎥📺  
- Top content-producing countries 🌍  
- The longest movie on Netflix ⏳  
- Common themes like violence and crime in content descriptions 🔪  

🔎 **Curious about the SQL queries behind the analysis?** Check them out here: [project_sql folder](/sql_load/project_sql/)

# Background  
Inspired by the enormous variety of content on Netflix, this project was designed to reveal interesting patterns and trends in the streaming giant's movie and TV show library. By analyzing key aspects such as release dates, directors, genres, and more, the project aims to highlight critical insights about content production and viewing trends.

The data in this project is structured and analyzed using SQL queries to derive insights on ratings, genres, directors, actors, and more. It’s perfect for anyone curious about how Netflix’s global content library breaks down!

### The Questions I set out to answer through my SQL Queries:  
- [Count the number of Movies vs TV Shows](/solutions/Count_TV_Shows.sql)  
- [What is the most common rating for movies and TV shows?](/Common_Rating.sql)  
- [List all movies released in a specific year (e.g., 2020)](/Movies_in_specific_year.sql)  
- [Which countries have the most content on Netflix?](/sql_load/project_sql/4_top_countries_with_content.sql)  
- [Identify the longest movie](/sql_load/project_sql/5_longest_movie.sql)  
- [Find content added in the last 5 years](/sql_load/project_sql/6_recently_added_content.sql)  
- [Find movies/TV shows by director 'Rajiv Chilaka'](/sql_load/project_sql/7_rajiv_chilaka_content.sql)  
- [List TV shows with more than 5 seasons](/sql_load/project_sql/8_tv_shows_more_than_5_seasons.sql)  
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

The query groups the content by its type (either "Movie" or "TV Show") and counts the number of occurrences for each.

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

The query ranks each rating within its content type (Movies or TV Shows) based on how frequently they appear and filters out the most common rating for each type.

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

This query filters the Netflix content to show only movies released in the specific year 2020.

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
