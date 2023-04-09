/*Actualizar el precio de alquiler de todas las películas a $3.00*/
UPDATE film SET rental_rate = 3.00;


/*Actualizar el nombre y el apellido del cliente con id 1*/
UPDATE customer SET first_name = 'Juan', last_name = 'Pérez' WHERE customer_id = 1;


/*Actualizar la fecha de devolución de un alquiler a una fecha posterior*/
UPDATE rental SET return_date = '2023-04-20' WHERE rental_id = 1;


/*Insertar una nueva película*/
INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features)
VALUES ('Mi película', 'Esta es una película muy interesante', 2023, 1, 5, 2.99, 120, 14.99, 'PG', 'Deleted Scenes,Bloopers');


/*Insertar un nuevo cliente*/
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active)
VALUES (1, 'Pedro', 'Gómez', 'pedro@example.com', 1, 1);


/*Eliminar una película con id 10*/
DELETE FROM film WHERE film_id = 10;


/*Eliminar un actor con id 25 y todas las referencias a él en la tabla de actores de películas*/
DELETE FROM actor WHERE actor_id = 25;
DELETE FROM film_actor WHERE actor_id = 25;


/*Actualizar el inventario de una tienda para reflejar un nuevo DVD de la película con id 5*/
INSERT INTO inventory (film_id, store_id)
VALUES (5, 1);


/*Actualizar la dirección de un cliente con id 2*/
UPDATE address SET address = 'Av. Reforma 3000', postal_code = '06400' WHERE address_id = 2;
UPDATE customer SET address_id = 2 WHERE customer_id = 2;


/*Insertar un nuevo actor y agregarlo a la película con id 1*/
INSERT INTO actor (first_name, last_name)
VALUES ('John', 'Doe');
INSERT INTO film_actor (film_id, actor_id)
VALUES (1, LAST_INSERT_ID());


/*Actualizar la fecha de alquiler de un DVD para reflejar una nueva transacción de alquiler*/
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
VALUES ('2023-04-09 12:00:00', 1, 1, 1);
UPDATE inventory SET last_update = '2023-04-09 12:00:00' WHERE inventory_id = 1;


/*Actualizar el idioma de la película con id 15 a español*/
UPDATE film SET language_id = 2 WHERE film_id = 15;


/*Insertar un nuevo pago para un alquiler existente*/
INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES (1, 1, 1, 3.00, '2023-04-09 12:00:00');
UPDATE rental SET return_date = '2023-04-16' WHERE rental_id = 1;

