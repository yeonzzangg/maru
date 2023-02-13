package com.maru.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.maru.domain.member.MemberDto;
import com.maru.mapper.member.MemberMapper;

@Component //빈을 만들기 위해 컴포넌 :  Bean이 되어야 스프링이 알아보고 UserDetailsService 를 사용한다.
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDto member = mapper.selectById(username);
		
		if (member == null) {
			return null;
		}
		
		List<SimpleGrantedAuthority> authorityList = new ArrayList<>();
		
		if(member.getAuth() != null) {
			for(String auth : member.getAuth()) {
				authorityList.add(new SimpleGrantedAuthority(auth));
			}
		}
				
		User user = new User(member.getUserId(), member.getPassword(), authorityList);
		//import org.springframework.security.core.userdetails.User;
		// 세번째 파라미터 : 권한 (authorization) = 유저/관리자 
		System.out.println(user);
		return user;
	}
		
	
}