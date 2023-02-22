package com.maru.controller.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.maru.domain.notice.PageInfo;
import com.maru.domain.qna.QnaDto;
import com.maru.domain.review.ReviewDto;
import com.maru.service.qna.QnaService;

@Controller
@RequestMapping("qna")
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@GetMapping("insert")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	public String insert(QnaDto qna, Authentication auth) {
		service.insert(qna);
		
		String member_userId = auth.getName();
		
		return "redirect:/mypage/qnaList?userId=" + member_userId;
	}
	
	@GetMapping("list")
	public void list(
			@RequestParam(name = "page", defaultValue = "1") int page, // 페이지
			@RequestParam(name = "t", defaultValue = "all") String type, // 검색범위(카테고리)
			@RequestParam(name = "q", defaultValue = "") String keyword, // 검색어
			PageInfo pageInfo,
			Model model,
			QnaDto qna) {
		
		List<QnaDto> list = service.listQna(page, type, keyword, pageInfo);
		model.addAttribute("qnaList", list); 
	}
	
	// 게시글
	@GetMapping("get")
	public void get(int number, Authentication auth, Model model) {
		String member_userId = null;
		 
		if (auth != null) {
			member_userId = auth.getName();
		}
		
		QnaDto qna = service.get(number, member_userId);
		model.addAttribute("qna", qna);
	}
	
	
	
	
	
}
