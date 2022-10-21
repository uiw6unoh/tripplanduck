package com.tripplan.duck.withduck.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tripplan.duck.withduck.model.vo.WithDuck;

@Mapper
public interface ChatMapper {

	int createChat(@Param("withNo") int withNo, @Param("chatMemNick") String chatMemNick, @Param("withMemNo") int withMemNo, @Param("chatTitle") String chatTitle);

	int joinChat(@Param("withNo") int withNo, @Param("chatMemNick") String chatMemNick, @Param("withMemNo") int withMemNo, @Param("chatTitle") String chatTitle);

	int putLog(@Param("chatContent") String chatContent,@Param("chatMemNickName") String chatMemNickName, @Param("chatMemNo") int chatMemNo, @Param("chatWithNo") int chatWithNo);


}
