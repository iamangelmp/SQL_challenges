/*Índice de clave primaria en la tabla "actor"*/
ALTER TABLE actor ADD PRIMARY KEY (actor_id);


/*Índice de clave foránea en la tabla "film_actor"*/
ALTER TABLE film_actor ADD FOREIGN KEY (actor_id) REFERENCES actor(actor_id);


/*Índice único en la tabla "category"*/
ALTER TABLE category ADD UNIQUE (name);


/*Índice completo en la tabla "customer"*/
ALTER TABLE customer ADD FULLTEXT (first_name, last_name, email);


/*Índice de múltiples columnas en la tabla "film_category"*/
ALTER TABLE film_category ADD INDEX (film_id, category_id);


/*Índice de texto completo en la tabla "film"*/
ALTER TABLE film ADD FULLTEXT (title, description);


/*Índice de clave única en la tabla "inventory"*/
ALTER TABLE inventory ADD UNIQUE (inventory_id);


/*Índice espacial en la tabla "address"*/
CREATE SPATIAL INDEX idx_address ON address(location);


/*Índice de hash en la tabla "rental"*/
CREATE INDEX idx_rental ON rental (rental_date) USING HASH;


/*Índice de prefijo en la tabla "staff"*/
ALTER TABLE staff ADD INDEX (last_name(10));
