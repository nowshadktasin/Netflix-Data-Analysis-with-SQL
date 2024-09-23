
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
- [Count the number of Movies vs TV Shows](/Count_TV_Shows.sql)  
- [What is the most common rating for movies and TV shows?](/sql_load/project_sql/2_common_ratings.sql)  
- [List all movies released in a specific year (e.g., 2020)](/sql_load/project_sql/3_movies_by_year.sql)  
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
Here’s a structured analysis of your first question, using the format you’ve provided:

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
