package com.tripplan.duck.withduck.model.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.withduck.model.mapper.WithDuckMapper;
import com.tripplan.duck.withduck.model.vo.WithDuck;

@Service
public class WithDuckServiceImpl implements WithDuckService {

	@Autowired
	private WithDuckMapper mapper;
	
	@Override
	public int getWithDuckCount() {
		
		return mapper.selectWithDuckCount();
	}

	@Override
	public List<WithDuck> getWithDuckList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.withDuckSelectAll(rowBounds);
	}

	@Override
	public List<WithDuck> withDuckFilter(PageInfo pageInfo, 
										 String location_val, 
										 String gender_val, 
										 String age_val, 
										 String start_val, 
										 String end_val,
										 int personnel_val) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.withDuckFilter(rowBounds, location_val, gender_val, age_val, start_val, end_val, personnel_val);
	}

	@Override
	public int getWithDuckFilterCount(String location_val, 
									  String gender_val, 
									  String age_val, 
									  String start_val, 
									  String end_val,
									  int personnel_val) {
		return mapper.selectWithDuckFilterCount(location_val, gender_val, age_val, start_val, end_val, personnel_val);
	}

	@Override
	public List<WithDuck> withDuckReadcountSort(PageInfo pageInfo, String location_val, String gender_val,
			String age_val, String start_val, String end_val, int personnel_val) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		System.out.println("aaaaaaaaaa : " + location_val);
		
		return mapper.withDuckReadcountSort(rowBounds, location_val, gender_val, age_val, start_val, end_val, personnel_val);
	}

	@Override
	public List<WithDuck> getWithDuckListReadCount(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.withDuckSelectReadCount(rowBounds);
	}

	@Override
	public List<WithDuck> getWithDuckListJoinCount(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.withDuckSelectJoinCount(rowBounds);
	}

	@Override
	public int getWithDuckJoinCount() {
		
		return mapper.selectWithDuckJoinCount();
	}

	@Override
	public List<WithDuck> getWithDuckJoinList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.withDuckSelectJoin(rowBounds);
	}

	@Override
	public int getWithDuckJoinValCount(String location_val, String gender_val, String age_val, String start_val,
			String end_val, int personnel_val) {

		return mapper.selectWithDuckJoinValCount(location_val, gender_val, age_val, start_val, end_val, personnel_val);
	}

	@Override
	public List<WithDuck> getWithDuckJoinValList(PageInfo pageInfo, String location_val, String gender_val,
			String age_val, String start_val, String end_val, int personnel_val) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		System.out.println("aaaaaaaaaa : " + location_val);
		
		return mapper.withDuckJoinFilter(rowBounds, location_val, gender_val, age_val, start_val, end_val, personnel_val);
	}

	
	



}
