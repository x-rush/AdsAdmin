
表与表之间的关系

关系型数据库 MySQL Oracle SQLServer DB2 

数据  对应现实世界中 模型 -> 表 

实体类 

1:1
1:M	M:1
M:N

	桌子 
	id	name 	颜色 		材质
	1	双人桌	浅枫木色	铁艺
	2	六人桌	深枫木色	木质
	3	双人桌	深枫木色
	4	六人桌	浅枫木色
	5	六人桌	白色
	
	颜色
	id	name 
	1	浅枫木色
	2	深枫木色
	3	白色
	
	
	材质 
	id	name
	1	木质
	2	铁艺
	3	塑料


	部门 
	id	name 	
	1	市场部
	2	财务部
	3	研发部	
	
	员工
	id	name	部门ID 
	1	小明	3
	2	小红	3
	3	哪吒 	3
	4	哪吒2 	1
	5	哪吒3 	1
	
	
	一对一
	
	A 
	id	name 
	1	xxx
	
	B
	id	aid name 
	33	1	xxxxxx 
	
	
	多对多
	
	电影
	id	name 
	1	烈火英雄
	2	哪吒 
	3	使徒行者
	4	鼠胆英雄
	
	演员
	id	name 
	1	李现
	2	岳云鹏
	3	黄晓明
	4	杜江
	5	哪吒

	中间表
	id	电影ID	演员ID 
	1	1		1
	2	1		2
	3	1		3
	4	2		3
	5	2		4
	6	2		5

多表数据显示
	
	对应DB中 tb_product_type ->实体类 Dao层文件 service controller 
	
	https://blog.csdn.net/rain097790/article/details/13615291

SVN使用 

