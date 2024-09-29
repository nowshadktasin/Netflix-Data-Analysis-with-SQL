# Netflix Movies and TV Shows Data Analysis using SQL

![](/assets/logo.png)


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
- [Count the number of content items per genre](/solutions/Number_of_Content.sql)  
- [Top 5 years with the highest content release in India](/solutions/Highest_Avg_Content_in_India.sql)  
- [List all documentary movies](/solutions/All_Documentaries.sql)  
- [Find all content without a director](/solutions/Contents_Without_Directors.sql)  
- [How many movies has actor 'Salman Khan' appeared in the last 10 years?](/solutions/Salman_Khan_10_Year_Movies.sql)  
- [Top 10 actors in the most Indian movies](/solutions/Top_10_Actors.sql)  
- [Categorize content based on keywords like 'kill' and 'violence'](/solutions/Bad_Good_content.sql)  

# Tools I used  
For my in-depth analysis of the Netflix Movie Database, I relied on the following key tools:  
- **SQL:** For writing queries and extracting insights from the database  
- **PostgreSQL:** My database management system of choice for efficient data handling  
- **Visual Studio Code:** Used for writing and running SQL scripts  
- **Git & GitHub:** Crucial for version control and collaboration, ensuring my SQL analysis is accessible and trackable  

---

## Schema

```sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```
## Explanation of the Schema

The schema provided defines a table named **`netflix`**, which is designed to store detailed information about various shows and movies available on the Netflix platform. Here’s a breakdown of each column in the table:

1. **show_id (VARCHAR(5))**:
   - A unique identifier for each show or movie in the database. This ID is critical for referencing specific content.

2. **type (VARCHAR(10))**:
   - Specifies the category of the content, which can be either **"Movie"** or **"TV Show"**. This distinction is essential for filtering and analyzing different types of content.

3. **title (VARCHAR(250))**:
   - The name of the show or movie. This column stores up to 250 characters, allowing for comprehensive titles.

4. **director (VARCHAR(550))**:
   - The name(s) of the director(s) involved in creating the content. It can accommodate multiple directors if needed, up to 550 characters.

5. **casts (VARCHAR(1050))**:
   - A list of actors and actresses featured in the show or movie. This field can store extensive information (up to 1050 characters) about the cast.

6. **country (VARCHAR(550))**:
   - Indicates the country or countries where the content was produced. This is useful for categorizing content based on geographical origin.

7. **date_added (VARCHAR(55))**:
   - The date when the show or movie was added to the Netflix platform. Stored as a string for flexibility in formatting.

8. **release_year (INT)**:
   - The year in which the show or movie was originally released. This integer format allows for straightforward numerical operations, such as filtering by release date.

9. **rating (VARCHAR(15))**:
   - The content rating assigned to the show or movie (e.g., PG, R, TV-MA). This provides insight into the target audience and age appropriateness.

10. **duration (VARCHAR(15))**:
    - For movies, this indicates the total runtime (e.g., 90 minutes), while for TV shows, it typically represents the length of one episode.

11. **listed_in (VARCHAR(250))**:
    - Categories or genres that describe the content (e.g., "Action & Adventure," "Documentaries"). This field aids in organizing content for easy discovery by users.

12. **description (VARCHAR(550))**:
    - A brief summary of the show or movie, providing potential viewers with an overview of the content. This allows up to 550 characters for a concise yet informative description.

# Business Problems and Solutions
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
## 10. Top 5 Years with the Highest Average Content Releases in India

This query was used to find the top 5 years with the highest average percentage of Netflix content added from India, providing insights into Netflix's content growth in the region over the years.

### Code Explanation:
```sql
SELECT
    EXTRACT(YEAR FROM(TO_DATE(date_added, 'Month DD,YYYY'))) as added_year,
    COUNT(*) as count_of_content,
    ROUND(
        COUNT(*)::numeric /
        (SELECT COUNT(*) FROM netflix WHERE country LIKE '%India%')::numeric * 100, 2) 
        as average_content_in_a_year
FROM netflix
WHERE country LIKE '%India%'
GROUP BY added_year
ORDER BY average_content_in_a_year DESC
LIMIT 5;
```
- The query starts by extracting the year from the **date_added** field using the `EXTRACT` function after converting it to a date format.
- It counts the number of content items added for each year (`count_of_content`) where the country field contains 'India'.
- The query then calculates the average percentage of content added in a year by dividing the yearly count by the total number of Indian content on Netflix, multiplied by 100.
- The results are grouped by the year of addition and ordered by the highest average content percentage, with the top 5 results displayed.

