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
	//	id			: 세션에 저장되어있던 loginMember의 id값
	// 	password	: 사용자가 입력한 비밀번호 재확인 값 
	@Override
	public boolean confirmPassword(Member pwInputMember) {
		
		Member member = memberMapper.selectMemberById(pwInputMember.getMemberId());
		
		// 매번 랜덤한 솔트값을 가지고 암호화를 하기 때문에 매번 다른 값으로 암호화 된다.
		System.out.println("encode() : " + passwordEncoder.encode(pwInputMember.getMemberPassword())); 
		
		// matches() 메소드를 사용하여 내부적으로 복호화해서 나온 결과값에 솔트값을 뗀 나머지 값과 원문을 비교
		return member != null && passwordEncoder.matches(pwInputMember.getMemberPassword(), member.getMemberPassword());
	}

	@Override
	public int updateMyProfile(Member member) {
		// 패스워드 암호화
		member.setMemberPassword(passwordEncoder.encode(member.getMemberPassword()) );
		return mapper.updateMyProfile(member);
	}

	@Override
	public int memberDropOut(int memberNo) {
		
		return mapper.memberDropOut(memberNo);
	}
	
	

}
