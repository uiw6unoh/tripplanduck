package com.tripplan.duck.withduck.model.service;

public interface WithDuckChatService {

	int createChat(int withNo, String chatTitle, String chatMemNick, int withMemNo);

	int joinChat(int withNo, String withTitle, String withWriterNick, int withWriterNo);

}
