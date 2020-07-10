desc salesman;
insert into Inchara_activities.salesman values ('5001', 'james hoog' ,'New york','15');
desc salesman;
select * from salesman;
insert into salesman values('5002','Nail Knite','Paris','13'),('5005','Pit Alex','London','11'),('5006','McLyon','Paris','14'),('5007','Paul Adam','Rome','13'),('5003','Lauson Hen','San Jose','12');
Select * from salesman;
select  salesman_id,city from salesman;
Select * from salesman;
select * from salesman where city ='paris';
Select * from salesman;
select  salesman_id,commission from salesman where name ='Paul Adam';
alter table salesman add grade int;
select * from salesman;
update salesman set grade = 100;
select * from salesman; 
update salesman set grade =100;
update salesman set grade=200 where city='Rome';
select * from salesman;
select * from salesman;
update salesman set grade=100;
update salesman set grade=100;
select * from salesman;
use inchara_activities;
use Inchara_activities;
select * from salesman;
update salesman set grade =100;
select * from salesman;
update salesman set grade =200 where city ='Rome';
select * from salesman;
update salesman set name ='pierre' where name ='McLyon';
select * from salesman;
use Inchara_activities;
desc salesman;
select * from salesman;
use Inchara_activities;
update salesman set grade =300 where name ='james hoog';
select * from salesman;
use Inchara_activities
-- Create a table named orders
create table orders(
    order_no int primary key, purchase_amount float, order_date date,
    customer_id int, salesman_id int);

-- Add values to the table
use Inchara_activities;
use Inchara_activities;
Create table orders (
order_no int primary key, purchase_amount float, order_date date,customer_id int, salesman_id int);

insert into orders values
(70001, 150.5, '2012-10-05', 3005, 5002), (70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001), (70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002), (70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-08-15', 3002, 5001), (70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003), (70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007), (70013, 3045.6, '2012-04-25', 3002, 5001);
desc orders;
Select * from orders;
select distinct salesman_id from orders;
select * from orders;
Select order_no,order_date from orders order by order_date;
select * from orders;
Select order_no,purchase_amount from orders order by purchase_amount desc;
select * from orders;
Select * from orders where purchase_amount<500;
Select * from orders where purchase_amount between 1000 and 2000;
Select * from orders;

Select sum(purchase_amount) as totals from orders;
select AVG(purchase_amount) as average from orders;
select max(purchase_amount) as max from orders;
select Max(purchase_amount) as max from orders;
select max(purchase_amount) as maximum from orders;
select min(purchase_amount) as minimum from orders;
sELECT * FROM orders;
Select  count(distinct salesman_id) as counts from orders;
select * from orders;
Select customer_id, max(purchase_amount) as maxpurchase from orders group by customer_id;
Select Salesman_id ,order_date, max(purchase_amount) as maxpurch from orders where order_date = '2012-08-17' group by Salesman_id,order_date;
Select customer_id,order_date,max(purchase_amount)  as maxpurchaseamount from orders group by customer_id,order_date having max(purchase_amount) IN (2030, 3450, 5760, 6000);
use Inchara_activities;
create table customers (
    customer_id int primary key, customer_name varchar(32),
    city varchar(20), grade int, salesman_id int);
    insert into customers values 
(3002, 'Nick Rimando', 'New York', 100, 5001), (3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002), (3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006), (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007), (3001, 'Brad Guzan', 'London', 300, 5005);
select * from customers;

SELECT a.customer_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission FROM customers a 
INNER JOIN salesman b ON a.salesman_id=b.salesman_id;
SELECT a.customer_name, a.city, a.grade, b.name AS "Salesman", b.city FROM customers a 
LEFT OUTER JOIN salesman b ON a.salesman_id=b.salesman_id WHERE a.grade<300 
ORDER BY a.customer_id;

SELECT a.customer_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission FROM customers a 
INNER JOIN salesman b ON a.salesman_id=b.salesman_id 
WHERE b.commission>12;

SELECT a.order_no, a.order_date, a.purchase_amount, b.customer_name AS "Customer Name", b.grade, c.name AS "Salesman", c.commission FROM orders a 
INNER JOIN customers b ON a.customer_id=b.customer_id 
INNER JOIN salesman c ON a.salesman_id=c.salesman_id;
SELECT * FROM orders
WHERE salesman_id=(SELECT DISTINCT salesman_id FROM orders WHERE customer_id=3007);
SELECT * FROM orders
WHERE salesman_id IN (SELECT salesman_id FROM salesman WHERE city='New York');

SELECT grade, COUNT(*) FROM customers
GROUP BY grade HAVING grade>(SELECT AVG(grade) FROM customers WHERE city='New York');

SELECT order_no, purchase_amount, order_date, salesman_id FROM orders
WHERE salesman_id IN( SELECT salesman_id FROM salesman
WHERE commission=( SELECT MAX(commission) FROM salesman));