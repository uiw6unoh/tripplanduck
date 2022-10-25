package com.tripplan.duck.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.member.model.service.EmailSendService;
import com.tripplan.duck.member.model.service.KakaoService;
import com.tripplan.duck.member.model.service.MemberService;
import com.tripplan.duck.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
// Model 객체에 loginMember 라는 키값으로 객체가 추가되면 해당 객체를 
// 세션 스코프까지 확장하는 어노테이션이다. 
@SessionAttributes("loginMember")
public class MemberController {

    
    @GetMapping("/member/login")
    public String loginpage(HttpServletRequest request, HttpSession session) {
        log.info("로그인 페이지 요청");
        
        String referer = request.getHeader("Referer");
        
        session.setAttribute("prepage", referer);

        return "member/login"; 
    }
    
    
    @GetMapping("/common/privacy")
    public String privacy() {
        log.info("개인정보수집 페이지 요청");

        return "common/privacy"; 
    }

    @GetMapping("/common/termconditions")
    public String termconditions() {
        log.info("이용약관 페이지 요청");

        return "common/termconditions"; 
    }

    @GetMapping("/member/FindId")
    public String findId() {
        log.info("아이디찾기 페이지 요청");

        return "member/FindId"; 
    }
    
    @GetMapping("/member/FindPassword")
    public String findPassword() {
        log.info("비밀번호찾기 페이지 요청");

        return "member/FindPassword"; 
    }
    
    @Autowired // 빈으로 만들어서 주입
    private MemberService service;

    @Autowired
    private KakaoService kakaoService;
    
 
    /*
     * 로그인 처리
     *  SessionAttributes과 ModelAndView 객체 사용
     *  1) @SessionAttributes("키값")
     *  	- Model 객체에서 "키값"에 해당하는 Attribute를 Session Scope 까지 범위를 확장시키는 어노테이션이다.
     *  	- 기존 방법으로 Session을 정리할 수 없고 SessionStatus 객체를 통해서 세션 스코프까지 범위가 확장된 데이터를 정리해야 한다.
     *  2) ModelAndView
     *  	- 컨트롤러에서 뷰로 전달할 데이터와 포워딩하려는 뷰에 대한 정보를 담는 객체이다.
     */
    
    @PostMapping("/member/login")
    public ModelAndView login(ModelAndView model,
    	@RequestParam("memberId") String memberId, @RequestParam("memberPassword") String memberPassword) {
    	
    	log.info("{}, {}", memberId, memberPassword);
    	
    	Member loginMember = service.login(memberId, memberPassword);

    	if(loginMember != null) {
    		model.addObject("loginMember", loginMember);
    		model.setViewName("redirect:/");
    		
    	} else {
    		model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
    		model.addObject("location", "/member/login");
    		model.setViewName("member/msg");
    	}
    	
    	
    	return model;
    }
    
  
	/* 로그아웃 처리
	 * SessionStatus 객체 사용
	 *  세션에 담는게 아니라 모델 스코프를 세션 스코프로 확장하는 것이기 때문에 기존 방식으로는 세션이 삭제되지 않아서
	 *  SesisonStatus를 사용하여 로그아웃을 구현해야함.
	 */
    
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete(); // 세션 스코프로 확장된 객체들을 지워준다.
		
		return "redirect:/";
	}
	
    @GetMapping("/member/signup")
    public String signuppage() {
        log.info("회원가입 페이지 요청");

        return "member/signup"; 
    }
    
    @PostMapping("/member/signup")
    public ModelAndView signup(ModelAndView model, @ModelAttribute Member member) {
    	log.info(member.toString());
    	
    	int result = 0;
    	
    	result = service.save(member);
    	
    	if(result > 0) {
    		model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
    		model.addObject("location", "/");
    	} else {
    		model.addObject("msg", "회원가입을 실패하였습니다.");
    		model.addObject("location", "/member/signup");
    	}
    	
    	model.setViewName("member/msg");
    	
    	return model;
    }
    
	@GetMapping("/jsonTest")
	@ResponseBody
	public Object jsonTest() {
		Map<String, Object> map	= new HashMap<>();
		
		map.put("test1", null);
		map.put("test2", "hi");
		map.put("test3", 10);
		map.put("test4", false);

		
		return map;
	}
	
	@PostMapping("/member/idCheck")
