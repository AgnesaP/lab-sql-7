
use sakila;

/* 1.In the table actor, which are the actors whose last names are not repeated? 
For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd.
 These three actors have the same last name. So we do not want to include this last name in our output.
 Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list */
 
SELECT  min(first_name) as first_name, last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(DISTINCT first_name) = 1
ORDER BY 1;


/* 2.Which last names appear more than once? 
We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once*/

SELECT  last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(DISTINCT first_name) > 1
ORDER BY 1;


# 3.Using the rental table, find out how many rentals were processed by each employee.

SELECT s.staff_id , s.first_name, s.last_name,  count(DISTINCT r.rental_id) AS rentals FROM sakila.staff s 
LEFT JOIN sakila.rental AS r ON S.staff_id = r.staff_id
GROUP BY 1 ,2,3
ORDER BY 4 DESC;


# 4.Using the film table, find out how many films were released each year.

SELECT release_year, count(*) AS films FROM sakila.film AS f 
GROUP BY 1 
ORDER BY 1 ASC;


# 5.Using the film table, find out for each rating how many films were there.

SELECT f.rating, count(*) AS films FROM sakila.film AS f 
GROUP BY 1 
ORDER BY 2 DESC;


# 6.What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT f.rating, ROUND(AVG(f.length),2) AS avg_length FROM sakila.film AS f 
GROUP BY 1 
ORDER BY 2 DESC;


# 7.Which kind of movies (rating) have a mean duration of more than two hours?

SELECT f.rating, ROUND(AVG(f.length),2) AS avg_length FROM sakila.film AS f 
GROUP BY 1 
HAVING ROUND(AVG(f.length),2) > 120
ORDER BY 2 DESC;