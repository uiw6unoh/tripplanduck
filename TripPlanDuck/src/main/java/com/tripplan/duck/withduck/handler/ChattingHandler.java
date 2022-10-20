package com.tripplan.duck.withduck.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.tripplan.duck.withduck.model.vo.WithDuck;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChattingHandler extends TextWebSocketHandler {
private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("#ChattingHandler, afterConnectionEstablished");
		sessionList.add(session);
		log.info(session.getId() + "님이 입장하셨습니다.");
		
	}
	
	
    @Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("#ChattingHandler, handleMessage");
		System.out.println("받은 session 정보 : " + session.getAttributes());
		Map<String, Object> map = session.getAttributes();
		String userId = (String)map.get("memberId");
		System.out.println("map : " + map.get("memberId"));
		for(WebSocketSession s : sessionList) {
			if(session.getId() == s.getId()) {
				continue;
			}
			s.sendMessage(new TextMessage(session.getId() + ":" + message.getPayload() + ":" + session.getAttributes()));
			System.out.println("sessiong.getId(): " + session);
		}
		
		System.out.println("sessionList : " + sessionList);
		
	}
    
    
	
    @Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionClosed");
		sessionList.remove(session);
		/*
		
		log.info(session.getPrincipal().getName() + "님이 퇴장하셨습니다.");
		*/
	}
}
