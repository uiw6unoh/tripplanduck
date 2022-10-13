package com.tripplan.duck.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tripplan.duck.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member selectMemberById(@Param("memberId") String memberId);

	int insertMember(Member member);
}
