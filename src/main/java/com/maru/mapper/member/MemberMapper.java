package com.maru.mapper.member;

import java.util.List;

import com.maru.domain.member.MemberDto;

public interface MemberMapper {

	// 회원가입
	public int insert(MemberDto member);

	// 회원목록
	List<MemberDto> selectMemberList();
	//public List<MemberDto> selectMemberList(int offset, int records, String string, String type);

	// 회원정보
	public MemberDto selectById(String userId);

	// 회원정보 수정
	public int update(MemberDto member);

	// 회원 아이디
	public int deletById(String userId);

	// 회원 이메일
	public MemberDto selectByEmail(String email);

	//전체회원정보 검색가능하기 위해 select count(*) 
	//public int selectAllMemberCount(String type, String keyword);

}
