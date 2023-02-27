package com.maru.controller.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.maru.domain.qna.AnswerDto;
import com.maru.service.qna.AnswerService;

@Controller
@RequestMapping("answer")
public class AnswerController {
	
	@Autowired
	private AnswerService service;
	
	
	// 답변 입력
	@PostMapping("add")
	@ResponseBody
	@PreAuthorize("isAuthenticated()") // 로그인 여부
	public Map<String, Object> add(@RequestBody AnswerDto answer, Authentication auth) {
		
		answer.setMember_userId(auth.getName());
		
		Map<String, Object> map = new HashMap<>();
		
		int cnt = service.insert(answer);
		if (cnt == 1) {
			map.put("message", "답변 등록완료");
		}else {
			map.put("message", "답변 등록되지 않음");
		}
		return map;
	}
	
	// 답변 리스트
	@GetMapping("list/{qna_number}")
	@ResponseBody
	public List<AnswerDto> list(@PathVariable int qna_number, Authentication auth) {
		String username = "";
		
		// 로그인 상태면
		if(auth != null) {
			username = auth.getName(); // 로그인한 아이디 얻어오기
		}
		
		return service.listAnswerByBoardId(qna_number, username);
	}
	
	// 답변 삭제
	@DeleteMapping("delete/{number}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable int number) {
		int cnt = service.deleteById(number);
		
		Map<String, Object> map = new HashMap<>();
		if (cnt == 1) {
			map.put("message", "답변 삭제완료");
		} else {
			map.put("message", "답변 삭제되지 않음");
		}
		return map;
	}
	
	// 수정시 답변 가져오기
	@GetMapping("get/{number}")
	@ResponseBody
	public AnswerDto get(@PathVariable int number) {
		return service.getById(number); 
	}

	// 답변 수정
	@PutMapping("modify")
	@ResponseBody
	public Map<String, Object> modify(@RequestBody AnswerDto answer) {
		Map<String, Object> map = new HashMap<>();
		
		int cnt = service.modify(answer);
		 
		if (cnt == 1) {
			map.put("message", "답변 수정완료");
		} else {
			map.put("message", "답변 수정되지 않음");
		}
		
		return map;
	}	
	
	
	
	
}
