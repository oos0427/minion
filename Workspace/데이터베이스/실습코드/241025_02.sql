-- 셀프조인
CREATE TABLE employees ( 
    employee_id INT PRIMARY KEY, 
    employee_name VARCHAR(50), 
    manager_id INT, 
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id) 
); 

INSERT INTO employees VALUES (1, 'John', NULL); 
INSERT INTO employees VALUES (2, 'Jane', 1); 
INSERT INTO employees VALUES (3, 'Bob', 2); 
INSERT INTO employees VALUES (4, 'Alice', 1); 
INSERT INTO employees VALUES (5, 'Charlie', 3); 

select * from employees;


-- 사원정보조회 : 아이디, 이름, 매니저이름

-- select employee_id, employee_name, employee_name as manager_name
select e1.employee_id, e1.employee_name, e2.employee_name as manager_name
from employees e1 -- employees table
left outer join employees e2 -- manager table
on e1.manager_id = e2.employee_id;

select * from orders;
select * from customer where custid in (select custid from orders where bookid = 2);

-- 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오
select *
from customer c
inner join orders o
on c.custid = o.custid 
where o.bookid in ( select bookid 
                    from book 
                    where publisher = '대한미디어' );



                