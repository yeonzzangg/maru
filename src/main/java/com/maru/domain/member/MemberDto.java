package com.maru.domain.member;

import java.util.List;

import lombok.Data;

@Data
public class MemberDto {
	private String userId;
	private String password;
	private String name;
	private String email;
	
	private List<String> auth;
}
