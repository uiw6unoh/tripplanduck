package com.tripplan.duck.withduck.model.service;

import java.util.List;

import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.withduck.model.vo.WithDuck;

public interface WithDuckService {

	int getWithDuckCount();

	List<WithDuck> getWithDuckList(PageInfo pageInfo);

	List<WithDuck> withDuckFilter(PageInfo pageInfo, String location_val, String gender_val, String age_val, String start_val, String end_val, int personnel_val);

	int getWithDuckFilterCount(String location_val, String gender_val, String age_val, String start_val, String end_val, int personnel_val);

	List<WithDuck> getWithDuckValJoinCount(PageInfo pageInfo, String location_val, String gender_val, String age_val,
			String start_val, String end_val, int personnel_val);

	List<WithDuck> getWithDuckListReadCount(PageInfo pageInfo);

	List<WithDuck> getWithDuckListJoinCount(PageInfo pageInfo);

	int getWithDuckValJoinCount(String location_val, String gender_val, String age_val, String start_val,
			String end_val, int personnel_val);

}
