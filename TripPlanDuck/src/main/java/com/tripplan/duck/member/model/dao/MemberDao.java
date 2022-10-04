package com.tripplan.duck.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.tripplan.duck.member.model.vo.Member;

public interface MemberDao {

	Member findMemberById(SqlSession session, String memberId);

}
