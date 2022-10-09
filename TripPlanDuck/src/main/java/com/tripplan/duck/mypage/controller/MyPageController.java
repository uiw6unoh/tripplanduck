package com.tripplan.duck.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	// 좋아요 한 플래너
	@GetMapping("/")
	public String Mypage() throws Exception {
		
		return "mypage/MypageMain";
	}
	
	// 좋아요 한 여행지
	@GetMapping("/liketrip")
	public String LikeTrip() throws Exception {
		
		return "mypage/MyPageLiketrip";
	}
	
	// 작성한 리뷰
	@GetMapping("/comment")
	public String Comment() throws Exception {
		
		return "mypage/MyPageComment";
	}
	
	// 회원 정보 수정
	@GetMapping("/updateform")
	public String UpdateForm() throws Exception {
		
		return "mypage/UpdateForm";
	}
	
	// 회원 탈퇴
	@GetMapping("/dropout")
	public String DropOut() throws Exception {
		
		return "mypage/DropOut";
	}
}
