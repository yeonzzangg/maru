package com.maru.controller.program;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("program")
public class ProgramController {
	
	@GetMapping("list")
	public void list() {
		
	}
	
	@GetMapping("reservation_1")
	public void reservation() {
		
	}
	
	
}
