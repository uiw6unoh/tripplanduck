package com.tripplan.duck.mypage.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String Mypage(
			HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int offset, 
			@RequestParam(defaultValue = "planner") String select, 
			Model model) throws Exception {
		
		
		//세션에 저장된 멤버 데이터 
		Member member = (Member)session.getAttribute("loginMember");
		model.addAttribute("member", member);
		// 로그인 데이터로 갈아끼우기
		//Member member = new Member(2, "yeoul", "1234", "김여울", "여리", "yeoul940813@gmail.com", 'M', '0', 'Y', 'F', 20); 
		//model.addAttribute("member", member);
		
		System.out.println("logined memger : " + member);
		
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
		
		model.addAttribute("options", myPageService.getOptions());
		
		return "mypage/MypageMain";
	}
	
	
	// 더보기 ajax
	@GetMapping("/ajax")
	@ResponseBody
	public Map<String,Object> mypageByAjax(
			HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int offset, 
			@RequestParam(defaultValue = "planner") String select, 
			@RequestParam(required = false, defaultValue = "1") int locationId , 
			Model model) throws Exception {
		
		//세션에 저장된 멤버 데이터 
		Member member = (Member)session.getAttribute("loginMember");
		model.addAttribute("member", member);
		
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();
			
		int start = 0;
		int end = 0;
		
		if(locationId > 0) {
			 start = (offset-1)*3;
			 end = 3; 
			 
		} else {
			start = (offset == 1) ?  1: ((offset-1)*3);
			end = (offset == 1) ? 2 : 3; 
		}
		
		param.put("offset", start);
		param.put("end", end);
		param.put("locationId", locationId);
		param.put("memberNo", member.getMemberNo());
		
		System.out.println("param : "+ param);
		
		result.put("result", false);
		
		if(select.equals("planner")) {
			List<MyPlanner> myPlannerList = myPageService.selectMyPlannerByMNoNewPaging(param);
			model.addAttribute("myPlannerList", myPlannerList);
			result.put("data", myPlannerList);
			result.put("result", true);
		}else if(select.equals("trip")) {
			List<Destination> tripList = myPageService.selectTripByMNoNewPaging(param);
			model.addAttribute("tripList", tripList);
			result.put("data", tripList);
			result.put("result", true);
		}else if(select.equals("comment")) {
			List<Comments> commentsList = myPageService.selectCommentsByMNoPaging(param);
			model.addAttribute("commentsList", commentsList);
			result.put("data", commentsList);
			result.put("result", true);
		}
		
		System.out.println("result :" + result);
		
		return result;
	}
	
	
	// 좋아요 한 여행지
//	@GetMapping("/liketrip")
//	public String LikeTrip() throws Exception {
//		
//		return "mypage/MyPageLiketrip";
//	}
	
	// 작성한 리뷰
//	@GetMapping("/comment")
//	public String Comment() throws Exception {
//		
//		return "mypage/MyPageComment";
//	}
	
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