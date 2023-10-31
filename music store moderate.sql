--1. Senior most employee based on job title

select first_name, last_name
from employee
order by title desc
limit 1

--2.  Counrty having most invoices

select billing_country,count(*) as no_of_invoices
from invoice
group by billing_country
order by no_of_invoices desc
limit 1

--3. Top 3 values of total invoices

select total 
from invoice
order by total desc
limit 3

--4. City that has the highest sum of invoice total

select billing_city,sum(total) as invoice_total
from invoice
group by billing_city
order by invoice_total desc
limit 1

--5. Person who spent most money
 
select customer.customer_id,first_name,last_name, sum(total) as total_spending
from customer 
join invoice 
on invoice.customer_id=customer.customer_id
group by customer.customer_id
order by total_spending desc
limit 1


-- Query to return the email, first name, last name, & Genre of all Rock Music listeners, 
--ordered alphabetically by email starting with A.


select distinct first_name, last_name, email
from customer
join invoice
on invoice.customer_id=customer.customer_id
join invoice_line
on invoice_line.invoice_id=invoice.invoice_id
where track_id in
(
	select track_id
from track
join genre
on genre.genre_id=track.genre_id
where genre.name like 'Rock'
)
order by email


-- 6. The artists who have written the most rock music in our dataset or  
-- return the Artist name and total track count of the top 10 rock bands. 

select artist.name, count(artist.artist_id)  as no_of_tracks
from track
join album
on album.album_id=track.album_id
join artist
on artist.artist_id=album.artist_id
join genre
on genre.genre_id=track.genre_id
where genre.name like 'Rock'
group by artist.name
order by no_of_tracks desc
limit 10


--7. Return all the track names that have a song length longer than the average song length. 
--   Return the Name and Milliseconds for each track. 
--   Order by the song length with the longest songs listed first. 
 
select name, milliseconds
from track
where milliseconds>
(
select avg(milliseconds) as average_time
from track
)
order by milliseconds desc


























