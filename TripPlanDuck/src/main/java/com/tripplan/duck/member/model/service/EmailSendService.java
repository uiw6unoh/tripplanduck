package com.tripplan.duck.member.model.service;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.member.model.mapper.MemberMapper;
import com.tripplan.duck.member.model.vo.Member;

@Component
public class EmailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	
	//이메일 보낼 양식!
	//회원가입 이메일 인증
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"트립플랜덕과 함께해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	
//	//비밀번호 찾기 이메일 인증
//	public void findMemberPasswordEmail(HttpServletResponse response, String email, Member member) {
//		String setFrom = ".com"; 
//		String toMail = email;
//		String title = "트립플랜덕 임시 비밀번호 입니다."; 
//		String content = 
//				"트립플랜덕과 함께해주셔서 감사합니다." + 
//                "<br><br>" + 
//			    member.getMemberId() + "님의 임시 비밀번호는 " + authNumber + "입니다." + 
//			    "<br>" + 
//			    "***임시번호를 사용하여 로그인 하신 후 비밀번호를 변경 후 사용해주세요."; //이메일 내용 삽입
//		mailSend(setFrom, toMail, title, content);
//	}

	// 비밀번호 찾기
	public int findMemberPassword(ModelAndView model, HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = 0;
		
		// 아이디가 없으면
		if(mapper.selectMemberById(member.getMemberId()) == null) {
			
		}
		// 가입에 사용한 이메일이 아니면
		else if(!member.getMemberEmail().equals(mapper.selectMemberById(member.getMemberId()).getMemberEmail())) {

		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
				
			// 비밀번호 변경
			member.setMemberPassword(pw);
			result = mapper.updateMemberPassword(member);
		}
		
		}
		
		return result;
	}
	
	
	public void findMemberPasswordEmail(HttpServletResponse response, String email, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String setFrom = ".com"; 
		String toMail = email;
		String title = "트립플랜덕 임시 비밀번호 입니다."; 
		String content = 
				"트립플랜덕과 함께해주셔서 감사합니다." + 
                "<br><br>" + 
			    member.getMemberId() + "님의 임시 비밀번호는 " + member.getMemberPassword() + "입니다." + 
			    "<br>" + 
			    "***임시비밀번호를 사용하여 로그인 하신 후 비밀번호를 변경 후 사용해주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		
	}

	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
}
