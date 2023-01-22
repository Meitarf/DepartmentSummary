CREATE DATABASE [DepaermentSummary];

create table Departments (
DepartmentID int identity primary key,
Name char(100) not null,
Location char(100) not null);

create table Employees (
EmployeeID int identity primary key,
Name char(100) not null,
Salary int,
DepartmentID int references Departments(DepartmentID));

insert into Departments values 
('Executive', 'Sydney'),
('Production', 'Sydney'),
('Resources', 'Cape Town'),
('Technical', 'Texas'),
('Management', 'Paris')

insert into Employees values
('Candice', 4685, 1),
('Julia', 2559, 2),
('Bob', 4405, 4),
('Scarlet', 2350, 1),
('Ileana', 1151, 4)

select D.Name, COUNT(E.EmployeeID) 'NumEmployees'
from Departments D LEFT OUTER JOIN Employees E
ON D.DepartmentID = E.DepartmentID
group by D.Name
order by NumEmployees desc, D.Name