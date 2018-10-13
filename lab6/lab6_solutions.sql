/*
Author: Bryce DesBrisay
Partner: Julius Henkin
*/

select * from store order by sname asc

select * from store order by sname asc limit 3

select * from (select * from store order by sname desc limit 3) order by sname asc

select * from store where price > 1

select id, sname, qty, price, price * qty as "extended price" from store

select sum(price) as "price total" from store

select * from course where department_name = "CSC"

select sum(count) as "total enrollment" from course

select sum(id) as "total departments" from department_name

update course set department_id = 3 where cname = "112"

alter table enrollment add drop_count text
alter table enrollment alter column drop_count varchar(255)
alter table enrollment alter column drop_count integer

update enrollment set drop_count = count * 0.2
/*
Drop count: 8, 3, 2, 2, 12, 3, 40
*/

select group_concat(department.name, course.cname separator '') from course join department on department_id = department.id

select class.cname, department.name, enrollment.count from course join department on department_id = department.id join enrollment on course.id = enrollment.id order by department.name asc
/*
111 CSC 40
112 CSC 15
250 CSC 10
231 CSC 12
111 MTH 60
250 EGR 14
111 CHM 200
*/

alter table enrollment drop column drop_count
truncate table enrollment
drop table enrollment
create table if not exisis enrollment ( id integer auto_increment, department_name varchar(3), count integer, drop_count integer, primary key (id) )
insert into enrollment (department_name, count, drop_count) values ("CSC", 100, 20) values ("CHM", 120, 5) values ("MTH", 90, 3) values ("EGR", 122, 12) values ("MTH", 68, 6) values ("CSC", 100, 3) values ("CHM", 30, 1)
select max(count) as "highest enrollment" from (select department_name, count from enrollment join enrollment on department_name = department_name)