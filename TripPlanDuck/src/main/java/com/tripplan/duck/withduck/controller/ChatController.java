package com.tripplan.duck.withduck.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.withduck.model.service.WithDuckChatService;
import com.tripplan.duck.withduck.model.vo.WithDuck;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	@Autowired
	private WithDuckChatService service;
	
	@GetMapping("/chatgo")
	public ModelAndView chatGo(ModelAndView model, HttpSession session, @ModelAttribute WithDuck withDuck) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println("withduck : " + withDuck);
		System.out.println("loginMember : " + loginMember);
		int result = 0;
		
		if(loginMember == null) {
			model.addObject("msg", "로그인 후 이용이 가능합니다.");
			model.addObject("location", "/member/login");
			model.setViewName("member/msg");
		} else {
			result = service.joinChat(withDuck.getWithNo(), withDuck.getWithTitle(), loginMember.getMemberNickname(), loginMember.getMemberNo());
			model.addObject("loginMember", loginMember);
			model.addObject("withDuck", withDuck);
			model.setViewName("withduck/WithDuckChat");
		}
		
		return model;
	}

}
