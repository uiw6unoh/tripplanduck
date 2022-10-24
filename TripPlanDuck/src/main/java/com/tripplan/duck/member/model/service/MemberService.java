package com.tripplan.duck.member.model.service;

import java.sql.Date;

import javax.servlet.http.HttpServletResponse;

import com.tripplan.duck.member.model.vo.Member;


public interface MemberService {
	Member findMemberById(String memberId);

	Member login(String memberId, String memberPassword);

	int save(Member member);

	Boolean isCheckID(String memberId);

	Boolean isCheckNickname(String memberNickname);

	Member findMemberByNickname(String memberNickname);

	String findMemberId(HttpServletResponse response, String memberEmail) throws Exception;

	void kakaoJoin(Member member);
	
	Member kakaoLogin(String memberSnsId);
	
	String findUserIdBy2(String memberSnsId);
	
//	Member findByUserId(String memberSnsId);
	
}