### Table of Top 5 Years with the Highest Average Content Releases in India

| **Added Year** | **Count of Content** | **Average Content in a Year (%)** |
|----------------|----------------------|-----------------------------------|
| 2018           | 349                  | 33.37                            |
| 2019           | 218                  | 20.84                            |
| 2020           | 199                  | 19.02                            |
| 2017           | 162                  | 15.49                            |
| 2021           | 105                  | 10.04                            |

*Table of the top 5 years with the highest average content releases in India*

### Key Insights:
1. **Peak in 2018**:
   - **2018** had the highest average content addition with **33.37%**, showing a significant increase in Netflix's focus on Indian content during that year.

2. **Consistent Growth**:
   - The following years, **2019** and **2020**, maintained relatively high levels of content additions, with **20.84%** and **19.02%** of Netflix India's content being added in these years, respectively.

3. **Earlier Years**:
   - **2017** saw **15.49%** of Netflix India's content, indicating steady growth leading up to 2018.

4. **Decline in 2021**:
   - The year **2021** shows a lower percentage (**10.04%**), potentially indicating a shift in Netflix's content strategy or a slowdown in new Indian releases.

This analysis helps track Netflix's content development in India, with 2018 marking a significant expansion of their Indian library.

---
## 11. List All Movies That Are Documentaries

This query was used to find and display a list of movies that belong to the "Documentaries" genre on Netflix. The results include the movie title, type (Movie), and associated genres.


```sql
SELECT
    type,
    title,
    listed_in AS genre
FROM netflix
WHERE type = 'Movie' AND
listed_in ILIKE '%Documentaries%';
```

### Explanation:
- The query selects the **type**, **title**, and **listed_in** (renamed as **genre**) columns from the **netflix** table.
- It filters the results to only include rows where the **type** is 'Movie' and the **listed_in** column contains the word 'Documentaries'. The `ILIKE` function is used for a case-insensitive search.

### Table of Documentaries Movies

| **Type** | **Title**                                               | **Genre**                                    |
|----------|----------------------------------------------------------|----------------------------------------------|
| Movie    | Dick Johnson Is Dead                                      | Documentaries                                |
| Movie    | Europe's Most Dangerous Man: Otto Skorzeny in Spain       | Documentaries, International Movies          |
| Movie    | My Heroes Were Cowboys                                    | Documentaries                                |
| Movie    | Schumacher                                                | Documentaries, International Movies, Sports  |
| Movie    | Blood Brothers: Malcolm X & Muhammad Ali                  | Documentaries, Sports Movies                 |
| Movie    | The Women and the Murderer                                | Documentaries, International Movies          |
| Movie    | If I Leave Here Tomorrow: A Film About Lynyrd Skynyrd     | Documentaries, Music & Musicals              |
| Movie    | Untold: Breaking Point                                    | Documentaries, Sports Movies                 |
| Movie    | Final Account                                             | Documentaries                                |
| Movie    | Rhyme & Reason                                            | Documentaries, Music & Musicals              |

*Table of documentary movies on Netflix*

### Key Insights:
1. **Diverse Genres**:
   - Many of these movies belong to multiple genres. For example, "Schumacher" is categorized under **Documentaries**, **International Movies**, and **Sports Movies**, showcasing how documentaries can span across various themes.

2. **Popular Titles**:
   - The list includes notable titles such as **"Dick Johnson Is Dead"** and **"Blood Brothers: Malcolm X & Muhammad Ali"**, emphasizing the range of biographical and thematic documentary content available on Netflix.

This query helps to identify and filter documentary-style movies on Netflix, highlighting their genre diversity and relevance across different types of content.

---
## 12. Find All Content Without a Director

This query was used to retrieve all Netflix content (both Movies and TV Shows) where the director information is missing, i.e., the director field is **NULL**. The results display the type of content (TV Show), title, and a **NULL** value for the director.


```sql
SELECT
    type,
    title,
    director
FROM netflix
WHERE director IS NULL;
```

### Explanation:
- The query selects the **type**, **title**, and **director** columns from the **netflix** table.
- It filters the results to include only those rows where the **director** column is **NULL** (i.e., no director information is present).

### Table of Content Without Director Information

