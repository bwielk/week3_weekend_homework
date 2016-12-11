DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
id SERIAL8 primary key,
name VARCHAR(255),
funds INT8
);

CREATE TABLE films (
id SERIAL8 primary key,
title VARCHAR(255),
price INT8,
customer_id INT8 references customers(id)
);

CREATE TABLE tickets (
id SERIAL8 primary key,
customer_id INT8 references customers(id),
film_id INT8 references films(id),
show_time VARCHAR(255)
);





-- Create a system that handles bookings for our newly built cinema! 
-- It's enough if you can call your methods in pry, don't worry about an interface.

-- ###Your app should have:
--   - Customers
--     - name
--     - funds

--   - Films
--     - title
--     - price

--   - Tickets
    -- - customer_id
    -- - film_id

-- ###Your app should be able to:
--   - Create customers, films and tickets
--   - CRUD actions (create, read, update, delete) customers, films and tickets.
--   - Show which films a customer has booked to see, and see which customers are coming to see one film.

-- ###Basic extensions:
--   - Buying tickets should decrease the funds of the customer by the price
--   - Check how many tickets were bought by a customer
--   - Check how many customers are going to watch a certain film

-- ###Advanced extensions:
--   - Add a new 'time' row for the tickets
--     - Write a method that finds out what is the most popular time (most tickets sold) for a given film
--   - Add a limit to available tickets.
--   - Add any other extensions you think would be great to have at a cinema!

-- Possible useful info on constraints:
-- https://www.postgresql.org/docs/9.3/static/ddl-constraints.html