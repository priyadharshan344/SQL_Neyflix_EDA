# Exploratory data analysis- Netflix movies and series of data using SQL.

![](https://github.com/priyadharshan344/SQL_Neyflix_EDA/blob/main/download%20(2).jpg)

Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems, solutions, findings, and conclusions.

Objectives
Analyze the distribution of content types (movies vs TV shows).
Identify the most common ratings for movies and TV shows.
List and analyze content based on release years, countries, and durations.
Explore and categorize content based on specific criteria and keywords.
Dataset
The data for this project is sourced from the Kaggle dataset:

Dataset link: [Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

##Schema
 
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




