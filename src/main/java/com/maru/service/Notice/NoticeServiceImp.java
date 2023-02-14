package com.maru.service.Notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.maru.domain.notice.NoticeDto;
import com.maru.domain.notice.PageInfo;
import com.maru.mapper.notice.NoticeMapper;

@Service
@Transactional
public class NoticeServiceImp implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public int insert(NoticeDto notice) {
		return mapper.insert(notice);
	}

	@Override
	public List<NoticeDto> listNotice(int page, String type, String keyword, PageInfo pageInfo, String category) {
		
		int records = 10; // 게시글 갯수
		int offset = (page - 1) * records; // 어디서부터
		
		int countAll = mapper.countAll(type, "%" + keyword + "%"); // 총 게시물 갯수
		int lastPage = (countAll - 1) / records + 1; // 마지막 페이지
		
		// 5페이지씩 보이게
		int leftPageNumber = (page - 1) / 5 * 5 + 1;
		int rightPageNumber = leftPageNumber + 4;
		rightPageNumber = Math.min(rightPageNumber, lastPage);
		
		// 이전 버튼 유무
		boolean hasPrevButton = page > 5;
		// 다음 버튼 유무
		boolean hasNextButton = page <= ((lastPage - 1) / 5 * 5);
		
		// 이전버튼 눌렀을 때 가는 페이지 번호
		int jumpPrevPageNumber = (page - 1) / 5 * 5 - 4;
		// 다음버튼 눌렀을 때 가는 페이지 번호
		int jumpNextPageNumber = (page - 1) / 5 * 5 + 6; 
		
		pageInfo.setHasPrevButton(hasPrevButton);
		pageInfo.setHasNextButton(hasNextButton);
		pageInfo.setJumpPrevPageNumber(jumpPrevPageNumber);
		pageInfo.setJumpNextPageNumber(jumpNextPageNumber);
		pageInfo.setCurrentPageNumber(page);
		pageInfo.setLeftPageNumber(leftPageNumber);
		pageInfo.setRightPageNumber(rightPageNumber);
		pageInfo.setLastPageNumber(lastPage);
		
	
		return mapper.list(offset, records, type,  "%" + keyword + "%", category);
	}
	
	// 게시물 보기
	@Override
	public NoticeDto get(int number, String member_userId) {
		return mapper.select(number, member_userId);
	}
	
	@Override
	public NoticeDto get(int number) {
		return get(number, null);
	}
	
	// 수정
	@Override
	public int update(NoticeDto notice) {
		return mapper.update(notice);
	}
	
	//삭제
	@Override
	public int remove(int number) {
		return mapper.delete(number);
	}
	
}
