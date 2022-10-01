package com.tripplan.duck.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	// 컨트롤러가 처리할 요청을 정의할 핸들러. (URL, Method 등)
	@GetMapping("/member/login")
	public String login() {
		log.info("로그인 페이지 요청");
		
		return "member/login"; 
	}
	
	@GetMapping("/member/signup")
	public String signup() {
		log.info("회원가입 페이지 요청");
			
		return "member/signup"; 
	}
}
