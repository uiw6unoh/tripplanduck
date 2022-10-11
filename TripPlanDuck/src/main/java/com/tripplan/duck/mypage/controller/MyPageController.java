package com.tripplan.duck.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tripplan.duck.member.model.service.MemberService;
import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.mypage.model.service.MyPageService;
import com.tripplan.duck.planner.model.vo.MyPlanner;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.Destination;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	// 마이페이지 메인
	@GetMapping("")
	public String Mypage(@RequestParam(required = false, defaultValue = "1") int offset, @RequestParam(defaultValue = "planner") String select, Model model) throws Exception {
		
		// 로그인 데이터로 갈아끼우기
		Member member = new Member(2, "yeoul", "1234", "김여울", "여리", "yeoul940813@gmail.com", 'M', '0', 'Y', 'F', 20); 
	
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", member.getMemberNo());
		param.put("offset", offset);
		
		if(select.equals("planner")) {
			List<MyPlanner> myPlannerList = myPageService.selectMyPlannerByMNo(param);
			model.addAttribute("myPlannerList", myPlannerList);
		}else if(select.equals("trip")) {
			List<Destination> tripList = myPageService.selectTripByMNo(param);
			model.addAttribute("tripList", tripList);
		}else if(select.equals("comment")) {
			List<Comments> commentsList = myPageService.selectCommentsByMNo(param);
			model.addAttribute("commentsList", commentsList);		
		}
		model.addAttribute("member", member);
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