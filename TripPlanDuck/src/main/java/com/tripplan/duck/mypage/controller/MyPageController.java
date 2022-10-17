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
			@RequestParam(defaultValue = "") String select, 
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
		
        // select가 빈 문자열이라면 모두 조회, 지정하였을 경우에는 그 값을 조회    
		// 만약 빈문자열이라면 하단 세개의 분기문이 모두 실행됨
		if((!select.equals("trip") && !select.equals("comment"))) {
			MyPlanner myPlanner = myPageService.selectMyPlannerByMNo(param) != null ? myPageService.selectMyPlannerByMNo(param).get(0) : null;
			model.addAttribute("myPlannerFirst", myPlanner);
		}
		
		if((!select.equals("planner") && !select.equals("comment"))) {
			Destination trip = myPageService.selectTripByMNo(param) != null ? myPageService.selectTripByMNo(param).get(0) : null;
			model.addAttribute("tripFirst", trip);
		}

		if((!select.equals("trip") && !select.equals("planner"))) {
			Comments comments = myPageService.selectCommentsByMNo(param) != null ? myPageService.selectCommentsByMNo(param).get(0) : null;
			model.addAttribute("commentFirst", comments);		
		}

		// 여행카드의 지역 옵션 리스트 
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
		
		// 여행카드의 경우 옵션 값에 따라 데이터를 바꿔줘야하므로 
		// 더보기 처음 눌렀을 경우 세개, 더보기 n번 누를경우 *n 만큼의 데이터 반환
		if(select.equals("trip")) {
			start = 0;
			end = offset * 3; 
		}else {
			// 이미 마이페이지에서 보여준 데이터가 있으므로 
			// 더보기 처음 클릭시 데이터 두개 반환
			// 그 이후 클릭시 세개씩 반환됨
			start = (offset == 1) ?  1 : ((offset-1)*3);
			end = (offset == 1) ? 2 : 3; 
		}
		
		param.put("offset", start);
		param.put("end", end);
		param.put("locationId", locationId); //지역 옵션 아이디 
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