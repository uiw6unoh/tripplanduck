package com.tripplan.duck.withduck.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripplan.duck.withduck.model.mapper.ChatMapper;
import com.tripplan.duck.withduck.model.vo.WithDuck;

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

}
