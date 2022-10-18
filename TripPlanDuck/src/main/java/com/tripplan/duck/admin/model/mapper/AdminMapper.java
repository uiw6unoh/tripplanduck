package com.tripplan.duck.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.trip.model.vo.Comments;

@Mapper
public interface AdminMapper {
	int selectCount();
	
	List<Member> selectAll(RowBounds rowBounds);

	int reviewCount();

	List<Comments> selectReviewAll(RowBounds rowBounds);

	List<Comments> selectReviewLatest(RowBounds rowBounds);

	List<Comments> selectReviewOld(RowBounds rowBounds);

	int selectWithDuckCount();

	List<Comments> withDuckSelectAll(RowBounds rowBounds);

	List<Comments> withDuckSelectLatest(RowBounds rowBounds);

	List<Comments> withDuckSelectOld(RowBounds rowBounds);

	

	

	

	

	
}
