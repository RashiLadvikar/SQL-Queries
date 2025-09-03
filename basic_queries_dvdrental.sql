-- 1. List all actors
SELECT actor_id, first_name, last_name FROM actor;

-- 2. Show first 10 films
SELECT film_id, title, release_year FROM film
LIMIT 10;

-- 3. Find all customers from 'California'
SELECT first_name, last_name, email FROM customer
WHERE address_id IN (
    SELECT address_id FROM address WHERE district = 'California'
);

-- 4. Find all films released in 2006
SELECT title FROM film
WHERE release_year = 2006;

-- 5. Order customers by last name
SELECT first_name, last_name FROM customer
ORDER BY last_name ASC;