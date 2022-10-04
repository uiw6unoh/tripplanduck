package com.tripplan.duck.member.model.service;

import com.tripplan.duck.member.model.vo.Member;

public interface MemberService {

	Member login(String memberId, String memberPassword);

}
