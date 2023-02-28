package com.maru.domain.qna;

import java.time.LocalDate;

import lombok.Data;

@Data
public class QnaDto {
	private int number;
	private String member_userId;
	private String title;
	private String content;
	private String status;
	private LocalDate insertDate;
}
