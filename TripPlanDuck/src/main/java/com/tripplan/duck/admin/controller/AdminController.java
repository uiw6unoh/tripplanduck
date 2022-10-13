package com.tripplan.duck.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
    @GetMapping("/admin/visitor")
    public void visitor() {
		log.info("방문자 관리 페이지"); 
    }
    
    @GetMapping("/admin/withDuck")
    public void withDuck() {
    	log.info("위드덕 관리 페이지");
    }
    
    @GetMapping("/admin/review")
    public void review() {
    	log.info("리뷰 관리 페이지");
    }
    
    @GetMapping("/admin/member")
    public ModelAndView member(ModelAndView model,
    		@RequestParam(value="page", defaultValue = "1") int page) {
    	
    	List<Member> list = null;
    	PageInfo pageInfo = null;
    	
    	pageInfo = new PageInfo(page, 10, service.getMemberCount(), 10);
    	list = service.getMemberList(pageInfo);
    	
    	System.out.println(pageInfo);
    	System.out.println(list);
    	
    	model.addObject("list", list);
    	model.addObject("pageInfo", pageInfo);
    	model.setViewName("admin/member");
    	return model;
    }
    
    @GetMapping("/admin/chat")
    public void chat() {
    	log.info("채팅 관리 페이지");
    }
    
}