| **Type**  | **Title**                                 | **Director** |
|-----------|-------------------------------------------|--------------|
| TV Show   | Blood & Water                             | NULL         |
| TV Show   | Jailbirds New Orleans                     | NULL         |
| TV Show   | Kota Factory                              | NULL         |
| TV Show   | Vendetta: Truth, Lies and The Mafia       | NULL         |
| TV Show   | Crime Stories: India Detectives           | NULL         |
| TV Show   | Dear White People                         | NULL         |
| TV Show   | Khawatir                                  | NULL         |
| TV Show   | Falsa identidad                           | NULL         |
| TV Show   | Jaguar                                    | NULL         |
| TV Show   | Resurrection: Ertugrul                    | NULL         |

*Table of Netflix content without director information*

### Key Insights:
1. **TV Shows Missing Director Data**:
   - The list consists entirely of **TV Shows** without director information, such as **"Blood & Water"**, **"Kota Factory"**, and **"Dear White People"**.

2. **Lack of Metadata**:
   - Missing director data can affect the quality of the database and may indicate either incomplete records or content that is not typically associated with a single director.

This query is useful for identifying content on Netflix that lacks essential metadata, allowing for further investigation or updating of missing details in the database.

---

## 13. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years

This query is used to find all the movies on Netflix where the actor **Salman Khan** has appeared within the last 10 years. The results display the **title** of the movie, the **cast** of actors, and the **release year**.

### Code Explanation:
```sql
SELECT 
    title,
    casts,
    release_year
FROM netflix
WHERE casts LIKE '%Salman Khan%'
AND release_year >= EXTRACT(YEAR FROM CURRENT_DATE) - 10;
```
- The query selects the **title**, **casts**, and **release_year** columns from the **netflix** table.
- It filters the results to include only those rows where the **casts** column contains the name **"Salman Khan"**.
- It further filters the results to include movies that were released in the last 10 years by checking if the **release_year** is greater than or equal to the current year minus 10.

### Movies Featuring Salman Khan in the Last 10 Years

| **Title**                  | **Casts**                                                                                                    | **Release Year** |
|----------------------------|--------------------------------------------------------------------------------------------------------------|------------------|
| Prem Ratan Dhan Payo        | Salman Khan, Sonam Kapoor, Anupam Kher, Neil Nitin Mukesh, Sanjay Mishra, Swara Bhaskar, Deepak Dobriyal, etc. | 2015             |
| Paharganj                   | Lorena Franco, Bijesh Jayarajan, Neet Chowdhary, Rajeev Gaursingh, Karran Jeet, Rajesh Sharma, Salman Khan, etc. | 2019             |

*Table of movies featuring Salman Khan in the last 10 years*

### Key Insights:
1. **Salman Khan Appearances**:
   - Two movies were identified where **Salman Khan** appeared, including **"Prem Ratan Dhan Payo"** released in 2015 and **"Paharganj"** released in 2019.
   
2. **Multi-star Casts**:
   - Both films include Salman Khan as part of a larger ensemble cast with other notable actors such as **Sonam Kapoor**, **Anupam Kher**, and **Neil Nitin Mukesh**.

This query helps identify content featuring the prominent actor **Salman Khan** within a specific time frame, making it useful for fans or analysts looking to explore his recent filmography on Netflix.

---

### Question 14: Who are the top 10 actors who have appeared in the highest number of movies produced in India?

#### Query:
```sql
SELECT
    TRIM(UNNEST(STRING_TO_ARRAY(casts, ','))) AS actors,
    COUNT(*) AS count_of_movies
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
```

#### Explanation:

- **Extract Actor Names**:  
  The `STRING_TO_ARRAY` function splits the `casts` column (a comma-separated list of actors) into individual actor names. The `UNNEST` function expands these arrays into individual rows, and the `TRIM` function removes any leading or trailing spaces from the actor names.

- **Filter for Indian Movies**:  
  The `WHERE country = 'India'` clause ensures that the query only considers content produced in India.

- **Count the Number of Movies**:  
  The query groups the results by each actor's name and counts how many times each actor appears in the movies using the `COUNT(*)` function.

- **Sort by Movie Count**:  
  Results are sorted in descending order by the number of movies each actor has appeared in, using `ORDER BY 2 DESC`.

- **Limit to Top 10**:  
  The `LIMIT 10` clause restricts the output to the top 10 actors with the highest number of movie appearances.

#### Result:
The top 10 actors who have appeared in the highest number of movies produced in India are:

