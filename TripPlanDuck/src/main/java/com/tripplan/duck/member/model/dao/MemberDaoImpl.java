package com.tripplan.duck.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripplan.duck.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member findMemberById(SqlSession session, String memberId) {
		
		return session.selectOne("MemberMapper.selectMemberById", memberId);
	}

}
