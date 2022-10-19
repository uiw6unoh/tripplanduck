package com.tripplan.duck.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripplan.duck.mypage.model.mapper.MyPageMapper;
import com.tripplan.duck.planner.model.vo.Location;
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
	
	@Override
	public List<MyPlanner> selectMyPlannerByMNoNewPaging(Map<String, Object> param) {
//		int offset = Integer.parseInt(param.get("offset").toString());
		return mapper.selectMyPlannerByMNoNewPaging(param);
	}

	@Override
	public List<Destination> selectTripByMNoNewPaging(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return mapper.selectTripByMNoNewPaging(param);
	}

	@Override
	public List<Comments> selectCommentsByMNoPaging(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return mapper.selectCommentsByMNoPaging(param);
	}

	@Override
	public List<Location> getOptions() {
		// TODO Auto-generated method stub
		return mapper.getOptions();
	}

	@Override
	public void unLikeTrip(Map<String, Object> param) {
		mapper.deleteLikeTrip(param);
		
	}

	@Override
	public void deleteReview(Map<String, Object> param) {
		mapper.deleteReview(param);
	}

	@Override
	public void deletePlan(Map<String, Object> map) {
		mapper.deletePlan(map);
	}


}
