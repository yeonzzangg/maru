package com.maru.service.member;

import java.util.List;

import com.maru.domain.member.MemberDto;
import com.maru.domain.notice.PageInfo;

public interface MemberService {

	int insert(MemberDto member);
	
	MemberDto getById(String userId);

	int modify(MemberDto member);

	int remove(String userId);

	MemberDto getByEmail(String email);

	List<MemberDto> listMember(int page, String type, String keyword, PageInfo pageInfo);


}
