package com.maru.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.maru.domain.member.MemberDto;
import com.maru.mapper.member.MemberMapper;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 회원가입
	@Override
	public int insert(MemberDto member) {
		// 암호화 해서 저장
		String pw = member.getPassword();
		member.setPassword(passwordEncoder.encode(pw));
		
		return mapper.insert(member);
	}
	
	//회원목록
	@Override
	public List<MemberDto> memberList() {
		return mapper.selectMemberList(); 
	}
	
	// 회원아이디
	@Override
	public MemberDto getById(String userId) { 
		return mapper.selectById(userId);     
	}
	
	// 회원정보 수정
	public int modify(MemberDto member) {
		int cnt = 0;
		
		try {
			if (member.getPassword() != null) { // 수정할때 변경체크해야만 값이 넘어가므로 null이 아닐때만 일하게
				String encodePw = passwordEncoder.encode(member.getPassword()); 
				member.setPassword(encodePw);				
			}
			return mapper.update(member);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// 회원탈퇴
	public int remove(String userId) {
		return mapper.deletById(userId);
	}
	
/*	@Override
	public List<MemberDto> selectMemberList(int page, MemberPageInfo memberPageInfo, String keyword, String type) {
		int records = 10;
		int offset = (page - 1) * records; //?page=2 =>  11~20 레코드들.  offset = 10  이어야함 .
		int countAllMember = mapper.selectAllMemberCount(type, "%"+keyword+"%");
		// 11명 => lastP =2 .. 11 - 1 /10 +1 ?  
		//  21 => 3             21-1/10 =2 +1
		int lastPageNumber = (countAllMember - 1) / records + 1;
		// page보기 1~10 개중...현재 page=2 라면,, 왼쪽에 1 오른쪽 8
		// page보기 11~20 개중...현재 page=15 라면,, 왼쪽에 4(11,12,13,14) 오른쪽 5 (16,17,18,19,20) =>leftPageNumber=11
							//15 -1 /10 =1 *10 =10 +1 =>11
							//27 -1 /10 =2 *10 =20 +1 =>21
		int leftPageNumber = (page - 1) / 10 * 10 + 1;
		int rightPageNumber = leftPageNumber + 9; //11 ~ 20 , 21 ~ 30, 31 ~ 40 
		rightPageNumber = Math.min(rightPageNumber, lastPageNumber);
		
		int jumpPrevPageNumber = (page - 1) / 10 * 10 - 9; 
		int jumpNextPageNumber = (page - 1) / 10 * 10 + 11;  
		boolean hasPrevButton = page > 10;
		boolean hasNextButton = page <= (lastPageNumber - 1) /10 * 10 ;
		
		memberPageInfo.setCurrentPageNumber(page);
		memberPageInfo.setLastPageNumber(lastPageNumber);
		memberPageInfo.setLeftPageNumber(leftPageNumber);
		memberPageInfo.setRightPageNumber(rightPageNumber);
		memberPageInfo.setJumpPrevPageNumber(jumpPrevPageNumber);
		memberPageInfo.setJumpPrevPageNumber(jumpNextPageNumber);
		memberPageInfo.setHasPrevButton(hasPrevButton);
		memberPageInfo.setHasNextButton(hasNextButton);
		
		return mapper.selectMemberList(offset, records, "%" + keyword + "%", type);
	}*/
	
	// 이메일
	@Override
	public MemberDto getByEmail(String email) {
		return mapper.selectByEmail(email); 
	}
	
	
}
