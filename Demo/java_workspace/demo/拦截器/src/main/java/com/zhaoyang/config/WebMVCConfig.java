package com.zhaoyang.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import com.zhaoyang.interceptor.Interceptor01;
import com.zhaoyang.interceptor.LoginInterceptor;

// 拦截器的配置类
// 登陆拦截器的配置
@Configuration
public class WebMVCConfig extends WebMvcConfigurationSupport {
	
	@Autowired
	LoginInterceptor login;

	@Override
	protected void addInterceptors(InterceptorRegistry registry) {
		// 注册拦截器
		// 拦截的路径地址
		// 不拦截的路径地址
		registry.addInterceptor(login).addPathPatterns("/**").excludePathPatterns("/user/login","/login.html","/js/*");

		super.addInterceptors(registry);
	}

	
	// Springboot项目、注册拦截器之后、访问不到静态资源
	@Override
	protected void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
	}

}
