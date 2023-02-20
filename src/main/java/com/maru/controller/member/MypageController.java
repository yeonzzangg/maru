package com.maru.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maru.domain.member.MemberDto;
import com.maru.service.member.MemberService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("list")
	public void list() {
		
	}
	
}
