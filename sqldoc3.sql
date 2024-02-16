-- Inner join from the address and customer table
select address.address_id, city_id, district, postal_code 
from address 
inner join customer
on address.address_id = customer.address_id;

1.
-- Join that will produce info about a customer
  -- From the district of Texas
select customer.first_name, customer.last_name, district 
from customer
FULL join address 
on customer.address_id = address.address_id
where district = 'Texas';


2.
select customer.first_name, customer.last_name, payment.amount 
from customer
join payment on customer.customer_id = payment.customer_id 
where payment.amount > 6.99;


3.
select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by SUM(amount) desc 
	);

4.
select customer.first_name, customer.last_name, country 
from customer
join country
on customer.address_id = country.country_id
where country = 'Nepal';


5. 
select first_name, last_name
from staff
where staff_id = (
	select staff_id
	from payment
	group by staff_id ORDER by COUNT(*) desc
	limit 1
	);


6.
select rating, COUNT(*) as movie_count
from film
group by rating;


7.
select customer.first_name, customer.last_name 
from customer
where customer_id IN(
	select customer_id 
	from payment 
	group by customer_id having COUNT(*) = 1 and max(amount)> 6.99
	);

8.
select COUNT(*)
from payment
join rental on payment.rental_id = payment.amount 
where amount = 0;





























