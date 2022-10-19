package com.tripplan.duck.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tripplan.duck.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member selectMemberById(@Param("memberId") String memberId);

	Member selectMemberByNickname(@Param("memberNickname") String memberNickname);
	
	int insertMember(Member member);
	
	String findMemberId(@Param("memberEmail") String memberEmail);

	int updateMemberPassword(Member member);

}