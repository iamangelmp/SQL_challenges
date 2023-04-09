/*Seleccionar todos los alquileres de películas junto con la información de los clientes que los alquilaron*/
SELECT rental.rental_id, rental.rental_date, customer.first_name, customer.last_name
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id;


/*Seleccionar todas las películas junto con su categoría correspondiente*/
SELECT film.title, category.name
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id;


/*Seleccionar todos los actores junto con las películas en las que han aparecido*/
SELECT actor.first_name, actor.last_name, film.title
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id;


/*Seleccionar todos los pagos junto con la información de los clientes que los realizaron*/
SELECT payment.payment_id, payment.payment_date, customer.first_name, customer.last_name
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id;


/*Seleccionar todas las tiendas junto con la ciudad y el país en el que se encuentran*/
SELECT store.store_id, address.city, country.country
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;


/*Seleccionar todas las películas junto con la información de los actores que han aparecido en ellas*/
SELECT film.title, actor.first_name, actor.last_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id;


/*Seleccionar todas las categorías junto con la cantidad de películas que pertenecen a cada una de ellas*/
SELECT category.name, COUNT(film_category.film_id) AS peliculas
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.category_id;


/*Seleccionar todas las películas que han sido alquiladas junto con la información de los clientes que las alquilaron*/
SELECT film.title, customer.first_name, customer.last_name
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN customer ON rental.customer_id = customer.customer_id;


/*Seleccionar todos los empleados junto con la información de sus supervisores*/
SELECT e.employee_id, e.first_name, e.last_name, s.first_name AS supervisor_first, s.last_name AS supervisor_last
FROM employee e
JOIN employee s ON e.reports_to = s.employee_id;


/*Seleccionar todas las películas junto con la información de las tiendas donde están disponibles*/
SELECT film.title, store.store_id, address.city, address.country
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN store ON inventory.store_id = store.store_id
JOIN address ON store.address_id = address.address_id;
