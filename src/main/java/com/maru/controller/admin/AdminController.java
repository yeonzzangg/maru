package com.maru.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maru.service.admin.AdminService;
import com.maru.service.member.MemberService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService service;

	@Autowired
	private MemberService memberService;

	
	// 회원목록
	@GetMapping("memberList")
	@PreAuthorize("hasAuthority('admin')")
	public void memberList(Model model) {
		model.addAttribute("memberList", memberService.memberList());
	} 
	
	
	
}
