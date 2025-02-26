use classicmodels;

 select customerName from customers
where country = 'germany'

EXPLAIN ANALYZE SELECT `name` FROM customers WHERE country = 'Germany';

create index idx_country 
on table customers(country)

EXPLAIN  ANALYZE SELECT CUSTOMERNAME FROM customers WHERE country = 'Germany';