package com.tripplan.duck.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripplan.duck.member.model.mapper.MemberMapper;
import com.tripplan.duck.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
//	@Autowired
//	private MemberDao dao;
	
//	@Autowired
//	private SqlSession session;
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public Member login(String memberId, String memberPassword) {

		Member member = null;
				
		member = mapper.selectMemberById(memberId);
		
		if(member != null && member.getMemberPassword().equals(memberPassword)) {
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
			result = mapper.insertMember(member);
		}
		
		return result;
	}

}