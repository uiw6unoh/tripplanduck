package com.tripplan.duck.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.planner.model.vo.MyPlanner;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.Destination;

public interface MyPageService {

	List<MyPlanner> selectMyPlannerByMNo(Map<String, Object> param);

	List<Comments>  selectCommentsByMNo(Map<String, Object> param);

	List<Destination> selectTripByMNo(Map<String, Object> param);
	
	List<MyPlanner> selectMyPlannerByMNoNewPaging(Map<String, Object> param);

	List<Destination> selectTripByMNoNewPaging(Map<String, Object> param);

	List<Comments> selectCommentsByMNoPaging(Map<String, Object> param);

	List<Location> getOptions();

	void unLikeTrip(Map<String, Object> param);

	void deleteReview(Map<String, Object> param);

	void deletePlan(Map<String, Object> map);

	boolean confirmPassword(Member member);

	int updateMyProfile(Member member);

	int memberDropOut(int memberNo);
}
