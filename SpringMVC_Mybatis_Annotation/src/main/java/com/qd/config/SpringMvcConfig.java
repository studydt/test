package com.qd.config;


import com.qd.Intercepter.LoginIntercepter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.Properties;

@Configuration
@ComponentScan( basePackages = {"com.qd.controller"})
public class SpringMvcConfig {

    @Bean
    public InternalResourceViewResolver resourceViewResolver(){
        InternalResourceViewResolver viewResolver=new InternalResourceViewResolver();
//        viewResolver.setPrefix("/pages/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }



//    @Bean
//    public SimpleMappingExceptionResolver simpleMappingExceptionResolver(){
//        SimpleMappingExceptionResolver sr = new SimpleMappingExceptionResolver();
//        Properties mappings = new Properties();
//        mappings.setProperty(Exception.class.getName(),"error/error");
//        mappings.setProperty(NoHandlerFoundException.class.getName(),"error/404");
//        sr.setExceptionMappings(mappings);
//        sr.setDefaultErrorView("error/default");
//        return sr;
//    }



}
