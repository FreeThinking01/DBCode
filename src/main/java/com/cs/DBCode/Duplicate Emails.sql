
# 编写一个 SQL 查询，查找Person 表中所有重复的电子邮箱。
#
# 示例：
#
# +----+---------+
# | Id | Email   |
# +----+---------+
# | 1  | a@b.com |
# | 2  | c@d.com |
# | 3  | a@b.com |
# +----+---------+
# 根据以上输入，你的查询应返回以下结果：
#
# +---------+
# | Email   |
# +---------+
# | a@b.com |
# +---------+

# 使用内连接
select email from Person A, Person B where A.Email = B.Email and A.Id != B.Id;

# 使用聚合函数
select email from (select email,count(email) as num from Person group by email) as statistic where num > 1;

# 使用having子句
select email from Person group by email having count(email) > 1;