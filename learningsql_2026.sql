select * from security_user;
-- expects result 3 rows

select *from timesheet tm;
-- expects result 6 rows (2 rows with user id 2 and 4 rows for user id 3)

-- inner join
-- expection pull records present on both tables
-- expects result 6 as matching user id rows are 6 from both tables
select su.first_name,su.last_name,tm.project,tm.login_date,tm.logged_hr 
from security_user su inner join 
timesheet tm on su.id = tm.security_user_id;

-- left join
-- pull records for first table security_user present  on second table as well as not 
-- present on second table timesheet
-- expects result 7
-- 2 users from security_user table have matching 6 records in timesheet table and 1 user
-- from security_user is not present  in timesheet table
select su.id,su.first_name,su.last_name,su.username,tm.security_user_id,
tm.project,tm.login_date,tm.logged_hr 
from security_user su left join 
timesheet tm on su.id = tm.security_user_id;

-- right join
-- pull all records related to second table timesheet both present in first table security_user
-- as well as not present in the second table
-- expects result 6
select su.id,su.first_name,su.last_name,su.username,tm.security_user_id,
tm.project,tm.login_date,tm.logged_hr 
from security_user su right join 
timesheet tm on su.id = tm.security_user_id;

-- full outer join
--  security_user has 3 records with 3 users, timesheet table 6 records for 2 users
-- expects 7 records
select su.id,su.first_name,su.last_name,su.username,tm.security_user_id,
tm.project,tm.login_date,tm.logged_hr 
from security_user su full outer join 
timesheet tm on su.id = tm.security_user_id;


-- self join
select emp.name,m.name manager_name,emp.department
from employee emp left join 
employee m 
on emp.managerid=m.id
order by emp.department;

select emp.name,m.name manager_name
from employee emp join 
employee m 
on emp.managerid=m.id;

select emp1.name employee1,emp2.name employee2,emp1.city from
employee emp1,employee emp2
where emp1.id<>emp2.id
and emp1.city=emp2.city
order by emp1.city;

select emp1.name as name1,
emp2.name as name2,
emp1.city
from employee emp1
inner join 
employee emp2
on emp1.city=emp2.city and emp1.id<>emp2.id
order by emp1.city;

-- find duplicate employee records
select emp1.* from
employee emp1
inner join 
employee emp2
on emp1.name=emp2.name
and emp1.department=emp1.department
and emp1.city=emp2.city
and emp1.id<>emp2.id

-- duplicate records
select * from (select name,salary,department,city,employeeid,row_number() 
over(partition by name,salary,department,city,employeeid) rowno from employee)
where rowno>1;

--select *from employee;






