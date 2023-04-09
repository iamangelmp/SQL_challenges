/*Seleccionar el número total de pagos realizados*/
SELECT COUNT(payment_id) as Total_Pagos FROM payment;


/*Seleccionar el ingreso total obtenido por los pagos*/
SELECT SUM(amount) as Ingreso_Total FROM payment;


/*Seleccionar el promedio de los montos de los pagos realizados*/
SELECT AVG(amount) as Promedio_Monto FROM payment;


/*Seleccionar la cantidad de películas disponibles en cada tienda*/
SELECT COUNT(inventory_id) as Cantidad_Peliculas, store.store_id, address.city
FROM inventory
JOIN store ON inventory.store_id = store.store_id
JOIN address ON store.address_id = address.address_id
GROUP BY store.store_id;


/*Seleccionar el monto máximo de un pago realizado*/
SELECT MAX(amount) as Max_Monto FROM payment;


/*Seleccionar la cantidad de clientes que han realizado pagos*/
SELECT COUNT(DISTINCT customer_id) as Cantidad_Clientes FROM payment;


/*Seleccionar la cantidad de veces que se ha alquilado cada película*/
SELECT film.title, COUNT(rental.rental_id) as Veces_Alquilada
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title;


/*Seleccionar el monto total de los pagos realizados por cada cliente*/
SELECT customer.customer_id, CONCAT(customer.first_name, ' ', customer.last_name) as Nombre_Completo, SUM(amount) as Monto_Total_Pagos
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id;


/*Seleccionar la duración promedio de las películas por categoría*/
SELECT category.name, AVG(film.length) as Duracion_Promedio
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;


/*Seleccionar la cantidad de pagos realizados en cada día del mes*/
SELECT DAY(payment_date) as Dia, COUNT(payment_id) as Cantidad_Pagos
FROM payment
GROUP BY DAY(payment_date);


/*Seleccionar el monto promedio de los pagos realizados en cada día de la semana*/
SELECT DAYNAME(payment_date) as Dia_Semana, AVG(amount) as Monto_Promedio
FROM payment
GROUP BY DAYNAME(payment_date);


/*Seleccionar el monto promedio de los pagos realizados en cada día de la semana*/
SELECT DAYNAME(payment_date) as Dia_Semana, AVG(amount) as Monto_Promedio
FROM payment
GROUP BY DAYNAME(payment_date);


/*Seleccionar el número total de actores que han participado en películas*/
SELECT COUNT(DISTINCT actor_id) as Total_Actores FROM film_actor;


/*Seleccionar la categoría con el mayor número de películas*/
SELECT category.name, COUNT(film_category.film_id) as Cantidad_Peliculas
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY Cantidad_Peliculas DESC
LIMIT 1;


/*Seleccionar el promedio de la duración de las películas por clasificación*/
SELECT film.rating, AVG(film.length) as Duracion_Promedio
FROM film
GROUP BY film.rating;


