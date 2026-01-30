package com.sist.web.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import com.sist.web.security.LoginFailHandler;
import com.sist.web.security.LoginSuccessHandler;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

	private final LoginSuccessHandler loginSuccessHandler;
	private final LoginFailHandler loginFailHandler;
	private final DataSource dataSource;
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		
		http
			.csrf(csrf->csrf.disable())
			.authorizeRequests(auth -> auth
					.requestMatchers("/", 
							"/main/**", 
							"/admin/**", 
							"/place/**", 
							"/auth/**"
					).permitAll()
					.requestMatchers("/course/create/**").hasRole("USER")
					.requestMatchers("/mypage/**","/reserve/**").hasRole("USER")
					.requestMatchers("/admin/**").hasRole("ADMIN")
					.anyRequest().permitAll()
					//.anyRequest().authenticated()
			)
			
			.sessionManagement(session -> session
					.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
			)
			
			.formLogin(form -> form
					.loginPage("/auth/login")
					.loginProcessingUrl("/auth/login_process")
					.usernameParameter("id")
					.passwordParameter("pwd")
					.defaultSuccessUrl("/", true)
					.successHandler(loginSuccessHandler)
					.failureHandler(loginFailHandler)
					.permitAll()
			)
			
			.rememberMe(remember -> remember
					.key("my-secret-key")
					.rememberMeParameter("remember-me")
					.tokenValiditySeconds(60*60*24*30)
					.userDetailsService(jdbcUserDetailService())
			)
			
			.logout(logout->logout
					.logoutUrl("/auth/logout")
					.logoutSuccessUrl("/")
					.invalidateHttpSession(true)
					// 쿠키 삭제는 나중에
					//.deleteCookies("","")
			);
		return http.build();
	}
	
	@Bean
	public AuthenticationManager authenticationManager(HttpSecurity http, BCryptPasswordEncoder passwordEncoder) throws Exception{
		AuthenticationManagerBuilder builder = http.getSharedObject(AuthenticationManagerBuilder.class);
		
		builder
			.userDetailsService(jdbcUserDetailService())
			.passwordEncoder(passwordEncoder());
		
		return builder.build();
			
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public JdbcUserDetailsManager jdbcUserDetailService() {
		
		JdbcUserDetailsManager manager = new JdbcUserDetailsManager(dataSource);
		
		manager.setUsersByUsernameQuery(
			"SELECT id as username, pwd as password, enabled "
			+ "FROM users "
			+ "WHERE id = ?"
		);
		
		manager.setAuthoritiesByUsernameQuery(
			"SELECT id as username, role as authority "
			+ "FROM users "
			+ "WHERE id = ?"
		);
		
		return manager;
		
	}
	
}
