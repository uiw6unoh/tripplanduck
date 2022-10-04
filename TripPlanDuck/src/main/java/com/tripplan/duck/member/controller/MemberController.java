package com.tripplan.duck.member.controller;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	// 컨트롤러가 처리할 요청을 정의할 핸들러. (URL, Method 등)
	@GetMapping("/login")
	public String login(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String userpwd = request.getParameter("userPassword");
		log.info("{}, {}", userId, userpwd);
		
		return "/member/login";
	}
	
	@GetMapping("/member/signup")
	public String signup() {
		log.info("회원가입 페이지 요청");
			
		return "member/signup"; 
	}
	
	@GetMapping("/member/privacy")
	public String privacy() {
		log.info("개인정보수집 페이지 요청");
			
		return "member/privacy"; 
	}
	
	@GetMapping("/member/termconditions")
	public String termconditions() {
		log.info("이용약관 페이지 요청");
			
		return "member/termconditions"; 
	}


	// 컨트롤러가 처리할 요청을 정의한다. (URL, Method 등)
//	@RequestMapping(value = "/login", method = {RequestMethod.POST})
//	@GetMapping("/login")
//	@PostMapping("/login")
//	public String login() {
//		
//		
//		return "home";
//	}	

	// 요청 시 사용자의 파라미터를 전송받는 방법
//	// 1. HttpServletRequest 객체를 통해서 전송받기 (기존 Servlet 방식)
//	@GetMapping("/login")
//	public String login(HttpServletRequest request) {
//		String userId = request.getParameter("userId");
//		String userPassword = request.getParameter("userPassword");
//		
//		log.info("login() - 호출 : {} {}", userId, userPassword);
//		
//		return "home";
//	}
//	

}
