package com.maru.mapper.qna;

import java.util.List;

import com.maru.domain.qna.QnaDto;

public interface QnaMapper {

	int insert(QnaDto qna);

	int countAll(String type, String keyword);

	List<QnaDto> list(int offset, int records, String type, String keyword);

	int getUserCountQna(String userId);

	List<QnaDto> getUserQnaList(String userId, int records, int offset);

	List<QnaDto> myQnaList(String member_userId, String userId, int records, int offset);

	QnaDto select(int number, String member_userId);



}
