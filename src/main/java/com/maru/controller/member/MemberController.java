package com.maru.controller.member;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.maru.domain.member.MemberDto;
import com.maru.service.member.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("signup")
	public void signup() {
		
	}
	
	@PostMapping("signup")
	public String signup(MemberDto member, RedirectAttributes rttr) {
		int cnt = service.insert(member);
		
		rttr.addFlashAttribute("message", "회원가입이 완료 되었습니다.");
		return "redirect:/main/list";
	}
	
	@GetMapping("login")
	public void login() {
		
	}
	
	@GetMapping({"info", "modify"})
	@PreAuthorize("hasAuthority('admin') or (authentication.name == #userId)")
	public void info(String userId, Model model) {
		model.addAttribute("member", service.getById(userId));
	}
	
	@PostMapping("modify")
	@PreAuthorize("authentication.name == #member.userId")
	public String modify(MemberDto member, String oldPassword, RedirectAttributes rttr) {
		MemberDto oldmember = service.getById(member.getUserId());
		rttr.addAttribute("userId", member.getUserId()); // 아이디값 넘길라면 여기서 아이디 받아야함
		
		boolean passwordMatch = passwordEncoder.matches(oldPassword, oldmember.getPassword());
		
		// 기존 암호가 맞으면 회원정보 수정
		if(passwordMatch) {
			int cnt = service.modify(member);
			
			if (cnt == 1) {
				rttr.addFlashAttribute("message", "회원정보가 수정되었습니다.");
				return "redirect:/member/info";
			} else {
				rttr.addFlashAttribute("message", "회원정보가 수정되지 않았습니다");			
				return "redirect:/member/modify";
			} 
		} else {
			rttr.addFlashAttribute("message", "암호가 일치하지 않습니다");			
			return "redirect:/member/modify";
		}
	}
		
	
	@PostMapping("remove")
	public String remove(String userId, String oldPassword, RedirectAttributes rttr, HttpServletRequest req) throws ServletException {
		MemberDto oldmember = service.getById(userId);
		
		boolean passwordMatch = passwordEncoder.matches(oldPassword, oldmember.getPassword());
		
		if(passwordMatch) {
			service.remove(userId);
			rttr.addFlashAttribute("message", "회원 탈퇴하였습니다.");
			req.logout();
			return "redirect:/member/login";			
		} else {
			rttr.addAttribute("userId", userId);
			rttr.addFlashAttribute("message", "암호가 일치하지 않습니다.");
			return "redirect:/member/modify";			
		}
		
	}
	
	@GetMapping("existId/{userId}")
	@ResponseBody
	public Map<String, Object> existId(@PathVariable String userId){ //이부분 제대로 알기
		MemberDto member = service.getById(userId);
		Map<String, Object> map = new HashMap<>();
		
		if (member == null) {
			map.put("status", "not exist");
			map.put("message", "사용 가능한 아이디 입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 아이디 입니다.");
		}
		
		return map;
	}

	@PostMapping("existEmail")
	@ResponseBody
	public Map<String, Object> existEmail(@RequestBody Map<String, String> req){ //이부분 제대로 알기
		Map<String, Object> map = new HashMap<>();
		//String a = req.get("email");
		//System.out.println(a);
		MemberDto member = service.getByEmail(req.get("email"));
		
		if (member == null) {
			map.put("status", "not exist");
			map.put("message", "사용 가능한 이메일 입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 이메일 입니다.");
		}
		
		return map;
	}
	
	

	
	
	
}
