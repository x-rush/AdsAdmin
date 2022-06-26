package com.yangfulai;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
/**
 * 
 * TODO<工程启动类(需要启动redis服务器)>
 * @author  杨福来
 * @date  2019年8月23日 下午2:17:04
 * @version  V1.0
 * 扫描dao层创建dao层实体类的注解-@MapperScan(value = "com.yangfulai.dao")
 */
@SpringBootApplication
@EnableCaching//缓存注解	需要启动redis服务器
@MapperScan(value = "com.yangfulai.dao")
public class Ajax0SsmApplication {

	public static void main(String[] args) {
		SpringApplication.run(Ajax0SsmApplication.class, args);
	}

}
