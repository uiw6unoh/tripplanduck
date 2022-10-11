package com.tripplan.duck.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.tripplan.duck.member.model.vo.Member;

@Mapper
public interface AdminMapper {
	int selectMemberCount();

	List<Member> selectMemberAll(RowBounds rowBounds);
}
