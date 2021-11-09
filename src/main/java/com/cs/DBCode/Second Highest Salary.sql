#
# 第二高的薪水
# 编写一个 SQL 查询，获取 Employee表中第二高的薪水（Salary）。
# 
# +----+--------+
# | Id | Salary |
# +----+--------+
# | 1  | 100    |
# | 2  | 200    |
# | 3  | 300    |
# +----+--------+
# 例如上述Employee表，SQL查询应该返回200 作为第二高的薪水。如果不存在第二高的薪水，那么查询应返回 null。
# 
# +---------------------+
# | SecondHighestSalary |
# +---------------------+
# | 200                 |
# +---------------------+


# 写法1
select DISTINCT Salary as SecondHighestSalary
from Employee
order by Salary desc
limit 1,1;

# 写法2

# limit x, y 分句表示: 跳过 x 条数据，读取 y 条数据
#
# limit y offset x 分句表示: 跳过 x 条数据，读取 y 条数据

select DISTINCT Salary as SecondHighestSalary
from Employee
order by Salary desc
limit 1 offset 1;


# 上面有问题的情况在于无法满足题目要求的不存在返回null
select (select distinct Salary from Employee order by Salary desc limit 1,1) as SecondHighestSalary;

SELECT ifnull((SELECT DISTINCT Salary
               FROM Employee
               ORDER BY Salary DESC
               LIMIT 1 OFFSET 1), null) AS SecondHighestSalary
;

