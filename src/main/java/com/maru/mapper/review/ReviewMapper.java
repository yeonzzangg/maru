package com.maru.mapper.review;

import java.util.List;

import com.maru.domain.review.ReviewDto;


public interface ReviewMapper {

	int countAll(String type, String keyword);

	List<ReviewDto> list(int offset, int records, String type, String keyword, String category);

	int insert(ReviewDto review);

	public ReviewDto select(int number, String member_userId);

	default ReviewDto select(int number) {
		return select(number, null);
	}
	
	int update(ReviewDto review);

	int delete(int number);

}
