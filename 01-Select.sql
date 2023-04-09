/*Seleccionar todos los clientes que tienen la letra "a" en su apellido, ordenados alfabéticamente por apellido*/
SELECT *
FROM customer
WHERE last_name LIKE '%a%'
ORDER BY last_name;


/*Seleccionar todos los pagos realizados por un cliente específico, ordenados por fecha de pago*/
SELECT *
FROM payment
WHERE customer_id = 1
ORDER BY payment_date;


/*Seleccionar todos los alquileres de películas que fueron devueltos tarde, ordenados por fecha de devolución*/
SELECT *
FROM rental
WHERE return_date > rental_date + INTERVAL 3 DAY
ORDER BY return_date;


/*Seleccionar todas las películas que fueron lanzadas después del año 2005 y cuyo idioma original es el inglés, ordenadas por título*/
SELECT *
FROM film
WHERE release_year > 2005 AND language_id = 1
ORDER BY title;


/*Seleccionar todas las tiendas que están ubicadas en Canadá, ordenadas por ciudad*/
SELECT *
FROM store
WHERE address_id IN (SELECT address_id FROM address WHERE country = 'Canada')
ORDER BY city;


/*Seleccionar todas las películas cuya duración es superior a dos horas, ordenadas por duración de forma descendente*/
SELECT *
FROM film
WHERE length > 120
ORDER BY length DESC;


/*Seleccionar todos los actores cuyo apellido comienza con la letra "B", ordenados por apellido*/
SELECT *
FROM actor
WHERE last_name LIKE 'B%'
ORDER BY last_name;


/*Seleccionar todos los pagos realizados entre dos fechas específicas, ordenados por fecha de pago*/
SELECT *
FROM payment
WHERE payment_date BETWEEN '2006-02-14' AND '2006-02-15'
ORDER BY payment_date;


/*Seleccionar todas las películas que contienen la palabra "amor" en su título, ordenadas alfabéticamente por título*/
SELECT *
FROM film
WHERE title LIKE '%amor%'
ORDER BY title;


/*Seleccionar todos los clientes que viven en una ciudad específica, ordenados por apellido y luego por nombre*/
SELECT *
FROM customer
WHERE address_id IN (SELECT address_id FROM address WHERE city = 'London')
ORDER BY last_name, first_name;




