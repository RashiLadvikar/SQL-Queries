-- 6. Count total number of films
SELECT COUNT(*) AS total_films FROM film;

-- 7. Find average rental rate of films
SELECT AVG(rental_rate) AS avg_rate FROM film;

-- 8. Count films by rating
SELECT rating, COUNT(*) FROM film
GROUP BY rating;

-- 9. Find total payments made by each customer
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_paid DESC;

-- 10. List top 5 categories with most films
SELECT cat.name, COUNT(film_id) AS total_films
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
GROUP BY cat.name
ORDER BY total_films DESC
LIMIT 5;