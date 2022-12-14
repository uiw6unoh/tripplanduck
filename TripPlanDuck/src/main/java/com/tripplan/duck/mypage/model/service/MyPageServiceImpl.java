package com.tripplan.duck.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.tripplan.duck.member.model.mapper.MemberMapper;
import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.mypage.model.mapper.MyPageMapper;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.planner.model.vo.MyPlanner;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.Destination;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public List<MyPlanner> selectMyPlannerByMNo(Map<String, Object> param) {
		
		return mapper.selectMyPlannerByMNo(param);
	}

	@Override
	public List<Comments>  selectCommentsByMNo(Map<String, Object> param) {
		
		return mapper.selectCommentsByMNo(param);
	}

	@Override
	public List<Destination> selectTripByMNo(Map<String, Object> param) {
		
		return mapper.selectTripByMNo(param);
	}
	
	@Override
	public List<MyPlanner> selectMyPlannerByMNoNewPaging(Map<String, Object> param) {
//		int offset = Integer.parseInt(param.get("offset").toString());
		
		return mapper.selectMyPlannerByMNoNewPaging(param);
	}

	@Override
	public List<Destination> selectTripByMNoNewPaging(Map<String, Object> param) {

		return mapper.selectTripByMNoNewPaging(param);
	}

	@Override
	public List<Comments> selectCommentsByMNoPaging(Map<String, Object> param) {
		
		return mapper.selectCommentsByMNoPaging(param);
	}

	@Override
	public List<Location> getOptions() {
		
		return mapper.getOptions();
	}

	@Override
	public void unLikeTrip(Map<String, Object> param) {
		
		mapper.deleteLikeTrip(param);
		
	}

	@Override
	public void deleteReview(Map<String, Object> param) {
		
		mapper.deleteReview(param);
	}

	@Override
	public void deletePlan(Map<String, Object> map) {
		
		mapper.deletePlan(map);
	}

	// parameter Member
	//	id			: ????????? ?????????????????? loginMember??? id???
	// 	password	: ???????????? ????????? ???????????? ????????? ??? 
	@Override
	public boolean confirmPassword(Member pwInputMember) {
		
		Member member = memberMapper.selectMemberById(pwInputMember.getMemberId());
		
		// ?????? ????????? ???????????? ????????? ???????????? ?????? ????????? ?????? ?????? ????????? ????????? ??????.
		System.out.println("encode() : " + passwordEncoder.encode(pwInputMember.getMemberPassword())); 
		
		// matches() ???????????? ???????????? ??????????????? ??????????????? ?????? ???????????? ???????????? ??? ????????? ?????? ????????? ??????
		return member != null && passwordEncoder.matches(pwInputMember.getMemberPassword(), member.getMemberPassword());
	}

	@Override
	public int updateMyProfile(Member member) {
		// ???????????? ?????????
		member.setMemberPassword(passwordEncoder.encode(member.getMemberPassword()) );
		return mapper.updateMyProfile(member);
	}

	@Override
	public int memberDropOut(int memberNo) {
		
		return mapper.memberDropOut(memberNo);
	}
	
	

}
