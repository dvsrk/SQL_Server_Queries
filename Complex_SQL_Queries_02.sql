use EmployeeCaseStudy
GO

SELECT * FROM dbo.emp order by 1
GO

/*
Employee and Manager ID are in the same table; can you get manager names for employees?
*/

	--Method 01
		select 
			e.name as employee
			, 	CASE 
				WHEN m.name IS NULL THEN 'No Manager'
				ELSE m.name 
				END as manager_of_employee 
		from emp e
		left join emp m on e.manager_id = m.ID

	--Method 02
	--The issue with method 01 is that it can pull the data at each level but not the heirarchy. To get the heirarchy we can
	--use CTEs in SQL Server.
		;WITH cte AS
		(
			-- Initialization for recussion
			select id, name, manager_id, cast('no manager'as varchar(25)) as manager, 0 as heirarchy
			from emp 
			where emp.manager_id=0

			union all --required for the recusion to work

			--here i join the emp table with cte to perform recursion
			select e.id, e.name, e.manager_id, cast(m.name as varchar(25)) as manager, heirarchy+1
			from emp e
			join cte m on e.manager_id = m.ID
		)
		SELECT * from cte

/*
Get employees whos department does not exist
*/

	-- Tihis can be done in mutiple ways
	--method 01
		select e.name, e.dept_id from emp e
		where e.dept_id NOT IN (select distinct id from dept)

	--method 02 (preferred & more reliable approach)
		select e.name, e.dept_id
		from emp e
		left join dept d on e.dept_id = d.id
		where d.id is null

	--method 03
		select e.name, e.dept_id 
		from emp e
		where NOT EXISTS (
			select dept_id 
			from dept d 
			where e.dept_id=d.id)  

	--method 04 (This will give only department ids)
		select e.dept_id from emp e
		except 
		select d.id from dept d


/*
List the employees with same salary
*/

	--method 01
		select distinct e1.name, e1.Salary
		from emp e1
		join emp e2 on e1.Salary = e2.Salary
		where e1.ID != e2.ID
		order by 2

	--method 02
		; with cte as
		(
			select e.name, e.salary, Row_number() over (partition by salary order by salary) as row_id
			from emp e
		)
		select e.name, e.salary from emp e 
			where e.salary IN (select salary from cte where row_id > 1)

/*
find all duplicate records
*/
	--Method 01
		select id, name, salary, count(*) from emp
		group by id, name, salary 
		having count(*) >1

	--Method 02
		;with cte as 
		(
			select id, name, salary, ROW_NUMBER() over (partition by id, name, salary order by id) as row_id
			from emp
		)
		select * from cte where row_id > 1
/*
Delete duplicate rows from the table
*/
	--method 01
		;with cte as
		(
			select id,name,salary, ROW_NUMBER() over (partition by id, name, salary order by id) as row_id
			from emp

		)
		delete from cte where row_id >1

	--method 02
		set rowcount 1 
		delete from emp where id in(
			select id 
			from emp 
			group by id, name, salary 
			having count(*) > 1
		)
		set rowcount 0


/*
	Find second highest salary 
*/

	--method 01
		select max(salary) from emp 
		where salary not in (
				select max(salary) from emp
				)
	
	--method 02 (preferred, easy to get nth highest)
		;with cte as
		(
			select id, name, salary, dense_rank() over (order by salary desc) as den_ran
			from emp
		)
		select * from cte where den_ran = 2

	--method 03 (tricky way) by using N-1 = N-1
	select * from emp e1
	where (1) = (select count(distinct(Salary))	from emp e2 
					where e2.Salary > e1.Salary)

/*
Find max salary in each department
*/

	--Method 01
	select dept_name, max(salary)
		from emp
		join dept on emp.dept_id = dept.id
		group by dept_name

/*
show same record more than once in the result set
*/
	--method 01
		select * from emp where emp.name='emp 1'
		union all
		select * from emp where emp.name='emp 1'

/*
random selects & outputs
*/

	select 1			--output 1
	select '1'			--output 1
	select count('1')	--output 1
	select count(*)		--output 1
	select count(*)+count(*) --output 2
	select (select '#')	--output '#'
	select select 'e'	--output 'syntax error'
	select $			--output '0.00'
	select null+1		--output null (any operation on null results in null value)
	select null+'1'		--output null
	select null/0		--output null
	select sum(null)	--output 'error' (MIN, MAX, AVG, SUM won't accept null value as parameter)

/*
ways of getting top records with out using top clause
*/
	--method 01
		set rowcount 1
			select * from emp order by ID
			select * from dept
		set rowcount 0

	--method 02
	;with cte as
	(
		select *, ROW_NUMBER() over(order by id) as row_id
		from emp
	)
	select * from cte where row_id <4


