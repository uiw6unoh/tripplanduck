package com.tripplan.duck.withduck.model.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.withduck.model.vo.WithDuck;

public interface WithDuckService {

	int getWithDuckCount();

	List<WithDuck> getWithDuckList(PageInfo pageInfo);

	List<WithDuck> withDuckFilter(PageInfo pageInfo, String location_val, String gender_val, String age_val);

	int getWithDuckFilterCount(String location_val, String gender_val, String age_val);

}
