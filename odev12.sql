--film tablosunda film uzunluğu length sütununda gösterilmektedir.Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(title) FROM film WHERE length>(SELECT AVG(length) FROM film);

--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(*) FROM film WHERE rental_rate=(SELECT MAX(rental_rate) FROM film); 

--film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT * FROM film WHERE rental_rate=(SELECT MIN(rental_rate) FROM film) AND replacement_cost=(SELECT MIN(replacement_cost) FROM film);

--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT payment.customer_id, first_name, last_name FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
WHERE amount = (SELECT MAX(amount) from payment) ORDER BY customer_id ASC;
