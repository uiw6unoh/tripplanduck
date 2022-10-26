package com.tripplan.duck.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.report.model.vo.Report;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.Destination;
import com.tripplan.duck.withduck.model.vo.WithDuck;

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

	Member memberFindNo(int memberNo);

	int updateMemberStatus(int memberNo);

	WithDuck withDuckFindNo(int withDuckNo);

	int deletewithDuck(int withDuckNo);

	void deleteComment(int commentsId);

	Comments Category(int reviewNo);

	List<Member> selectMemberLatest(RowBounds rowBounds);

	List<Member> selectMemberOld(RowBounds rowBounds);

	List<Member> memberReport(RowBounds rowBounds);

	List<Report> memberReportCount1(RowBounds rowBounds);

	int memberReportCount2();

	int memberReportCount3();

	int memberReportCount4();

	int memberReportCount5();

	

	

	

	

	

	

	

	


	

	

	

	

	

	

	

	

	

	
}
