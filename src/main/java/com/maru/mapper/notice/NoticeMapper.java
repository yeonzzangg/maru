package com.maru.mapper.notice;

import java.util.List;

import com.maru.domain.notice.NoticeDto;

public interface NoticeMapper {

	int countAll(String type, String keyword);

	List<NoticeDto> list(int offset, int records, String type, String keyword, String category);

	int insert(NoticeDto notice);

}
