package com.tripplan.duck.withduck.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripplan.duck.withduck.model.mapper.ChatMapper;
import com.tripplan.duck.withduck.model.vo.WithDuck;
import com.tripplan.duck.withduck.model.vo.WithDuckChat;
import com.tripplan.duck.withduck.model.vo.WithDuckChatLog;

@Service
public class WithDuckChatServiceImpl implements WithDuckChatService {
	
	@Autowired
	private ChatMapper mapper;
	
	@Override
	@Transactional
	public int createChat(int withNo, String chatTitle, String chatMemNick, int withMemNo) {

		return mapper.createChat(withNo, chatMemNick, withMemNo, chatTitle);
	}

	@Override
	public int joinChat(int withNo, String chatTitle, String chatMemNick, int withMemNo) {

		return mapper.joinChat(withNo, chatMemNick, withMemNo, chatTitle);
	}

	@Override
	public int putLog(String chatContent, String chatMemNickName, int chatMemNo, int chatWithNo) {
		System.out.println(chatContent + "asdfasdfasdfasdf" );
		return mapper.putLog(chatContent, chatMemNickName, chatMemNo, chatWithNo);
	}

	@Override
	public List<WithDuckChat> selectloginChatList(int memberNo) {
		return mapper.selectloginChatList(memberNo);
	}

	@Override
	public List<WithDuckChat> selectjoinChatList(int withNo) {
		// TODO Auto-generated method stub
		return mapper.selectjoinChatList(withNo);
	}

	@Override
	public List<WithDuckChatLog> selectChatLogList(int withNo) {
		// TODO Auto-generated method stub
		return mapper.selectChatLogList(withNo);
	}

	@Override
	public int deleteChatMember(int chatMemNo, int chatWithNo) {
		// TODO Auto-generated method stub
		return mapper.deleteChatMember(chatMemNo, chatWithNo);
		
	}


}