1. **Anupam Kher** - 40 movies  
2. **Shah Rukh Khan** - 32 movies  
3. **Naseeruddin Shah** - 29 movies  
4. **Amitabh Bachchan** - 28 movies  
5. **Akshay Kumar** - 28 movies  
6. **Paresh Rawal** - 27 movies  
7. **Om Puri** - 26 movies  
8. **Kareena Kapoor** - 24 movies  
9. **Boman Irani** - 23 movies  
10. **Salman Khan** - 20 movies

![Top 10 actors of last 10 years](/assets/image(2).png)
*Here is a bar chart displaying the top 10 actors with the most movies produced in India based on the provided data. The chart shows the number of movies each actor has appeared in, with Anupam Kher leading the list at 40 movies.*

This shows that Anupam Kher has appeared in the highest number of movies, followed by Shah Rukh Khan and Naseeruddin Shah.

---

## 15. Categorize the Content Based on Keywords 'Kill' and 'Violence'

This query is used to categorize Netflix content based on the presence of the keywords **'kill'** and **'violence'** in the description. The content is labeled as **'Bad'** if it contains these keywords and **'Good'** if it does not. The query also counts how many items fall into each category for both **TV Shows** and **Movies**.


```sql
SELECT
    category,
    type,
    COUNT(*) as content_count
FROM
    (SELECT
        *,
        CASE
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END as category FROM netflix) as Categorized_Content
GROUP BY 1,2;
```

### Explanation:
- The **subquery** selects all the columns from the **netflix** table and adds a new column, **category**, using a `CASE` statement:
    - If the **description** contains the keywords **'kill'** or **'violence'**, the content is labeled as **'Bad'**.
    - Otherwise, it is labeled as **'Good'**.
- The **main query** groups the results by **category** and **type** (Movie or TV Show) and counts the number of content items in each category using `COUNT(*)`, storing the count in **content_count**.

### Categorized Content Based on 'Kill' and 'Violence' Keywords

| **Category** | **Type**   | **Content Count** |
|--------------|------------|-------------------|
| Good         | TV Show    | 2,585             |
| Good         | Movie      | 5,880             |
| Bad          | Movie      | 251               |
| Bad          | TV Show    | 91                |

*Table showing the count of categorized content based on 'kill' and 'violence' keywords*

### Key Insights:
1. **Content Without Keywords ('Good'):**
   - The majority of the content on Netflix is labeled as **'Good'** since it does not contain the keywords **'kill'** or **'violence'**.
   - **TV Shows**: 2,585 items are classified as **'Good'**.
   - **Movies**: 5,880 items are classified as **'Good'**.

2. **Content With Keywords ('Bad'):**
   - A smaller portion of content is labeled as **'Bad'** because it contains the keywords **'kill'** or **'violence'**.
   - **Movies**: 251 items are classified as **'Bad'**.
   - **TV Shows**: 91 items are classified as **'Bad'**.

This query helps categorize content into **Good** or **Bad** based on the presence of certain violent keywords, providing insight into the nature of content available on Netflix.

---

# Conclusion
Based on the insights gathered from the analysis of Netflix data through 15 SQL queries, several key findings emerge for anyone looking to understand the content landscape and make data-driven decisions:

### **1. Content Distribution:**
- **Diverse Content Types**: 
  - The analysis revealed a vast array of content types on Netflix, with a significant emphasis on movies and TV shows. Understanding this distribution aids in recognizing viewer preferences and tailoring content strategies accordingly.

### **2. Popular Genres and Trends:**
- **Genre Insights**: 
  - By categorizing content and counting the occurrences of specific genres, we identified the most popular categories among viewers. This information is invaluable for content acquisition and marketing strategies, ensuring alignment with audience interests.

### **3. Actor Contributions:**
- **Actor Visibility**:
  - The queries highlighted the significant presence of key actors, such as **Salman Khan** and **Anupam Kher**, in Netflix’s catalog. This can inform casting decisions and promotional strategies, leveraging star power to enhance viewership.

### **4. Time-Based Content Analysis:**
- **Recent Releases**:
  - Time-based queries allowed us to track content added in the last decade, providing insights into trends over time. This is crucial for understanding shifts in viewer preferences and planning future content releases.

### **5. Keyword Categorization:**
- **Content Quality Assessment**:
  - The ability to categorize content based on keywords like "kill" and "violence" enabled a nuanced understanding of viewer perceptions regarding content quality. This can inform content guidelines and marketing messaging.

### **6. Analytical Query Skills:**
- **Enhanced SQL Proficiency**:
  - The analysis process improved skills in complex query construction, data aggregation, and using advanced SQL functions such as UNNEST and DATE manipulation. These skills are essential for future data-driven analyses and decision-making.

