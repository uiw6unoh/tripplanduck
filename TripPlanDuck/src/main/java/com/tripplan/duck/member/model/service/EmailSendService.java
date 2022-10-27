package com.tripplan.duck.member.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

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
		
	// 인증번호 난수 설정
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	

	// 비밀번호 찾기
	public String tmpMemberPassword(HttpServletResponse response, Member member, String pw) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		Member signupId = mapper.selectMemberById(member.getMemberId());
		
		// 아이디가 없으면
		if(signupId == null) {

		}
		// 가입에 사용한 이메일이 아니면
		else if(!member.getMemberEmail().equals(signupId.getMemberEmail())) {

		}else {
			// 임시 비밀번호 생성
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
		}
		
		return pw;
	}
	
	public int setTmpMemberPassword(Member member, String pw) {
		int result = 0;
		
		if(pw == null) return result;
		else {
			// 비밀번호 변경
			System.out.println("pw() : " + pw);
			System.out.println("encode() : " + passwordEncoder.encode(pw));
			
			member.setMemberPassword(passwordEncoder.encode(pw));
			result = mapper.updateMemberPassword(member);
			
			return result;
		}
		
	}	
	
	//이메일 보낼 양식!
	//회원가입 이메일 인증 양식
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "[트립플랜덕] 회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"트립플랜덕과 함께해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요." +
			    "<br>" +
			    "본 메일은 발신전용 메일입니다."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	// 임시비밀번호 메일 발송 내용 
	public void findMemberPasswordEmail(HttpServletResponse response, String email, Member member, String pw) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String setFrom = ".com"; 
		String toMail = email;
		String title = "트립플랜덕 임시 비밀번호 입니다."; 
		String content = 
				"트립플랜덕과 함께해주셔서 감사합니다." + 
                "<br><br>" + 
			    member.getMemberId() + "님의 임시 비밀번호는 " + pw + "입니다." + 
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
