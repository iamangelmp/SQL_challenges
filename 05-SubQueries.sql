/*Obtener la cantidad total de películas en cada categoría*/
SELECT name, 
(SELECT COUNT(*) FROM film_category WHERE category_id = category.category_id) AS total_films 
FROM category;


/*Obtener la cantidad de actores que han participado en cada película*/
SELECT title, 
(SELECT COUNT(*) FROM film_actor WHERE film.film_id = film_actor.film_id) AS actors_count 
FROM film;


/*Obtener la lista de clientes que han alquilado todas las películas de una categoría específica*/
SELECT customer.first_name, customer.last_name
FROM customer
WHERE NOT EXISTS (
  SELECT * FROM film_category 
    LEFT JOIN inventory ON film_category.film_id = inventory.film_id 
    LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id 
    WHERE film_category.category_id = 5 AND rental.customer_id = customer.customer_id
);


/*Obtener el número de alquileres para cada película en un rango de fechas específico*/
SELECT film.title, 
(SELECT COUNT(*) FROM rental 
  JOIN inventory ON rental.inventory_id = inventory.inventory_id 
  WHERE inventory.film_id = film.film_id 
  AND rental.rental_date BETWEEN '2005-06-01' AND '2005-06-30') AS rentals_count 
FROM film;


/*Obtener la lista de clientes que han alquilado más de 10 películas en un mes específico*/
SELECT customer.first_name, customer.last_name
FROM customer
WHERE (
  SELECT COUNT(*) FROM rental 
    WHERE rental.customer_id = customer.customer_id 
    AND rental.rental_date BETWEEN '2005-05-01' AND '2005-05-31'
  ) > 10;


/*Obtener el promedio de alquileres por día para cada tienda*/
SELECT store.store_id, 
(SELECT AVG(COUNT(*)) FROM rental 
  WHERE rental.store_id = store.store_id 
  GROUP BY DATE(rental.rental_date)) AS avg_rentals_per_day 
FROM store 
LEFT JOIN rental ON store.store_id = rental.store_id 
GROUP BY store.store_id;


/*Obtener la lista de películas que aún no se han alquilado*/
SELECT film.title 
FROM film
WHERE NOT EXISTS (SELECT * FROM rental 
                  JOIN inventory ON rental.inventory_id = inventory.inventory_id 
                  WHERE inventory.film_id = film.film_id);


/*Obtener el número total de alquileres para cada cliente*/
SELECT customer.first_name, customer.last_name, 
(SELECT COUNT(*) FROM rental 
  WHERE customer.customer_id = rental.customer_id) AS total_rentals 
FROM customer;


/*Obtener la lista de películas que han sido alquiladas más de 50 veces*/
SELECT film.title, 
(SELECT COUNT(*) FROM rental 
  JOIN inventory ON rental.inventory_id = inventory.inventory_id 
  WHERE inventory.film_id = film.film_id) AS rentals_count 
FROM film
HAVING rentals_count > 50;


/*Obtener la cantidad de alquileres para cada película de una categoría específica*/
SELECT film.title, 
(SELECT COUNT(*) FROM rental 
  JOIN inventory ON rental.inventory_id = inventory.inventory_id 
  JOIN film_category ON inventory.film_id = film_category.film_id 
  WHERE film_category.category_id = 5 AND inventory.film_id = film.f
