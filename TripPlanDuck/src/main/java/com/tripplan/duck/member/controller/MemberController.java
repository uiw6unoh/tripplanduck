package com.tripplan.duck.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripplan.duck.member.model.service.MemberService;
import com.tripplan.duck.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

    
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


    
    
    @Autowired // 빈으로 만들어서 주입
    private MemberService service;
    
    /*
     * 로그인처리
     * 
     * 1. HttpSession과 Model객체를 사용
     * 	- Model 객체는 컨트롤러에서 데이터를 뷰로 전달하고자 할 때 사용하는 객체이다.
     * 	- 전달하고자 하는 데이터를 맵 형식(key, value)으로 담을 수 있다.
     * 	- Model 객체의 scope는 Request Scope 이다.
     * 
     */
    
    @PostMapping("/member/login")
    public String login(HttpSession session, Model model,
    		@RequestParam String memberId, @RequestParam String memberPassword) {
    	
    	log.info("{} {}", memberId, memberPassword);
    	
    	Member loginMember = service.login(memberId, memberPassword);
    	
    	if(loginMember != null) {
    		session.setAttribute("loginMember", loginMember);
    		
    		// redirect 방식으로 여기서 리턴 한 경로로 브라우저에서 다시 요청 하도록 반환한다.
    		return "redirect:/";
    	} else {
    		model.addAttribute("msg", "아이디나 패스워드가 일치하지 않습니다.");
    		model.addAttribute("location", "/member/login");
    		
    		return "member/msg";
    	}
    	
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	
    	session.invalidate();
    	
    	return "redirect:/";
    }
    
//    /* 비동기 로그아웃 메서드*/
//    @RequestMapping(value="logout.do", method=RequestMethod.POST)
//    @ResponseBody
//    public void logoutPOST(HttpServletRequest request) throws Exception{
//    	
//    	log.info("비동기 로그아웃 메서드 진입");
//    	
//    	HttpSession session = request.getSession();
//    	
//    	session.invalidate();
//    }
    
}
	

