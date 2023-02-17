package com.maru.service.review;

import java.util.List;

import com.maru.domain.notice.PageInfo;
import com.maru.domain.review.ReviewDto;


public interface ReviewService {
	
	// 글작성
	int insert(ReviewDto review);

	// 공지목록
	List<ReviewDto> listReview(int page, String type, String keyword, PageInfo pageInfo, String category);

	ReviewDto get(int number, String member_userId);
	
	ReviewDto get(int number);

	int update(ReviewDto review);

	int remove(int number);


}
