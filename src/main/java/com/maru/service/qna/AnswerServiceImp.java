package com.maru.service.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.maru.domain.qna.AnswerDto;
import com.maru.mapper.qna.AnswerMapper;

@Service
@Transactional
public class AnswerServiceImp implements AnswerService {
	
	@Autowired
	private AnswerMapper mapper;

	
	@Override
	public int insert(AnswerDto answer) {
		return mapper.insert(answer); 
	}
	
	@Override
	public List<AnswerDto> listAnswerByBoardId(int qna_number, String username){
		return mapper.listAnswerByBoardId(qna_number, username); 
	}
	
	@Override
	public int deleteById(int number) {
		return mapper.deleteById(number); 
	}
	
	@Override
	public AnswerDto getById(int number) {
		return mapper.getById(number);
	}
	
	@Override
	public int modify(AnswerDto answer) {
		return mapper.update(answer);
	}
	
	
}
