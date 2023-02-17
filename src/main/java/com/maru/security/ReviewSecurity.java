package com.maru.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.maru.domain.review.ReviewDto;
import com.maru.mapper.review.ReviewMapper;

@Component //빈을 만들기 위해 컴포넌
public class ReviewSecurity {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	// 게시물 권한체크
	// 로그인된 아이디랑 작성자 아이디 같아야만 수정가능하게
	public boolean checkWriter(String userName, int number) {
		ReviewDto review = reviewMapper.select(number);
		
		return review.getMember_userId().equals(userName);
	}
}
