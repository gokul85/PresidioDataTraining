create table employee_src (
	Id int,
	Name varchar(50),
	CreatedAt datetime,
	);

create table employee_tgt (
	Id int primary key,
	Name varchar(50),
	IsDeleted bit
	);

select * from employee_src;
select * from employee_tgt;


create or alter procedure EmployeesSync
as
begin
		Insert Into employee_tgt(Id, Name, IsDeleted)
		select s.Id, s.Name, 0
		from employee_src s left join employee_tgt t on s.Id = t.Id
		where t.Id is null;

		with latestsourcedata as (
        select s.Id, s.Name, s.CreatedAt,
               ROW_NUMBER() over (partition by s.Id order by s.CreatedAt desc) as rn
        from employee_src s
		)
		update t
		set t.Name = lsd.Name
		from employee_tgt t
		inner join latestsourcedata lsd on t.Id = lsd.Id
		where lsd.rn = 1 and t.IsDeleted = 0 and (t.Name <> lsd.Name);

		update t
		set t.IsDeleted = 1
		from employee_tgt t
		left join employee_src s on t.Id = s.Id
		where s.Id is null
		and t.IsDeleted = 0;
end

exec EmployeesSync;


select * from employee_src;
select * from employee_tgt;

Insert Into employee_src (Id,Name,CreatedAt) values (1,'Rahull',GETDATE()), (2,'Rohit',GETDATE())
exec EmployeesSync;

Insert Into employee_src (Id,Name,CreatedAt) values (1,'Rahul',GETDATE())
exec EmployeesSync;

delete from employee_src where Id = 2;
exec EmployeesSync;

Insert Into employee_src (Id,Name,CreatedAt) values (4,'Ravii',GETDATE())
select * from employee_src;
select * from employee_tgt;
exec EmployeesSync;
select * from employee_tgt;

Insert Into employee_src (Id,Name,CreatedAt) values (4,'Ravi',GETDATE())
select * from employee_src;
select * from employee_tgt;
exec EmployeesSync;
select * from employee_tgt;

delete from employee_src where Id = 4;
select * from employee_src;
select * from employee_tgt;
exec EmployeesSync;
select * from employee_tgt;