package com.maru.config;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

/*import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;*/

@Configuration
@MapperScan("com.maru.mapper")
@EnableGlobalMethodSecurity(prePostEnabled = true) // @PreAuthorize사용하기 위한 설정
public class CustomConfig {

	@Autowired
	private ServletContext servletContext;
	

	// 비밀번호 암호화 빈
	// 시큐리티에서 권장하는 패스워드 인코더 BCryptPasswordEncoder()
	@Bean 
	public PasswordEncoder passwordEncoder() {
		
		return new BCryptPasswordEncoder();
	}
	
	// HttpSecurity 이 객체로 시큐리티 필터체인 쉽게 만들수있음
	// formLogin()은 formloginconfigure리턴
	@Bean 
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.formLogin().loginPage("/member/login").defaultSuccessUrl("/main/list", true);
		http.logout().logoutUrl("/member/logout").logoutSuccessUrl("/member/login");
		http.csrf().disable(); // 생략
		
		return http.build();
	}
	
}







