package com.tripplan.duck.withduck.model.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.tripplan.duck.withduck.model.vo.WithDuck;

@Mapper
public interface WithDuckMapper {
	int selectWithDuckCount();
	
	List<WithDuck> withDuckSelectAll(RowBounds rowBownds);
	
	List<WithDuck> withDuckReadcountSort(RowBounds rowBownds, @Param("location_val") String location_val, @Param("gender_val") String gender_val, @Param("age_val") String age_val, @Param("start_val") String start_val, @Param("end_val") String end_val, @Param("personnel_val") int personnel_val);

	List<WithDuck> withDuckSelectReadCount(RowBounds rowBounds);
	
	int selectWithDuckJoinValCount(@Param("location_val") String location_val, @Param("gender_val") String gender_val, @Param("age_val") String age_val, @Param("start_val") String start_val, @Param("end_val") String end_val, @Param("personnel_val") int personnel_val, @Param("joinStatus") String joinStatus, @Param("sort_name") String sort_name, @Param("keywordSearch") String keywordSearch );

	List<WithDuck> withDuckJoinFilter(RowBounds rowBounds, @Param("location_val") String location_val, @Param("gender_val") String gender_val, @Param("age_val") String age_val,
			@Param("start_val") String start_val, @Param("end_val") String end_val, @Param("personnel_val") int personnel_val, @Param("joinStatus") String joinStatus, @Param("sort_name") String sort_name, @Param("keywordSearch") String keywordSearch);

	int createWithDuck(WithDuck withDuck);

	WithDuck detailWithDuck(int withNo);

	int updateGoWithDuck(WithDuck withDuck);

	int deleteWithDuck(int withNo);

	int withDuckReadCount(int withNo);

	int countChatMem(@Param("withNo") int withNo, @Param("memberNo") int memberNo);




}