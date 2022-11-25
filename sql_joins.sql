SELECT customer.address_id, customer.first_name, customer.last_name, address.district
FROM customer 
INNER JOIN address ON customer.address_id=address.address_id 
WHERE address.district = 'Texas';

SELECT payment.customer_id,payment.amount ,customer.first_name, customer.last_name
FROM payment 
INNER JOIN customer ON  payment.customer_id=customer.customer_id
WHERE payment.amount >= 6.99
ORDER BY payment.amount DESC;

SELECT SUM(payment.amount) , customer.first_name, customer.last_name
FROM customer 
INNER JOIN payment ON customer.customer_id=payment.customer_id 
GROUP BY customer.first_name, customer.last_name 
HAVING SUM(payment.amount) >= 175
ORDER BY SUM(payment.amount) DESC;

SELECT customer.address_id, customer.first_name, customer.last_name, address.city_id, city.country_id, country.country
FROM address
INNER JOIN customer ON customer.address_id=address.address_id
INNER JOIN city ON city.city_id=address.city_id
INNER JOIN country on city.country_id=country.country_id
WHERE country.country = 'Nepal';

SELECT payment.staff_id, staff.first_name, staff.last_name , COUNT(staff.last_name) 
FROM staff 
INNER JOIN payment ON payment.staff_id=staff.staff_id
GROUP BY payment.staff_id ,staff.first_name, staff.last_name
ORDER BY COUNT(staff.last_name) DESC
LIMIT 1;

SELECT COUNT(film.rating), film.rating
FROM film
WHERE film.rating IS NOT NULL
GROUP BY film.rating
ORDER BY COUNT(film.rating) DESC;

SELECT customer.first_name, customer.last_name, payment.amount
FROM payment 
INNER JOIN customer ON customer.customer_id=payment.customer_id
WHERE payment.amount > 6.99
GROUP BY payment.customer_id, customer.first_name, customer.last_name, payment.amount
HAVING COUNT(payment.customer_id) = 1;

SELECT COUNT(payment.amount)
FROM payment 
WHERE payment.amount = 0
GROUP BY payment.amount;
