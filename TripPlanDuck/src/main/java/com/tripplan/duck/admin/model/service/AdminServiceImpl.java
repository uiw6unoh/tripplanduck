package com.tripplan.duck.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripplan.duck.admin.model.mapper.AdminMapper;
import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.report.model.vo.Report;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.Destination;
import com.tripplan.duck.withduck.model.vo.WithDuck;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;

	@Override
	public int getMemberCount() {
		
		return mapper.selectCount();
	}

	@Override
	public List<Member> getMemberList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAll(rowBounds);
	}

	@Override
	public int getReviewCount() {
		
		
		return mapper.reviewCount();
	}

	@Override
	public List<Comments> getReviewList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectReviewAll(rowBounds);
	}

	@Override
	public List<Comments> getReviewLatestList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectReviewLatest(rowBounds);
	}

	@Override
	public List<Comments> getReviewOldList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectReviewOld(rowBounds);
	}

	@Override
	public int getWithDuckCount() {
		
		return mapper.selectWithDuckCount();
	}

	@Override
	public List<Comments> getWithDuckList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.withDuckSelectAll(rowBounds);
	}

	@Override
	public List<Comments> getWithDuckLatestList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.withDuckSelectLatest(rowBounds);
	}

	@Override
	public List<Comments> getWithDuckOldList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.withDuckSelectOld(rowBounds);
	}

	@Override
	public Member findMemberByNo(int memberNo) {

		return mapper.memberFindNo(memberNo);
	}

	@Override
	@Transactional
	public int memberStatusChange(int memberNo) {
		
		int result = 0;
		
		result = mapper.updateMemberStatus(memberNo);
		
		return result;
	}

	@Override
	public WithDuck findWithDuckByNo(int withDuckNo) {

		return mapper.withDuckFindNo(withDuckNo);
	}

	@Override
	@Transactional
	public int withDuckDelte(int withDuckNo) {
		
		int result = 0;
		
		result = mapper.deletewithDuck(withDuckNo);
		
		return result;
	}

	@Override
	public Comments Category(int reviewNo) {
		
		return mapper.Category(reviewNo);
	}

	@Override
	public List<Member> getMemberLatestList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectMemberLatest(rowBounds);
	}

	@Override
	public List<Member> getMemberOldList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectMemberOld(rowBounds);
	}

	@Override
	public List<Member> getMemberReportList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.memberReport(rowBounds);
	}

	@Override
	public List<Report> getMemberReportList1(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.memberReportCount1(rowBounds);
	}

	@Override
	public int getMemberReportList2() {
		
		return mapper.memberReportCount2();
	}

	@Override
	public int getMemberReportList3() {
		
		return mapper.memberReportCount3();
	}

	@Override
	public int getMemberReportList4() {
		
		return mapper.memberReportCount4();
	}

	@Override
	public int getMemberReportList5() {
		
		return mapper.memberReportCount5();
	}












}
