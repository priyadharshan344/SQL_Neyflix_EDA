
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
