USE BANK;
SHOW TABLES;
-- CONSULTA 1 : Obtén los valores de id de los primeros 5 clientes del district_id con un valor igual a 1.
SELECT CLIENT_ID
FROM CLIENT
WHERE DISTRICT_ID= 1
ORDER BY CLIENT_ID
LIMIT 5;

-- CONSULTA 2 : En la tabla client, obtén el valor de id del último cliente donde el district_id sea igual a 72.
SELECT CLIENT_ID 
FROM CLIENT
WHERE DISTRICT_ID= 72
ORDER BY CLIENT_ID DESC
LIMIT 1;


-- CONSULTA 3:Obtén las 3 cantidades más bajas en la tabla loan.
SELECT AMOUNT
FROM LOAN
ORDER BY AMOUNT ASC
LIMIT 3;

-- CONSULTA 4: ¿Cuáles son los valores posibles para status, ordenados alfabéticamente en orden ascendente en la tabla loan?
-- Añadimos el "distict" para dar una lista con valores unicos
SELECT DISTINCT STATUS
FROM LOAN
ORDER BY STATUS ASC;

-- CONSULTA 5: ¿Cuál es el loan_id del pago más alto recibido en la tabla loan?
SELECT loan_id
FROM LOAN
ORDER BY PAYMENTS DESC
LIMIT 1;

-- CONSULTA 6 :¿Cuál es el monto del préstamo de los 5 account_id más bajos en la tabla loan? Muestra el account_id y el monto correspondiente.
SELECT ACCOUNT_ID,AMOUNT
FROM LOAN 
ORDER BY ACCOUNT_ID ASC
-- es accendiente porque te coge los 5 más pequeños, ya que la tabla esta ordenada de mayor a menor.
LIMIT 5;

-- CONSULTA 7: ¿Cuáles son los account_id con el monto de préstamo más bajo que tienen una duration de préstamo de 60 en la tabla loan?
SELECT ACCOUNT_ID
FROM LOAN 
WHERE DURATION=60
ORDER BY AMOUNT ASC
LIMIT 5;

-- CONSULTA 8:¿Cuáles son los valores únicos de k_symbol en la tabla order?
SELECT DISTINCT K_SYMBOL
FROM `ORDER`;
 
 -- CONSULTA 9:En la tabla order, ¿cuáles son los order_id del cliente con el account_id 34?
 SELECT ORDER_ID
 FROM `ORDER`
 WHERE ACCOUNT_ID=34;
 
 -- CONSULTA 10:En la tabla order, ¿qué account_id fueron responsables de las órdenes entre order_id 29540 y order_id 29560 (inclusive)?
SELECT DISTINCT ACCOUNT_ID
FROM `ORDER`
WHERE ORDER_ID BETWEEN 29540 AND 29560
ORDER BY ACCOUNT_ID
LIMIT 4;

-- CONSULTA 11: En la tabla order, ¿cuáles son los montos individuales que fueron enviados a (account_to) id 30067122?
SELECT DISTINCT AMOUNT
FROM `ORDER`
WHERE ACCOUNT_TO = 30067122;

-- CONSULTA 12:En la tabla trans, muestra el trans_id, date, type y amount de las 10 primeras transacciones del account_id 793 en orden cronológico, de las más recientes a las más antiguas.
SELECT trans_id,date,type,amount
FROM trans
WHERE ACCOUNT_ID=793
ORDER BY DATE DESC
LIMIT 10;

-- CONSULTA 13: En la tabla client, de todos los distritos con un district_id menor que 10, ¿cuántos clientes hay de cada district_id? Muestra los resultados ordenados por district_id en orden ascendente.
SELECT district_id, COUNT(*) AS client_count
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id ASC;

-- CONSULTA 14: En la tabla card, ¿cuántas tarjetas existen para cada type? Ordena el resultado comenzando con el type más frecuente.
SELECT
    T1.inventory_id,
    T2.title,
    T3.store_id,
    IF(T4.return_date IS NULL OR T4.return_date < NOW(), 'Available', 'Not Available') AS availability
FROM
    inventory as T1
JOIN film AS T2 ON T1.film_id = T2.film_id
JOIN store AS T3 ON T1.store_id = T3.store_id
LEFT JOIN rental AS T4 ON T1.inventory_id = T4.inventory_id AND T4.return_date IS NULL
WHERE
    T2.title = 'Academy Dinosaur'
    AND T3.store_id = 1
HAVING availability = 'Available';












