package com.tripplan.duck.admin.model.service;

import java.util.List;

import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.report.model.vo.Report;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.Destination;
import com.tripplan.duck.withduck.model.vo.WithDuck;

public interface AdminService {

	int getMemberCount();

	List<Member> getMemberList(PageInfo pageInfo);

	int getReviewCount();

	List<Comments> getReviewList(PageInfo pageInfo);

	List<Comments> getReviewLatestList(PageInfo pageInfo);

	List<Comments> getReviewOldList(PageInfo pageInfo);

	int getWithDuckCount();

	List<Comments> getWithDuckList(PageInfo pageInfo);

	List<Comments> getWithDuckLatestList(PageInfo pageInfo);

	List<Comments> getWithDuckOldList(PageInfo pageInfo);

	Member findMemberByNo(int memberNo);

	int memberStatusChange(int memberNo);

	WithDuck findWithDuckByNo(int withDuckNo);

	int withDuckDelte(int withDuckNo);

	Comments Category(int reviewNo);

	List<Member> getMemberLatestList(PageInfo pageInfo);

	List<Member> getMemberOldList(PageInfo pageInfo);

	List<Member> getMemberReportList(PageInfo pageInfo);

	List<Report> getMemberReportList1(PageInfo pageInfo);

	int getMemberReportList2();

	int getMemberReportList3();

	int getMemberReportList4();

	int getMemberReportList5();

	

	

	



	

	



}
