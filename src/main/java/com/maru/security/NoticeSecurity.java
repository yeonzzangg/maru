package com.maru.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.maru.domain.notice.NoticeDto;
import com.maru.mapper.notice.NoticeMapper;

@Component //빈을 만들기 위해 컴포넌
public class NoticeSecurity {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	// 게시물 권한체크
	// 로그인된 아이디랑 작성자 아이디 같아야만 수정가능하게
	public boolean checkWriter(String userName, int number) {
		NoticeDto notice = noticeMapper.select(number);
		
		return notice.getMember_userId().equals(userName);
	}
}
