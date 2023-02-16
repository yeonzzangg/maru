package com.maru.controller.notice;

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

import com.maru.domain.notice.NoticeDto;
import com.maru.domain.notice.PageInfo;
import com.maru.service.Notice.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	@GetMapping("insert")
	@PreAuthorize("hasAuthority('admin')")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	@PreAuthorize("hasAuthority('admin')")
	public String insert(NoticeDto notice) {
		service.insert(notice);
		
		return "redirect:/notice/list";
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
			NoticeDto notice) {
		
		List<NoticeDto> list = service.listNotice(page, type, keyword, pageInfo, category);
		model.addAttribute("noticeList", list);
	}
	
	// 게시글
	@GetMapping("get")
	public void get(int number, Authentication auth, Model model) {
		String member_userId = null;
		 
		if (auth != null) {
			member_userId = auth.getName();
		}
		
		NoticeDto notice = service.get(number, member_userId);
		model.addAttribute("notice", notice);
	}
	
	//수정
	@GetMapping("modify") // @은 외부 빈, #은 메소드의 파라미터
	@PreAuthorize("@noticeSecurity.checkWriter(authentication.name, #number)")
	public void modify(int number, Model model) {
		
		NoticeDto notice = service.get(number);
		model.addAttribute("notice", notice);
	}
	
	@PostMapping("modify")
	@PreAuthorize("@noticeSecurity.checkWriter(authentication.name, #notice.number)")
	public String modify(NoticeDto notice) {
		service.update(notice);
		int num = notice.getNumber();
		
		return "redirect:/notice/get?number=" + num;
	}

	@PostMapping("remove")
	@PreAuthorize("@noticeSecurity.checkWriter(authentication.name, #number)")
	public String remove(int number) {
		service.remove(number);
		
		return "redirect:/notice/list";
	}
	
	
}
