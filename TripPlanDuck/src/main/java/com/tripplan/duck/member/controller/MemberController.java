package com.tripplan.duck.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tripplan.duck.member.model.service.MemberService;
import com.tripplan.duck.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

    // 컨트롤러가 처리할 요청을 정의할 핸들러. (URL, Method 등)
	
    // 요청 시 사용자의 파라미터를 전송받는 방법
//  // 1. HttpServletRequest 객체를 통해서 전송받기 (기존 Servlet 방식)
//  @GetMapping("/login")
//  public String login(HttpServletRequest request) {
//      String userId = request.getParameter("userId");
//      String userPassword = request.getParameter("userPassword");
//
//      log.info("login() - 호출 : {} {}", userId, userPassword);
//
//      return "home";
//  }
	
    
    @GetMapping("/member/login")
    public String loginpage() {
        log.info("로그인 페이지 요청");

        return "member/login"; 
    }

    @GetMapping("/member/signup")
    public String signuppage() {
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
//    @RequestMapping(value = "/login", method = {RequestMethod.POST})
//    @GetMapping("/login")
//    @PostMapping("/login")
//    public String login() {
//
//
//        return "home";
//    }


//

//    @PostMapping("/member/login")
//    public String login(HttpServletRequest request) {
//        String memberId = request.getParameter("memberId");
//        String memberPassword = request.getParameter("memberPassword");
//        log.info("{}, {}", memberId, memberPassword);
//
//        return "/member/login";
//    } 
    
    // 4. @ModelAttribute 어노테이션을 통해서 전송받는 방법
    // 	- 요청 파라미터가 많은 경우 객체 타입으로 파라미터를 넘겨받는 방법
    // 단, 기본생성자와 Setter가 존재해야 한다.
//    @PostMapping("/member/login")
//    public String login(@ModelAttribute Member member) {
//    	
//    	System.out.println(member);
//    	
//    	return "/member/login";
//    }
    
    @Autowired // 빈으로 만들어서 주입
    private MemberService service;
    
    /*
     * 로그인처리
     * 
     */
    
    @PostMapping("/member/login")
    public String login(@RequestParam String memberId, @RequestParam String memberPassword) {
    	
    	log.info("{} {}", memberId, memberPassword);
    	
    	Member member = service.login(memberId, memberPassword);
    	
    	System.out.println(member);
    	
		return "main";
    	
    }
    
}
	

