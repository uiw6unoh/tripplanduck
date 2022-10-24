package com.tripplan.duck.withduck.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.tripplan.duck.withduck.controller.ChatController;
import com.tripplan.duck.withduck.model.service.WithDuckChatService;
import com.tripplan.duck.withduck.model.vo.WithDuck;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChattingHandler extends TextWebSocketHandler {
private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("#ChattingHandler, afterConnectionEstablished");
		
		sessionList.add(session);
		System.out.println(session);
		log.info(session.getId() + "님이 입장하셨습니다.");
		
	}
	
	@Autowired
	private WithDuckChatService service;
	
    @Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("#ChattingHandler, handleMessage");
		System.out.println("받은 session 정보 : " + session.getAttributes());
		System.out.println("입장 샷 : " + message);
		String[] arr = message.getPayload().split(":");
		String chatContent = arr[0];
		String chatMemNickName = arr[1];
		String memNo = arr[2];
		String withNo = arr[3];
		int result = 0;
		int chatMemNo = Integer.parseInt(memNo);
		int chatWithNo = Integer.parseInt(withNo);
		String reload = "location.reload(true)";
		String cur_withDuck = String.valueOf(session.getUri()).replace("ws://211.209.232.21//duck/chatting?withNo=", "");		
	
		service.putLog(chatContent, chatMemNickName, chatMemNo, chatWithNo);
		
		if(chatContent.contains("퇴장하셨습니다.")) {
			result = service.deleteChatMember(chatMemNo, chatWithNo);
		}
		
		System.out.println(Arrays.toString(arr));
		for(WebSocketSession s : sessionList) {
			String every = String.valueOf(s.getUri()).replace("ws://211.209.232.21//duck/chatting?withNo=", "");
			if(session.getId() == s.getId()) {
				continue;
			}
			if(withNo.equals(cur_withDuck)) {
				if (!cur_withDuck.equals(every)) {
					continue;
				}
					s.sendMessage(new TextMessage(chatContent + ":" + chatMemNickName + ":" + memNo + ":" + withNo + ":" + reload ));
					System.out.println(" s : " + s);
			} else {
				if (!withNo.equals(every)) {
					continue;
				}
				s.sendMessage(new TextMessage(chatContent + ":" + chatMemNickName + ":" + memNo + ":" + withNo + ":" + reload ));
				System.out.println(" s : " + s);
				
			}
			
		}
		
		System.out.println("sessionList : " + sessionList);
		
	}
    
	
    @Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionClosed");
		sessionList.remove(session);
		System.out.println(session.getId() +" 퇴장햇네요");
		log.info(session.getId() + "님이 퇴장하셨습니다.");
		
	}
}