//	@ResponseBody
	public ResponseEntity<Map<String, Boolean>> idCheck(@RequestParam String memberId) {
		log.info("{}", memberId);
		
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("duplicate", service.isCheckID(memberId));
		
		return new ResponseEntity<Map<String,Boolean>>(map, HttpStatus.OK);
	}
	
	
	@PostMapping("/member/nicknameCheck")
	public ResponseEntity<Map<String, Boolean>> nicknameCheck(@RequestParam String memberNickname) {
		log.info("{}", memberNickname);
		
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("duplicate", service.isCheckNickname(memberNickname));
		
		return new ResponseEntity<Map<String,Boolean>>(map, HttpStatus.OK);
	}
	
	
	@Autowired
	private EmailSendService emailService;
	
	// 이메일 인증
	@GetMapping("/member/emailCheck")
	@ResponseBody
	public String emailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어왔어요!");
		System.out.println("이메일 인증 이메일 : " + email);
		
		return emailService.joinEmail(email);
	}
	
	
	// 아이디 찾기
	@RequestMapping(value = "/member/findMemberId", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("memberEmail") String memberEmail, Model model) throws Exception{
		model.addAttribute("memberId", service.findMemberId(response, memberEmail));
		
		return "/member/FindIdResult";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/member/tmpMemberPassword", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> find_pw(Member member, @RequestParam("memberEmail") String email, 
						HttpServletResponse response) throws Exception{
		int result = 0;
		String tmpPw = null;
		Map<String, Object> map = new HashMap<>();
		
		tmpPw = emailService.tmpMemberPassword(response, member, tmpPw);
		result = emailService.setTmpMemberPassword(member, tmpPw);
		emailService.setTmpMemberPassword(member, tmpPw);
		
		if (result > 0) {
			emailService.findMemberPasswordEmail(response, email, member, tmpPw);
			map.put("result", result);
		} 
		
		return map;
	}
	
	// 카카오 로그인
    @RequestMapping(value = "/member/kakaoLogin", method = RequestMethod.GET)
    public String redirectkakao(@RequestParam String code, HttpSession session) throws IOException {
        System.out.println("code:: " + code);

        // 접속토큰 get
        String kakaoToken = kakaoService.getReturnAccessToken(code);

        // 접속자 정보 get
        Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
        log.info("result:: " + result);
        String snsId = (String) result.get("id");
        String nickName = (String) result.get("nickname");
        String email = (String) result.get("email");
        String pw = snsId;
        String gender = (String)result.get("gender");
        String age = (String)result.get("age_range");
        
        // 분기
        Member member = new Member();
        
        // 일치하는 snsId 없을 시 회원가입
        System.out.println("snsId : " + service.kakaoLogin(snsId));
        if (service.kakaoLogin(snsId) == null) {
            log.warn("카카오로 회원가입");
            member.setMemberId(email);
            member.setMemberEmail(email);
            member.setMemberPassword(pw);
            member.setMemberNickname(nickName);
            member.setMemberSnsId(snsId);
            member.setMemberEmail(email);
            member.setMemberGender(gender);
            member.setMemberAge(age);
            service.kakaoJoin(member);

            session.setAttribute("loginMember", member);
        } else {
        	// 일치하는 snsId가 있으면 멤버객체에 담음.
            log.warn("카카오로 로그인");
            String MemberId = service.findUserIdBy2(snsId);
            Member vo = service.findMemberById(MemberId);
            log.warn("member:: " + vo);
            session.setAttribute("loginMember", vo);
          
            System.out.println(vo);
        }
        
        /* 로그아웃 처리 시, 사용할 토큰 값 */
        session.setAttribute("kakaoToken", kakaoToken);

         return "redirect:/";
    }
    

}




    
	
