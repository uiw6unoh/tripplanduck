package com.tripplan.duck.withduck.model.service;

import java.util.List;

import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.withduck.model.vo.WithDuck;

public interface WithDuckService {

	int getWithDuckCount();

	List<WithDuck> getWithDuckList(PageInfo pageInfo);

	List<WithDuck> withDuckReadcountSort(PageInfo pageInfo, String location_val, String gender_val, String age_val,
			String start_val, String end_val, int personnel_val);

	List<WithDuck> getWithDuckListReadCount(PageInfo pageInfo);

	int getWithDuckJoinValCount(String location_val, String gender_val, String age_val, String start_val,
			String end_val, int personnel_val, String joinStatus, String sort_name, String keywordSearch);

	List<WithDuck> getWithDuckJoinValList(PageInfo pageInfo, String location_val, String gender_val, String age_val,
			String start_val, String end_val, int personnel_val, String joinStatus, String sort_name, String keywordSearch);

	int createWithDuck(WithDuck withDuck);

	WithDuck detailWithDuck(int withNo);

	int updateGoWithDuck(WithDuck withDuck);

	int deleteWithDuck(int withNo);

	int withDuckReadCount(int withNo, boolean hasRead);

	int countChatMem(int withNo, int memberNo);


}