### **7. Actionable Insights for Netflix Strategy:**
- **Strategic Content Development**:
  - Overall, these insights can guide Netflix in its content development strategy, ensuring that the platform remains responsive to audience demands while maximizing viewer engagement through data-driven decision-making.

This comprehensive analysis underscores the importance of leveraging data to understand viewer behavior and optimize content offerings, ultimately contributing to Netflix's ongoing success in a competitive streaming market.

---

# What I Learned
During my analysis of Netflix data, I significantly enhanced my SQL skills:

- 📈 **Content Categorization:** Learned to classify content using keywords, effectively labeling items based on their descriptions to gain insights into viewer trends and preferences.

- 📅 **Time-Based Analysis:** Developed the ability to manipulate dates, allowing me to filter and analyze data over specific time frames, such as identifying content released in the last 10 years, which is crucial for understanding trends in viewership.

- 🔄 **Data Aggregation and Grouping:** Mastered the use of aggregate functions and GROUP BY clauses to summarize and count content across various dimensions, revealing key insights about genres, actors, and release years.

- 🧩 **UNNEST STRING TO ARRAY:** Gained proficiency in using the UNNEST function with STRING_TO_ARRAY to break down and analyze multiple values within a single column, enhancing my ability to work with complex data structures.

- 🎬 **Complex Query Construction:** Gained confidence in constructing complex queries with nested SELECT statements and window functions, enhancing my ability to extract detailed insights from the dataset.

- 🔍 **Analytical Thinking:** Improved my problem-solving skills by turning specific business questions into actionable SQL queries, enabling a deeper understanding of the Netflix content landscape.

This experience has empowered me with the skills to analyze large datasets effectively and derive meaningful insights, paving the way for future data-driven decision-making.


### **Summary of Insights:**

- **Content Diversity**: Netflix hosts a wide variety of content, with a nearly equal balance between **Movies** and **TV Shows**. The platform is heavily populated with Movies, which make up a larger portion of the content library.
  
- **Regional Content Dominance**: Certain countries, particularly **India**, contribute significantly to Netflix’s content catalog. India ranks among the top contributors in terms of content volume, including a high number of **movies** featuring prominent actors like **Anupam Kher** and **Shah Rukh Khan**.

- **Popular Genres**: **Documentaries** are a notable genre on Netflix, with many titles categorized as such. This genre appeals to a broad audience, and Netflix offers numerous documentary films across a range of topics, from biographies to historical events.

- **Director and Cast Trends**: A significant number of Netflix content items lack a listed **director**, especially in the **TV Show** category. Meanwhile, actors like **Anupam Kher**, **Shah Rukh Khan**, and **Akshay Kumar** dominate Indian-produced movies, appearing frequently across multiple titles.

- **Content Categorization**: The categorization of content based on keywords such as **'kill'** and **'violence'** reveals that most of the content is labeled **'Good'**, indicating a broader offering of family-friendly content. A smaller but notable portion is labeled **'Bad'**, reflecting violent or intense themes.

- **Recent Trends**: In the last decade, Netflix has seen a consistent stream of content releases, with major actors like **Salman Khan** appearing in movies from 2015 to 2019. This showcases Netflix's ability to continually offer popular content featuring Bollywood stars.

- **Seasoned Shows**: TV Shows with more than **5 seasons** are limited but are generally well-established titles, reflecting their sustained popularity and long-term viewer engagement.

This analysis highlights Netflix's broad content offering, with an emphasis on Indian films, popular genres like documentaries, and detailed breakdowns of content without directors or violent themes. These insights are useful for understanding the platform’s diverse content strategies and regional trends.

### **Closing Thoughts**:
This project significantly enhanced my SQL skills and deepened my understanding of the Netflix content landscape through the analysis of 15 targeted queries. The insights gained from this analysis serve as a guide for both content strategists and data analysts in identifying viewer preferences and optimizing content offerings. 

By examining various aspects such as content distribution, genre popularity, actor contributions, and keyword categorization, I gained valuable perspectives on how data can inform strategic decisions in the streaming industry. This exploration not only highlights the importance of effective data analysis but also underscores the need for continuous learning and adaptation to emerging trends within the rapidly evolving entertainment sector.

Ultimately, the ability to leverage data insights is essential for driving growth and enhancing viewer engagement. As I move forward, I aim to apply these analytical skills in real-world scenarios, contributing to data-driven decision-making and delivering impactful results in the field of data analysis.