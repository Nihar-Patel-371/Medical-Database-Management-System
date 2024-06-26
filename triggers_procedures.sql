-- Queries:-

1) select name,salary
   from employee
   group by name,salary
   having salary > (select avg(salary)
                    from employee 
                    where city='bangalore')
   order by 2 asc;

2) update mediquipment set price=300
   where cid in (select cid
                 from manufacturer
                 where city='pune');

3) select p.name,pharid,count(distinct cid) as count1
   from pharmacy p, manufacturer
   where phid = pharid
   group by p.name, pharid
   having count(*)>1;

4) select p.name, e.name, e.salary
   from employee e, pharmacy p
   where phid=pharid
   minus
   select p.name,e.name, e.salary
   from employee e, pharmacy p
   where e.sex='f';

-- Procedure:-

1)create procedure update_medi as
  begin 
  update mediquipment set price = price+100 where trade_name='paramax';
  end;
  /
