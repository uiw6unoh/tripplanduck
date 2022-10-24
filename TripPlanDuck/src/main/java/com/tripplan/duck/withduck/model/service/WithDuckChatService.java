package com.tripplan.duck.withduck.model.service;

import java.util.List;

import com.tripplan.duck.withduck.model.vo.WithDuckChat;
import com.tripplan.duck.withduck.model.vo.WithDuckChatLog;

public interface WithDuckChatService {

	int createChat(int withNo, String chatTitle, String chatMemNick, int withMemNo);

	int joinChat(int withNo, String withTitle, String withWriterNick, int withWriterNo);

	int putLog(String chatContent, String chatMemNickName, int chatMemNo, int chatWithNo);

	List<WithDuckChat> selectloginChatList(int memberNo);

	List<WithDuckChat> selectjoinChatList(int withNo);

	List<WithDuckChatLog> selectChatLogList(int withNo);

	int deleteChatMember(int chatMemNo, int chatWithNo);

}
