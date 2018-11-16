/* 
  CSCI 3308
  Homework #3
  Bryce DesBrisay
 */

/* 1 */
select * from employees where not country = 'USA' and hiredate < now() - '5 years'::interval;

/* 2 */
select productid, productname, unitsinstock, unitprice from products where unitsinstock < reorderlevel and unitsinstock > 0

/* 3 */
select productname, unitprice from (select productname, unitprice from products order by unitprice desc limit 1) as low union (select productname, unitprice from products order by unitprice asc limit 1);

/* 4 */
select productid, productname, unitprice * unitsinstock as totalInventoryValue from products where unitprice * unitsinstock > 1000 order by totalInventoryValue desc;

/* 5 */
select count(orderid), shipcountry from orders where not shipcountry = 'Germany' and shippeddate between '2013-10-01' and '2013-10-31' group by shipcountry order by count(orderid) desc;

/* 6 */
select customerid, shipname, count(customerid) from orders group by customerid, shipname having count(customerid) >= 10 order by count(customerid) desc;

/* 7 */
select supplierid, count(supplierid), sum(unitsinstock * unitprice) as totalvalue from products group by supplierid having count(supplierid) >= 5;

/* 8 */
select x.companyname, x.productname, x.unitprice from (select y.companyname, y.supplierid, products.productname, products.unitprice from (select companyname, supplierid from suppliers where country = 'USA' or country = 'Germany') as y inner join products on y.supplierid = products.supplierid) as x order by x.unitprice desc;

/* 9 */
select employees.lastname, employees.firstname, employees.title, employees.extension, count(x) from (select employeeid, count(*) from orders group by employeeid having count(*) >= 50) as x join employees on employees.employeeid = x.employeeid order by employees.lastname;

/* 10 */
select customerid, companyname from customers where not exists (select * from orders where customerid = customers.customerid);

/* 11 */
select x.companyname, x.contactname, x.categoryname, x.description, x.productname, unitsonorder from (select * from (select * from products where unitsinstock = 0) as y join categories on categories.categoryid = y.categoryid join suppliers on suppliers.supplierid = y.supplierid) as x;

/* 12 */
select productname, suppliers.companyname, suppliers.country, unitsinstock from (select * from products where quantityperunit like '%bottle%' or quantityperunit like '%bag%' and not quantityperunit like '%box%') as x join suppliers on x.supplierid = suppliers.supplierid;

/* 13 */
create table top_items (id serial, ItemID integer not null, ItemCode integer not null, ItemName varchar(40) not null, InventoryDate timestamp not null, SupplierID integer not null, ItemQuantity integer not null, ItemPrice decimal (9,2) not null, primary key (ItemID));

/* 14 */
insert into top_items (itemid, itemcode, itemname, inventorydate, itemquantity, itemprice, supplierid) select productid, categoryid, productname, now(), unitsinstock, unitprice, supplierid from products where unitsinstock * unitprice > 1500; 

/* 15 */
delete from top_items where supplierid in (select supplierid from suppliers where country = 'USA' or country = 'Canada');

/* 16 */
alter table top_items add inventoryvalue decimal (9,2);

/* 17 */
update top_items set inventoryvalue = itemquantity * itemprice;

/* 18 */
drop table top_items;


