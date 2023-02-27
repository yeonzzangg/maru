package com.maru.mapper.qna;

import java.util.List;

import com.maru.domain.qna.AnswerDto;

public interface AnswerMapper {

	int insert(AnswerDto answer);

	List<AnswerDto> listAnswerByBoardId(int qna_number, String username);

	int deleteById(int number);

	int update(AnswerDto answer);

	AnswerDto getById(int number);
	
}
