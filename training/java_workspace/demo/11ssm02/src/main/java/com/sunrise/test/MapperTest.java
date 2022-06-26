package com.sunrise.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 * 测试dao层的工作
 * 推荐Spring的项目，使用Spring的单元测试，可以自动注入我们需要的组件
 * 1.导入SpringTest模块
 * 2.@ContextConfiguration指定Spring配置文件的位置
 * 3.直接autowired要使用的组件即可
 * */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
//	@Autowired
////	UserMapper userMapper;
//	@Autowired
////	EmpMapper empMapper;
//	@Autowired
//	SqlSession sqlSession;
	
	@Test
	public void testCRUD(){
		/* 
		//1.创建SpringIoC容器
		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		//2.从容器中获取mapper
		UserMapper bean = ioc.getBean(UserMapper.class);
		*/
//		System.out.println(userMapper);
		
		//1、插入用户信息
//		userMapper.insertSelective(new User(0,"kkk","123","啊对啊","M"));
		
		//批量~for(单条*100次)
//		for(int i=0;i<100;i++){
//			String uid = UUID.randomUUID().toString().substring(0,8)+i;
//			//userMapper.insertSelective(new User(0,uid,"123","啊对啊","M"));
//			empMapper.insertSelective(new Emp(null,uid,300.12,10,0,"BEIZHU"));
//		}
//		System.out.println("增加完毕");
		//查
//		UserExample example = new UserExample();
//		Criteria criteria = example.createCriteria();
//		criteria.andUsernameEqualTo("kkk");
//		List<User> list = userMapper.selectByExample(example);
//		System.out.println(list.get(0));
		
		
		
	}
}
