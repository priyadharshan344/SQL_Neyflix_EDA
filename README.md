# Exploratory data analysis- Netflix movies and series of data using SQL.

![](https://github.com/priyadharshan344/SQL_Neyflix_EDA/blob/main/Img%20new.jpg)

## Overview
This project involved performing an Exploratory Data Analysis (EDA) on Netflix's content catalog using SQL Queries. The analysis focused on understanding the distribution and characteristics of Netflix's offerings, covering both movies and TV shows. The objective was to identify key trends and patterns in terms of content types, ratings, release years, countries of origin, and content duration, as well as exploring thematic content based on specific keywords.

## Key Metrics & Insights:
- Distribution of Content Types:
Analyzed the proportion of movies vs TV shows available on Netflix, providing insights into the balance between short and long-form content.

- Most Common Ratings:
Identified the most frequent content ratings (e.g., G, PG, TV-MA) for movies and TV shows, helping understand the target audience for Netflix's content.

- Release Years:
Explored trends in content production over time, highlighting how Netflix's content library has evolved in terms of release year distribution.

- Countries of Origin:
Investigated the geographic distribution of Netflix content, identifying the top content-producing countries and variations between movies and TV shows.

- Content Duration:
Segmented content based on its duration, providing insights into the average length of movies and TV shows on Netflix.

- Content Categorization:
Explored content based on specific keywords and genres, categorizing the data to uncover trends in Netflix's thematic offerings.

Dataset link: [Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

## Tools & Techniques Used:
- SQL Queries: Leveraged SQL for data extraction, filtering, and aggregation to generate meaningful insights from Netflix's content data.
- Data Cleaning: Applied data cleaning techniques to handle missing values, standardize formats, and ensure consistency in the analysis.
-  Data Modeling: Focused on structuring and transforming the dataset to support key analysis areas such as content type, ratings, and country of origin.

## Schema
 
```sql
CREATE TABLE `netflix_eda` (
  `show_id` varchar(6) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `director` varchar(208) DEFAULT NULL,
  `cast` varchar(1000) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `date_added` varchar(50) DEFAULT NULL,
  `release_year` int DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  `duration` varchar(15) DEFAULT NULL,
  `listed_in` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

### EDA Solutions
[Fired queries](https://github.com/priyadharshan344/SQL_Neyflix_EDA/blob/main/Solutions_EDA.sql)

