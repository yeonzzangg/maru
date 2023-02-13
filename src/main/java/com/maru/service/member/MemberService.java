package com.maru.service.member;

import java.util.List;

import com.maru.domain.member.MemberDto;

public interface MemberService {

	int insert(MemberDto member);
	
	List<MemberDto> memberList();

	MemberDto getById(String userId);

	int modify(MemberDto member);

	int remove(String userId);

	MemberDto getByEmail(String email);


}
