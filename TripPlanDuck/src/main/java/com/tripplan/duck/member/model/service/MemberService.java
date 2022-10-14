package com.tripplan.duck.member.model.service;

import com.tripplan.duck.member.model.vo.Member;

public interface MemberService {
	Member findMemberById(String memberId);

	Member login(String memberId, String memberPassword);

	int save(Member member);

	Boolean isDuplicateID(String memberId);



}