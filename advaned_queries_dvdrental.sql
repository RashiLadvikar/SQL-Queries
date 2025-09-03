-- 11. Find films that were never rented
SELECT title FROM film
WHERE film_id NOT IN (SELECT film_id FROM inventory);

-- 12. Find customers who rented more than 30 films
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 30;

-- 13. Window Function: Rank customers by total payments
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(p.amount) AS total_payment,
       RANK() OVER (ORDER BY SUM(p.amount) DESC) AS rank
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 14. CTE: Find top 3 most rented films
WITH film_rentals AS (
    SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title
)
SELECT * FROM film_rentals
ORDER BY rental_count DESC
LIMIT 3;