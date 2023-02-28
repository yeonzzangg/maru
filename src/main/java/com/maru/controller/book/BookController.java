package com.maru.controller.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.maru.domain.book.BookDto;
import com.maru.service.book.BookService;

@Controller
@RequestMapping("book")
public class BookController {
	
	@Autowired
	BookService service;
	
	// 날짜 선택
	@GetMapping("calendar")
	public void calendar() {
		
	}
	
	// 예약
	@GetMapping("book")
	public void book(BookDto book, Model model) {
		model.addAttribute("book", book);
	}
	
	// 예약확인
	@GetMapping("bookInfo")
	public void bookInfo(BookDto book, Model model) {
		model.addAttribute("book", book);
	}
	
	// 예약내역 결제
	@PostMapping("bookInfo")
	public String bookInfo(BookDto book, RedirectAttributes rttr) {
		service.insert(book);
		
		rttr.addFlashAttribute("message", "결제 되었습니다.");
		
		return "redirect:/book/list";
	}
	
	// 예매목록
	@GetMapping("list")
	public void list(BookDto book, Model model, Authentication auth) {
		String member_userId = auth.getName();
		
		List<BookDto> bookList = service.bookList(book, member_userId); 
		model.addAttribute("bookList", bookList);
	}
	
	// 예매취소
	@GetMapping("remove")
	public String remove(int number, RedirectAttributes rttr, String userId, String removeId) {
		service.remove(number);
		rttr.addFlashAttribute("message", "취소 되었습니다.");
		
		if ( userId.equals("admin")) {
			return "redirect:/admin/bookList?t=member_userId&q=" + removeId;
		};
		
		return "redirect:/book/list";
	}
	
	 
	
}
