package com.tripplan.duck.withduck.model.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.withduck.model.vo.WithDuck;

public interface WithDuckService {

	int getWithDuckCount();

	List<WithDuck> getWithDuckList(PageInfo pageInfo);

	List<WithDuck> withDuckFilter(PageInfo pageInfo, String location_val, String gender_val, String age_val, String start_val, String end_val, int personnel_val);

	int getWithDuckFilterCount(String location_val, String gender_val, String age_val, String start_val, String end_val, int personnel_val);

	List<WithDuck> withDuckReadcountSort(PageInfo pageInfo, String location_val, String gender_val, String age_val,
			String start_val, String end_val, int personnel_val);


}
