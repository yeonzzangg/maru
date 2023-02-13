package com.maru.service.Notice;

import java.util.List;

import com.maru.domain.notice.NoticeDto;
import com.maru.domain.notice.PageInfo;

public interface NoticeService {
	
	// 글작성
	int insert(NoticeDto notice);

	// 공지목록
	List<NoticeDto> listNotice(int page, String type, String keyword, PageInfo pageInfo, String category);


}
