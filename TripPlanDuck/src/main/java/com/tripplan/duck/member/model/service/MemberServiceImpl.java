package com.tripplan.duck.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
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
	private MemberMapper mapper;

	@Override
	public Member login(String memberId, String memberPassword) {

		Member member = null;
		
//		member = dao.findMemberById(session, memberId);
		
		member = mapper.selectMemberById(memberId);
		
		return member;
	}

}
