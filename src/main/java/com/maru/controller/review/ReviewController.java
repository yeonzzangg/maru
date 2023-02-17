package com.maru.controller.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.maru.domain.notice.PageInfo;
import com.maru.domain.review.ReviewDto;
import com.maru.service.review.ReviewService;


@Controller
@RequestMapping("review")
public class ReviewController {
	
	@Autowired
	private ReviewService service;

	@GetMapping("insert")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	public String insert(ReviewDto review) {
		service.insert(review);
		
		return "redirect:/review/list";
	}
	
	// 목록
	@GetMapping("list")
	public void list(
			@RequestParam(name = "page", defaultValue = "1") int page, // 페이지
			@RequestParam(name = "t", defaultValue = "all") String type, // 검색범위(카테고리)
			@RequestParam(name = "q", defaultValue = "") String keyword, // 검색어
			@RequestParam(name = "category", defaultValue = "") String category, // 카테고리
			PageInfo pageInfo,
			Model model,
			ReviewDto review) {
		
		List<ReviewDto> list = service.listReview(page, type, keyword, pageInfo, category);
		model.addAttribute("reviewList", list); 
	}
	
	// 게시글
	@GetMapping("get")
	public void get(int number, Authentication auth, Model model) {
		String member_userId = null;
		 
		if (auth != null) {
			member_userId = auth.getName();
		}
		
		ReviewDto review = service.get(number, member_userId);
		model.addAttribute("review", review);
	}
	
	//수정
	@GetMapping("modify") // @은 외부 빈, #은 메소드의 파라미터
	@PreAuthorize("@reviewSecurity.checkWriter(authentication.name, #number)")
	public void modify(int number, Model model) {
		
		ReviewDto review = service.get(number);
		model.addAttribute("review", review);
	}
	
	@PostMapping("modify")
	@PreAuthorize("@reviewSecurity.checkWriter(authentication.name, #review.number)")
	public String modify(ReviewDto review) {
		service.update(review);
		int num = review.getNumber();
		
		return "redirect:/review/get?number=" + num;
	}

	@PostMapping("remove")
	@PreAuthorize("@reviewSecurity.checkWriter(authentication.name, #number)")
	public String remove(int number) {
		service.remove(number);
		
		return "redirect:/review/list";
	}
	
	
}
