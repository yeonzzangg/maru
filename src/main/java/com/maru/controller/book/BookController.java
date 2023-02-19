package com.maru.controller.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@PostMapping("calendar")
	public String calendar1() {
		
		return "redirect:/book/book";
	}
	
	// 예약
	@GetMapping("book")
	public void book(BookDto book, Model model) {
		model.addAttribute("book", book);
	}
	
	@PostMapping("book")
	public String insert(BookDto book) {
		service.insert(book);
		
		return "redirect:/book/bookInfo";
	}
	
	// 예약확인
	@GetMapping("bookInfo")
	public void bookInfo() {
		
	}
	
}
