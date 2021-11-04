--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, salary.monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id

--2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, salary.monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where monthly_salary < '2000'

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary, employee_name
from salary 
left join employee_salary
    on salary.id = employee_salary.salary_id 
left outer join employees  
    on employees.id = employee_salary.employee_id
where employees.employee_name is null 


--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary, employee_name
from salary 
join employee_salary
    on salary.id = employee_salary.salary_id 
left outer join employees  
    on employees.id = employee_salary.employee_id
where employees.employee_name is null and salary.monthly_salary < 2000

--5. Найти всех работников кому не начислена ЗП.
select salary.monthly_salary, employee_name
from salary 
join employee_salary
    on salary.id = employee_salary.salary_id 
right outer join employees  
    on employees.id = employee_salary.employee_id
where employee_salary.salary_id is null

--6. Вывести всех работников с названиями их должности.
select employee_name, role_name
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 

--7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
where role_name like '%Java%'

--8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
where role_name like '%Python%'

--9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
where role_name like '%QA engineer%'

--10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
where role_name like '%Manual QA engineer%'

--11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
where role_name like '%Automation QA engineer%'

--12. Вывести имена и зарплаты Junior специалистов
select employee_name, role_name, monthly_salary
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%Junior%'

--13. Вывести имена и зарплаты Middle специалистов
select employee_name, role_name, monthly_salary
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%Middle%'

--14. Вывести имена и зарплаты Senior специалистов
select employee_name, role_name, monthly_salary
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%Senior%'

--15. Вывести зарплаты Java разработчиков
select role_name, monthly_salary
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%Java developer%'

--16. Вывести зарплаты Python разработчиков
select role_name, monthly_salary
from employees  
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%Python developer%'

--17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, role_name, monthly_salary
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%Junior Python developer%'

--18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, role_name, monthly_salary
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%Middle JavaScript developer%'

--19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, role_name, monthly_salary
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%Senior Java developer%'

--20. Вывести зарплаты Junior QA инженеров
select role_name, monthly_salary
from employees  
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%Junior%QA engineer%'

--21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) as avg_salary from salary s  
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
select SUM(monthly_salary)
from employees  
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%JavaScript developer%'

--23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary)
from employees  
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%QA engineer%'

--24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary)
from employees  
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%QA engineer%'

--25. Вывести количество QA инженеров
select count(roles)
from employees  
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%QA engineer%'

--26. Вывести количество Middle специалистов.
select count(roles)
from employees  
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%Middle%'

--27. Вывести количество разработчиков
select count(roles)
from employees  
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%developer%'

--28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(monthly_salary)
from employees  
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
left outer join salary on salary.id = employee_id
where role_name like '%developer%'

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, salary.monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
order by monthly_salary ASC;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, salary.monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
where monthly_salary between '1700' and '2300'
order by monthly_salary ASC;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, salary.monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
where monthly_salary < '2300'
order by monthly_salary ASC;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, salary.monthly_salary
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on role_id = roles.id 
where "monthly_salary" in ('1100', '1500', '2000')
order by monthly_salary ASC;