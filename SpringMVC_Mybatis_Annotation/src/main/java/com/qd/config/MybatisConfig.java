package com.qd.config;


import com.alibaba.druid.pool.DruidDataSource;
import com.github.pagehelper.PageInterceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Config;
import tk.mybatis.mapper.mapperhelper.MapperHelper;
import tk.mybatis.spring.annotation.MapperScan;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@Configuration
@PropertySource(value = "classpath:db.properties")
@MapperScan(value = { "tk.mybatis.mapper.annotation","com.qd.mapper"},mapperHelperRef = "mapperHelper")
public class MybatisConfig {


    @Value("${db.url}")
    private String url;
    @Value("${db.driver}")
    private String driver;
    @Value("${db.user}")
    private String user;
    @Value("${db.password}")
    private String password;



    // 注册数据源
    @Bean(name = "dataSource")
    public DruidDataSource dataSource(){
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUrl(url+"?serverTimezone=UTC&useSSL=true");
        dataSource.setDriverClassName(driver);
        dataSource.setUsername(user);
        dataSource.setPassword(password);
        return dataSource;
    }

    // 注册会话工厂
    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactoryBean sqlSessionFactory(){
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());
        // 设置mapper 文件映射
        PathMatchingResourcePatternResolver patternResolver = new PathMatchingResourcePatternResolver();
        try {
            sqlSessionFactoryBean.setMapperLocations(patternResolver.getResources("classpath:mapper/**/*.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        // mybatis 一些系统配置
        org.apache.ibatis.session.Configuration cfg = new org.apache.ibatis.session.Configuration();
        cfg.setMapUnderscoreToCamelCase(true);// 继续...
        sqlSessionFactoryBean.setConfiguration(cfg);// 配置设置完毕


        //设置分页插件
        PageInterceptor pageInterceptor = new PageInterceptor();
        Properties pageProps = new Properties();
        pageProps.setProperty("helperDialect","mysql");
        pageProps.setProperty("reasonable","true");
        pageProps.setProperty("supportMethodsArguments","true");
        pageProps.setProperty("params","count=countSql");
        pageProps.setProperty("autoRuntimeDialect","true");
        pageInterceptor.setProperties(pageProps);
        sqlSessionFactoryBean.setPlugins(new PageInterceptor[]{pageInterceptor});

        return sqlSessionFactoryBean;
    }

    // 注册事务
    @Bean
    public DataSourceTransactionManager transactionManager(){
        DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
        dataSourceTransactionManager.setDataSource(dataSource());
        return dataSourceTransactionManager;
    }

    @Bean
    public MapperHelper mapperHelper(){
        Config config=new Config();
        List<Class> mappers=new ArrayList<Class>();
        mappers.add(Mapper.class);
        config.setMappers(mappers);

        MapperHelper mapperHelper=new MapperHelper();
        mapperHelper.setConfig(config);
        return mapperHelper;

    }


}
