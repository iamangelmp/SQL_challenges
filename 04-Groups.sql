/*Seleccionar la cantidad de películas disponibles en cada tienda*/
SELECT COUNT(inventory_id) as Cantidad_Peliculas, store.store_id, address.city
FROM inventory
JOIN store ON inventory.store_id = store.store_id
JOIN address ON store.address_id = address.address_id
GROUP BY store.store_id;


/*Seleccionar la cantidad de veces que se ha alquilado cada película*/
SELECT film.title, COUNT(rental.rental_id) as Veces_Alquilada
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title;


/*Seleccionar la cantidad de pagos realizados en cada día del mes*/
SELECT DAY(payment_date) as Dia, COUNT(payment_id) as Cantidad_Pagos
FROM payment
GROUP BY DAY(payment_date);


/*Seleccionar el monto total de los pagos realizados por cada cliente*/
SELECT customer.customer_id, CONCAT(customer.first_name, ' ', customer.last_name) as Nombre_Completo, SUM(amount) as Monto_Total_Pagos
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id;


/*Seleccionar la cantidad de películas por categoría*/
SELECT category.name as Categoria, COUNT(film_category.film_id) as Cantidad_Peliculas
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name;


/*Seleccionar el número de alquileres realizados por cada empleado*/
SELECT CONCAT(employee.first_name, ' ', employee.last_name) as Nombre_Completo, COUNT(rental.rental_id) as Cantidad_Alquileres
FROM rental
JOIN staff ON rental.staff_id = staff.staff_id
JOIN employee ON staff.employee_id = employee.employee_id
GROUP BY employee.employee_id;


/*Seleccionar la cantidad de pagos realizados por cada miembro del staff*/
SELECT CONCAT(staff.first_name, ' ', staff.last_name) as Nombre_Completo, COUNT(payment.payment_id) as Cantidad_Pagos
FROM payment
JOIN staff ON payment.staff_id = staff.staff_id
GROUP BY staff.staff_id;


/*Seleccionar la cantidad de actores en cada película*/
SELECT film.title, COUNT(film_actor.actor_id) as Cantidad_Actores
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.film_id;


/*Seleccionar el ingreso total por cada categoría*/
SELECT category.name as Categoria, SUM(payment.amount) as Ingreso_Total
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.category_id;


/*Seleccionar la cantidad de alquileres por cada cliente y cada tienda*/
SELECT customer.customer_id, CONCAT(customer.first_name, ' ', customer.last_name) as Nombre_Completo, store.store_id, COUNT(rental.rental_id) as Cantidad_Alquileres
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN store ON inventory.store
