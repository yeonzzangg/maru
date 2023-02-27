package com.maru.domain.qna;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AnswerDto {
	private int number;
	private int qna_number;
	private String member_userId;
	private String content;
	private LocalDate insertDate;
	
	private boolean editable;
}
