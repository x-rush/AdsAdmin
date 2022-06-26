package com.erpdemo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@MapperScan("com.erpdemo.dao")
@SpringBootApplication
public class ErpdemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ErpdemoApplication.class, args);

	
	}

}
