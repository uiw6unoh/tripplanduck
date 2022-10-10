package com.tripplan.duck.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripplan.duck.mypage.model.mapper.MyPageMapper;
import com.tripplan.duck.planner.model.vo.MyPlanner;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.Destination;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageMapper mapper;
	
	@Override
	public List<MyPlanner> selectMyPlannerByMNo(Map<String, Object> param) {
		return mapper.selectMyPlannerByMNo(param);
	}

	@Override
	public List<Comments>  selectCommentsByMNo(Map<String, Object> param) {
		return mapper.selectCommentsByMNo(param);
	}

	@Override
	public List<Destination> selectTripByMNo(Map<String, Object> param) {
		return mapper.selectTripByMNo(param);
	}

}
