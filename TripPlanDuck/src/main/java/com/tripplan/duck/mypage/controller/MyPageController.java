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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView Mypage(
			HttpSession session, 
			@RequestParam(required = false, defaultValue = "1") int offset,
			@RequestParam(defaultValue = "") String select, 
			ModelAndView model) throws Exception {

		// 세션에 저장된 멤버 데이터
		Member member = (Member) session.getAttribute("loginMember");
		model.addObject("member", member);

		// 회원만 접근 가능한 페이지 설정
		if (member != null) {
			model.setViewName("mypage/MypageMain");
		} else {
			model.addObject("msg", "권한이 없는 페이지입니다.");
			model.addObject("location", "/");
			model.setViewName("member/msg");

			return model;
		}

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", member.getMemberNo());
		param.put("offset", offset);

		// select가 빈 문자열이라면 모두 조회, 지정하였을 경우에는 그 값을 조회
		// 만약 빈문자열이라면 하단 세개의 분기문이 모두 실행됨
		boolean isEmpty = true;
		if ((!select.equals("trip") && !select.equals("comment"))) {
			// 아무 값도 나오지 않을 경우 .get(index) 메서드를 이용하면 NullPointerExcpetion 발생되므로
			// 데이터가 있을 경우에만 .get(index) 메서드 이용하도록 함
			isEmpty = myPageService.selectMyPlannerByMNo(param).size() == 0;
			MyPlanner myPlanner = !isEmpty ? myPageService.selectMyPlannerByMNo(param).get(0) : null;
			model.addObject("myPlannerFirst", myPlanner);
			// 비어있는지 여부를 체크할 값, jsp에서 select한 페이지의 데이터가 없을때 isEmpty == true
			model.addObject("planIsEmpty", isEmpty);
		}

		if ((!select.equals("planner") && !select.equals("comment"))) {
			isEmpty = myPageService.selectTripByMNo(param).size() == 0;
			Destination trip = !isEmpty ? myPageService.selectTripByMNo(param).get(0) : null;
			model.addObject("tripFirst", trip);
			model.addObject("tripIsEmpty", isEmpty);
		}

		if ((!select.equals("trip") && !select.equals("planner"))) {
			isEmpty = myPageService.selectCommentsByMNo(param).size() == 0;
			Comments comments = !isEmpty ? myPageService.selectCommentsByMNo(param).get(0) : null;
			model.addObject("commentFirst", comments);
			model.addObject("commentIsEmpty", isEmpty);
		}

		// 여행카드의 지역 옵션 리스트
		model.addObject("options", myPageService.getOptions());

		return model;
	}

	// 더보기 ajax
	@GetMapping("/ajax")
	@ResponseBody
	public Map<String, Object> mypageByAjax(
			HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int offset,
			@RequestParam(defaultValue = "planner") String select,
			@RequestParam(required = false, defaultValue = "999") int locationId, Model model) throws Exception {

		// 세션에 저장된 멤버 데이터
		Member member = (Member) session.getAttribute("loginMember");
		model.addAttribute("member", member);

		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();

		int start = 0;
		int end = 0;

		// 여행카드의 경우 옵션 값에 따라 데이터를 바꿔줘야하므로
		// 더보기 처음 눌렀을 경우 세개, 더보기 n번 누를경우 *n 만큼의 데이터 반환
		if (select.equals("trip")) {
			start = 0;
			end = offset * 3;
		} else {
			// 이미 마이페이지에서 보여준 데이터가 있으므로
			// 더보기 처음 클릭시 데이터 두개 반환
			// 그 이후 클릭시 세개씩 반환됨
			start = (offset == 1) ? 1 : ((offset - 1) * 3);
			end = (offset == 1) ? 2 : 3;
		}

		param.put("offset", start);
		param.put("end", end);
		param.put("locationId", locationId); // 지역 옵션 아이디
		param.put("memberNo", member.getMemberNo());

		System.out.println("param : " + param);

		result.put("result", false);

		if (select.equals("planner")) {
			List<MyPlanner> myPlannerList = myPageService.selectMyPlannerByMNoNewPaging(param);
			model.addAttribute("myPlannerList", myPlannerList);
			result.put("data", myPlannerList);
			result.put("result", true);
		} else if (select.equals("trip")) {
			List<Destination> tripList = myPageService.selectTripByMNoNewPaging(param);
			model.addAttribute("tripList", tripList);
			result.put("data", tripList);
			result.put("result", true);
		} else if (select.equals("comment")) {
			List<Comments> commentsList = myPageService.selectCommentsByMNoPaging(param);
			model.addAttribute("commentsList", commentsList);
			result.put("data", commentsList);
			result.put("result", true);
		}

		System.out.println("result :" + result);

		return result;
	}

	// 좋아요 해제
	@GetMapping("/trip/unlike")
	@ResponseBody
	public String unLikeTrip(
			HttpSession session, 
			@RequestParam int no) {

		try {

			Member member = (Member) session.getAttribute("loginMember");
			Map<String, Object> map = new HashMap<>();
			map.put("mno", member.getMemberNo());
			map.put("no", no);
			myPageService.unLikeTrip(map);
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}

		return "success";
	}

	// 리뷰 삭제
	@GetMapping("/review/delete")
	@ResponseBody
	public String deleteReview(
			HttpSession session, 
			@RequestParam int no) {

		try {

			Member member = (Member) session.getAttribute("loginMember");
			Map<String, Object> map = new HashMap<>();
			map.put("mno", member.getMemberNo());
			map.put("no", no);
			myPageService.deleteReview(map);
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}

		return "success";
	}

	// 내 플랜 삭제
	@GetMapping("/plan/delete")
	@ResponseBody
	public String deletePlan(
			HttpSession session, 
			@RequestParam int no) {

		try {

			Member member = (Member) session.getAttribute("loginMember");
			Map<String, Object> map = new HashMap<>();
			map.put("mno", member.getMemberNo());
			map.put("no", no);
			myPageService.deletePlan(map);
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}

		return "success";
	}

	// 마이페이지 - 회원정보수정 전 비밀번호 확인
	@PostMapping("/confirm/password")
	@ResponseBody
	public String confirmPassword(
			HttpSession session, 
			@RequestParam("password") String inputPassword) {

		Member member = (Member) session.getAttribute("loginMember");
		member.setMemberPassword(inputPassword);
		// 검증을 위해 인자를 하나만 받기 위해 멤버 객체로 합쳐보냄
		boolean isCorrect = myPageService.confirmPassword(member);

		if (isCorrect) {
			return "success";
		} else {
			return "failed";
		}
	}

	// 회원 정보 수정
	@GetMapping("/updateform")
	public ModelAndView UpdateForm(
			HttpSession session, 
			ModelAndView model) throws Exception {

		Member loginMember = (Member) session.getAttribute("loginMember");

		if (loginMember != null) {
			model.setViewName("mypage/UpdateForm");
		} else {
			model.addObject("msg", "권한이 없는 페이지입니다.");
			model.addObject("location", "/");
			model.setViewName("member/msg");
		}

		return model;

	}

	// 회원 탈퇴
	@GetMapping("/dropout")
	public ModelAndView DropOut(
			HttpSession session, 
			ModelAndView model) throws Exception {
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		if (loginMember != null) {
			model.setViewName("mypage/DropOut");
		} else {
			model.addObject("msg", "권한이 없는 페이지입니다.");
			model.addObject("location", "/");
			model.setViewName("member/msg");
		}

		return model;
	}

	// 회원 정보 수정
	@PostMapping("/profile")
	public ModelAndView UpdateProfile(
			HttpSession session, 
			@ModelAttribute Member member, 
			ModelAndView model) throws Exception {
		Member loginMember = (Member) session.getAttribute("loginMember");

		member.setMemberId(loginMember.getMemberId());

		int result = myPageService.updateMyProfile(member);

		if (result > 0) {
			model.addObject("msg", "회원정보 수정이 정상적으로 완료되었습니다.");
			model.addObject("location", "/mypage?select=planner");
			
			// 마이페이지에서 snsId값을 업데이트하지 않으므로 세션에 저장되어있던 값 이용 
			member.setMemberSnsId(loginMember.getMemberSnsId());
			// 세션 내 멤버 정보 업데이트
			session.setAttribute("loginMember", member);
			
		} else {
			model.addObject("msg", "회원정보 수정에 실패하였습니다.");
			model.addObject("location", "/member/updateform");
		}

		model.setViewName("member/msg");

		return model;
	}
	
	// 회원 탈퇴
		@PostMapping("/dropout")
		public ModelAndView DropOut(
				ModelAndView model,
				@SessionAttribute("loginMember") Member loginMember) throws Exception {
			
			int result = myPageService.memberDropOut(loginMember.getMemberNo());
			
			if(result > 0) {
				model.addObject("msg", "정상적으로 탈퇴되었습니다.");
				model.addObject("location", "/logout");
			} else {
				model.addObject("msg", "회원 탈퇴에 실패하였습니다.");
				model.addObject("location", "/mypage?select=planner");
			}
			
			model.setViewName("member/msg");
			
			return model;
			
		}
}