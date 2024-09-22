SELECT * FROM netfix.netflix_eda;

select distinct type
from netflix_eda

select type, count(type)
from netflix_eda
group by type

select distinct rating
from netflix_eda

select type, max(rating) as common_rat
from netflix_eda
group by type

select type, rating, count, rnks
from (
select type, rating,count(rating) as count, rank() over(partition by type order by count(rating) desc)  as rnks
from netflix_eda
group by type,rating) as sub
where rnks=1


select type, rating, max(common_rat)
from(
select type, rating,  count(rating) as common_rat
from netflix_eda
group by type, rating
order by count(rating) desc) as sub
group by type, rating

select title
from netflix_eda
where release_year= 2020 and type= 'Movie'

select country, count(country)
from netflix_eda
group by country
order by count(country) desc
limit 5

select country, count(country),rank() over(order by count(country) desc)  as rnks
from netflix_eda
group by country
limit 5

select type, max(duration)
from netflix_eda
group by type,title

select year(A), count(show_id)
from(
select show_id, str_to_date(date_added, '%M %d, %Y') as A
from netflix_eda) B
group by year(A)
order by year(A) desc
limit 5

select type, title
from netflix_eda
where director like '%Kirsten Johnson%'

select type, A
from(
select type, cast(duration as unsigned) as A
from netflix_eda) as B
where A>5 and type= 'TV Show'

WITH RECURSIVE split_string AS (
    -- Anchor member: extracts the first element
    SELECT 
        SUBSTRING_INDEX((select listed_in from netflix_eda), ',', 1) AS element,
        -- Removes the first element from the string
        SUBSTRING((select listed_in from netflix_eda), LENGTH(SUBSTRING_INDEX((select listed_in from netflix_eda), ',', 1)) + 2) AS remaining
    UNION ALL
    -- Recursive member: continues extracting elements
    SELECT
        SUBSTRING_INDEX(remaining, ',', 1),
        SUBSTRING(remaining, LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)
    FROM split_string
    WHERE remaining != ''
)
SELECT element FROM split_string;


select 

WITH RECURSIVE split_string AS (
    -- Anchor member: extracts the first element for each row
    SELECT 
        show_id, -- Assuming `id` is a unique identifier for each row in netflix_eda
        SUBSTRING_INDEX(listed_in, ',', 1) AS element,
        -- Removes the first element from the string
        SUBSTRING(listed_in, LENGTH(SUBSTRING_INDEX(listed_in, ',', 1)) + 2) AS remaining
    FROM netflix_eda
    
    UNION ALL
    
    -- Recursive member: continues extracting elements for each row
    SELECT
        show_id,
        SUBSTRING_INDEX(remaining, ',', 1),
        SUBSTRING(remaining, LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)
    FROM split_string
    WHERE remaining != ''
)

SELECT element, count(show_id) FROM split_string
group by element;


select avg(release_year)
from netflix_eda
group by 


WITH RECURSIVE split_string AS (
    -- Anchor member: extracts the first element for each row
    SELECT 
        release_year, -- Assuming `id` is a unique identifier for each row in netflix_eda
        SUBSTRING_INDEX(country, ',', 1) AS element,
        -- Removes the first element from the string
        SUBSTRING(country, LENGTH(SUBSTRING_INDEX(country, ',', 1)) + 2) AS remaining
    FROM netflix_eda
    
    UNION ALL
    
    -- Recursive member: continues extracting elements for each row
    SELECT
        release_year,
        SUBSTRING_INDEX(remaining, ',', 1),
        SUBSTRING(remaining, LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)
    FROM split_string
    WHERE remaining != ''
)

SELECT distinct element, round(avg(release_year))   FROM split_string
group by element


WITH RECURSIVE split_string AS (
    -- Anchor member: extracts the first element for each row
    SELECT 
        type,title, -- Assuming `id` is a unique identifier for each row in netflix_eda
        SUBSTRING_INDEX(listed_in, ',', 1) AS element,
        -- Removes the first element from the string
        SUBSTRING(listed_in, LENGTH(SUBSTRING_INDEX(listed_in, ',', 1)) + 2) AS remaining
    FROM netflix_eda
    
    UNION ALL
    
    -- Recursive member: continues extracting elements for each row
    SELECT
        type, title,
        SUBSTRING_INDEX(remaining, ',', 1),
        SUBSTRING(remaining, LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)
    FROM split_string
    WHERE remaining != ''
)

