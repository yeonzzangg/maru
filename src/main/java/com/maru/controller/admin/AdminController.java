package com.maru.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.maru.domain.book.BookDto;
import com.maru.domain.member.MemberDto;
import com.maru.domain.notice.PageInfo;
import com.maru.domain.qna.QnaDto;
import com.maru.service.admin.AdminService;
import com.maru.service.book.BookService;
import com.maru.service.member.MemberService;
import com.maru.service.qna.QnaService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService service;

	@Autowired
	private MemberService memberService;

	@Autowired
	private QnaService qnaService;

	@Autowired
	private BookService bookService;

	
	// 회원목록
	@GetMapping("memberList")
	public void memberList(
			@RequestParam(name = "page", defaultValue = "1") int page, // 페이지
			@RequestParam(name = "t", defaultValue = "all") String type, // 검색범위(카테고리)
			@RequestParam(name = "q", defaultValue = "") String keyword, // 검색어
			PageInfo pageInfo,
			Model model,
			MemberDto member) {
		
		List<MemberDto> list = memberService.listMember(page, type, keyword, pageInfo);
		model.addAttribute("memberList", list);
	} 
	
	// qna 목록
	@GetMapping("qnaList")
	public void qnaList(
			@RequestParam(name = "page", defaultValue = "1") int page, // 페이지
			@RequestParam(name = "t", defaultValue = "all") String type, // 검색범위(카테고리)
			@RequestParam(name = "q", defaultValue = "") String keyword, // 검색어
			PageInfo pageInfo,
			Model model,
			QnaDto qna) {
		
		List<QnaDto> list = qnaService.listQna(page, type, keyword, pageInfo);
		model.addAttribute("qnaList", list); 
	}

	// 예매 목록
	@GetMapping("bookList")
	public void bookList(
			@RequestParam(name = "page", defaultValue = "1") int page, // 페이지
			@RequestParam(name = "t", defaultValue = "all") String type, // 검색범위(카테고리)
			@RequestParam(name = "q", defaultValue = "") String keyword, // 검색어
			PageInfo pageInfo,
			Model model,
			BookDto book) {
		
		List<BookDto> list = bookService.listBook(page, type, keyword, pageInfo);
		model.addAttribute("bookList", list); 
	}
	
}
