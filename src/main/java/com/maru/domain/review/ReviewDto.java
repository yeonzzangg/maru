package com.maru.domain.review;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ReviewDto {
	private int number;
	private String category;
	private String title;
	private String content;
	private String member_userId;
	private LocalDate insertDate;
	
	
}
