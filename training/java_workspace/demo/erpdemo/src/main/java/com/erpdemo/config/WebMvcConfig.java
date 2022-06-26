package com.erpdemo.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.erpdemo.utils.FileUploadProperteis;
import com.erpdemo.utils.interceptor.AuthorizationInterceptor;
import com.erpdemo.utils.resolver.LoginUserHandlerMethodArgumentResolver;

/**
 * MVC配置
 *
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
	
    @Autowired
    private AuthorizationInterceptor authorizationInterceptor;
    @Autowired
    private LoginUserHandlerMethodArgumentResolver loginUserHandlerMethodArgumentResolver;
    
    @Autowired
    private FileUploadProperteis fileUploadProperteis;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authorizationInterceptor).addPathPatterns("/api/**");
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(loginUserHandlerMethodArgumentResolver);
    }
    
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(fileUploadProperteis.getStaticAccessPath()).addResourceLocations("file:" + fileUploadProperteis.getUploadFolder() + "/");
    }

	public AuthorizationInterceptor getAuthorizationInterceptor() {
		return authorizationInterceptor;
	}

	public LoginUserHandlerMethodArgumentResolver getLoginUserHandlerMethodArgumentResolver() {
		return loginUserHandlerMethodArgumentResolver;
	}

	public FileUploadProperteis getFileUploadProperteis() {
		return fileUploadProperteis;
	}
    
    
    
    
    
}
