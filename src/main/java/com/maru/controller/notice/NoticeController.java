package com.maru.controller.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.maru.domain.notice.NoticeDto;
import com.maru.domain.notice.PageInfo;
import com.maru.service.Notice.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	@GetMapping("insert")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	public String insert(NoticeDto notice) {
		service.insert(notice);
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("list")
	public void list(
			@RequestParam(name = "page", defaultValue = "1") int page, // 페이지
			@RequestParam(name = "t", defaultValue = "all") String type, // 검색범위(카테고리)
			@RequestParam(name = "q", defaultValue = "") String keyword, // 검색어
			@RequestParam(name = "category", defaultValue = "") String category, // 카테고리
			PageInfo pageInfo,
			Model model,
			NoticeDto notice) {
		
		// 목록
		List<NoticeDto> list = service.listNotice(page, type, keyword, pageInfo, category);
		model.addAttribute("noticeList", list);
	}
	
	
	
}
