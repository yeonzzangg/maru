package com.maru.service.Notice;

import java.util.List;

import com.maru.domain.notice.NoticeDto;
import com.maru.domain.notice.PageInfo;

public interface NoticeService {
	
	// 글작성
	int insert(NoticeDto notice);

	// 공지목록
	List<NoticeDto> listNotice(int page, String type, String keyword, PageInfo pageInfo, String category);

	NoticeDto get(int number, String member_userId);
	
	NoticeDto get(int number);

	int update(NoticeDto notice);

	int remove(int number);


}
