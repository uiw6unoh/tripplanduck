package com.tripplan.duck.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.tripplan.duck.member.model.mapper.MemberMapper;
import com.tripplan.duck.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
//	@Autowired
//	private MemberDao dao;
	
//	@Autowired
//	private SqlSession session;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public Member findMemberById(String memberId) {
		
		return mapper.selectMemberById(memberId);
	}
	
	@Override
	public Member findMemberByNickname(String memberNickname) {
	
		return mapper.selectMemberByNickname(memberNickname);
	}

	@Override
	public Member login(String memberId, String memberPassword) {

		Member member = null;
				
		member = mapper.selectMemberById(memberId);
		
		// 매번 랜덤한 솔트값을 가지고 암호화를 하기 때문에 매번 다른 값으로 암호화 된다.
		System.out.println("encode() : " + passwordEncoder.encode(memberPassword));
		
		// matches() 메소드를 사용하여 내부적으로 복호화해서 나온 결과값에 솔트값을 뗀 나머지 값과 원문을 비교
		if(member != null && passwordEncoder.matches(memberPassword, member.getMemberPassword())) {
			return member;
		} else {
			return null;
		}
		
	}
		

	@Override
	public int save(Member member) {
		int result = 0;
		
		if(member.getMemberNo() != 0) {
			// update
		} else {
			// insert
			member.setMemberPassword(passwordEncoder.encode(member.getMemberPassword()));
			
			result = mapper.insertMember(member);
		}
		
		return result;
	}


	@Override
	public Boolean isCheckID(String memberId) {
		
		return this.findMemberById(memberId) != null;
	}

	@Override
	public Boolean isCheckNickname(String memberNickname) {
		
		return this.findMemberByNickname(memberNickname) != null;
	}



}