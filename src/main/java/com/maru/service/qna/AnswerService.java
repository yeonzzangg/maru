package com.maru.service.qna;

import java.util.List;

import com.maru.domain.qna.AnswerDto;

public interface AnswerService {

	int insert(AnswerDto answer);

	List<AnswerDto> listAnswerByBoardId(int qna_number, String username);

	int deleteById(int number);

	int modify(AnswerDto answer);

	AnswerDto getById(int number);

}
