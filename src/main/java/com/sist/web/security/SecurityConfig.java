package com.sist.web.security;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

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
							"/auth/**",
							"/mypage/**"
					).permitAll()
					//.requestMatchers("/mypage/**", "/course/**").hasRole("USER")
					//.requestMatchers("/admin/**").hasRole("ADMIN")
					.anyRequest().permitAll()
			)
			
			.formLogin(form -> form
					.loginPage("/auth/login")
					.loginProcessingUrl("/auth/login_process")
					.usernameParameter("id")
					.passwordParameter("pwd")
					.defaultSuccessUrl("/", false)
					.successHandler(loginSuccessHandler)
					.failureHandler(loginFailHandler)
					.permitAll()
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
