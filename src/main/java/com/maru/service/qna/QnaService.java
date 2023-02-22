package com.maru.service.qna;

import java.util.List;

import com.maru.domain.notice.PageInfo;
import com.maru.domain.qna.QnaDto;

public interface QnaService {

	int insert(QnaDto qna);

	List<QnaDto> listQna(int page, String type, String keyword, PageInfo pageInfo);

	List<QnaDto> getUserQnaList(String userId, int page, PageInfo pageInfo);

	QnaDto get(int number, String member_userId);



}
