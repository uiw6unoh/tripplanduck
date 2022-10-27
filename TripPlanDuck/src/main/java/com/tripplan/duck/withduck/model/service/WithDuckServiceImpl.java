package com.tripplan.duck.withduck.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int getWithDuckJoinValCount(String location_val, String gender_val, String age_val, String start_val,
			String end_val, int personnel_val, String joinStatus, String sort_name, String keywordSearch) {

		return mapper.selectWithDuckJoinValCount(location_val, gender_val, age_val, start_val, end_val, personnel_val, joinStatus, sort_name, keywordSearch);
	}

	@Override
	public List<WithDuck> getWithDuckJoinValList(PageInfo pageInfo, String location_val, String gender_val,
			String age_val, String start_val, String end_val, int personnel_val, String joinStatus,  String sort_name, String keywordSearch) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		System.out.println("aaaaaaaaaa : " + location_val);
		
		return mapper.withDuckJoinFilter(rowBounds, location_val, gender_val, age_val, start_val, end_val, personnel_val, joinStatus, sort_name, keywordSearch);
	}

	//////////////////////////////////////////////////////////////위드덕 생성 ///////////////////////////////////////////////////
	
	@Override
	@Transactional
	public int createWithDuck(WithDuck withDuck) {
		int result = 0;
		
		result = mapper.createWithDuck(withDuck);
		
		return result;
	}

	
	//////////////////////////////////////////////////////////////위드덕 상세 페이지 ///////////////////////////////////////////////////

	@Override
	public WithDuck detailWithDuck(int withNo) {
		System.out.println(withNo);

		return mapper.detailWithDuck(withNo);
	}

	@Override
	@Transactional
	public int updateGoWithDuck(WithDuck withDuck) {
		int result = 0;
		
		result = mapper.updateGoWithDuck(withDuck);
		
		return result;
	}

	@Override
	@Transactional
	public int deleteWithDuck(int withNo) {
		int result = 0;
		
		result = mapper.deleteWithDuck(withNo);
		
		return result;
	}

	@Override
	@Transactional
	public int withDuckReadCount(int withNo, boolean hasRead) {
		if(!hasRead) {
			return mapper.withDuckReadCount(withNo);
		} else {
			return 0;
		}
	}

	@Override
	public int countChatMem(int withNo, int memberNo) {
		// TODO Auto-generated method stub
		return mapper.countChatMem(withNo, memberNo);
	}

}