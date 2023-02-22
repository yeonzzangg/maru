package com.maru.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.maru.domain.book.BookDto;
import com.maru.domain.member.MemberDto;
import com.maru.domain.notice.NoticeDto;
import com.maru.domain.notice.PageInfo;
import com.maru.domain.qna.QnaDto;
import com.maru.domain.review.ReviewDto;
import com.maru.service.member.MemberService;
import com.maru.service.qna.QnaService;
import com.maru.service.review.ReviewService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired QnaService qnaService;
	
	
	@GetMapping("list")
	public void list() {
		
	}
	
	// 내 리뷰 목록
	@GetMapping("reviewList")
	public void reviewList(
			@RequestParam(name = "page", defaultValue = "1") int page, // 페이지
			PageInfo pageInfo,
			Model model,
			String userId) {
		
		List<ReviewDto> list = reviewService.getUserReviewList(userId, page, pageInfo);
		model.addAttribute("reviewList", list); 
	}
	
	// 내 문의 목록
	@GetMapping("qnaList")
	public void qnaList(
			@RequestParam(name = "page", defaultValue = "1") int page, // 페이지
			PageInfo pageInfo,
			Model model,
			String userId) {
		
		List<QnaDto> list = qnaService.getUserQnaList(userId, page, pageInfo);
		model.addAttribute("qnaList", list); 
	}
	
}