SELECT  element, title   FROM split_string
where type= 'Movie' and element='Documentaries'



WITH RECURSIVE split_string AS (
    -- Anchor member: extracts the first element for each row
    SELECT 
        show_id, -- Assuming `id` is a unique identifier for each row in netflix_eda
        SUBSTRING_INDEX(director, ',', 1) AS element,
        -- Removes the first element from the string
        SUBSTRING(director, LENGTH(SUBSTRING_INDEX(director, ',', 1)) + 2) AS remaining
    FROM netflix_eda
    
    UNION ALL
    
    -- Recursive member: continues extracting elements for each row
    SELECT
        show_id,
        SUBSTRING_INDEX(remaining, ',', 1),
        SUBSTRING(remaining, LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)
    FROM split_string
    WHERE remaining != ''
)

SELECT  element, show_id   FROM split_string
where element=''


select  distinct release_year, count(type) 
from netflix_eda
where type= 'Movie'
group by (release_year)
order by release_year desc
limit 10;


WITH RECURSIVE split_string AS (
    -- Anchor member: extracts the first element for each row
    SELECT 
        show_id, release_year,type, -- Assuming `id` is a unique identifier for each row in netflix_eda
        SUBSTRING_INDEX(cast, ',', 1) AS element,
        -- Removes the first element from the string
        SUBSTRING(cast, LENGTH(SUBSTRING_INDEX(cast, ',', 1)) + 2) AS remaining
    FROM netflix_eda
    
    UNION ALL
    
    -- Recursive member: continues extracting elements for each row
    SELECT
        show_id, release_year, type,
        SUBSTRING_INDEX(remaining, ',', 1),
        SUBSTRING(remaining, LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)
    FROM split_string
    WHERE remaining != ''
)

SELECT  count(type)    FROM split_string
where type='Movie' and element= 'Vijay Sethupathi'
order by release_year desc

WITH RECURSIVE split_string AS (
    -- Anchor member: extracts the first element for each row
    SELECT 
        show_id, release_year,type,cast, country, -- Assuming `id` is a unique identifier for each row in netflix_eda
        SUBSTRING_INDEX(cast, ',', 1) AS element,
        -- Removes the first element from the string
        SUBSTRING(cast, LENGTH(SUBSTRING_INDEX(cast, ',', 1)) + 2) AS remaining
    FROM netflix_eda
    
    UNION ALL
    
    -- Recursive member: continues extracting elements for each row
    SELECT
        show_id, release_year, type,cast, country,
        SUBSTRING_INDEX(remaining, ',', 1),
        SUBSTRING(remaining, LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)
    FROM split_string
    WHERE remaining != ''
)

SELECT   count(*), element    FROM split_string
where type= 'Movie' and country like 'India'
group by element
order by count(*) desc




WITH RECURSIVE split_string AS (
    -- Anchor member: extracts the first element for each row
    SELECT 
        release_year, -- Assuming `id` is a unique identifier for each row in netflix_eda
        SUBSTRING_INDEX(country, ',', 1) AS element,
        -- Removes the first element from the string
        SUBSTRING(country, LENGTH(SUBSTRING_INDEX(country, ',', 1)) + 2) AS remaining
    FROM netflix_eda
    
    UNION ALL
    
    -- Recursive member: continues extracting elements for each row
    SELECT
        release_year,
        SUBSTRING_INDEX(remaining, ',', 1),
        SUBSTRING(remaining, LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)
    FROM split_string
    WHERE remaining != ''
)

SELECT count(*), release_year as Years, count(*)/(select count(*) FROM split_string where element= 'India') as avgs  FROM split_string
where element= 'India'
group by Years
order by avgs desc

select Count(Category), Category
from(
	select description, show_id,
	case
		when description like '%kill%' or description like '%life%'  then "Bad"
		else "Good"
	end as Category
	from netflix_eda) A
group by Category