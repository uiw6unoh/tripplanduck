package com.tripplan.duck.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.tripplan.duck.member.controller.MemberController;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
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
    public void member() {
    	log.info("회원 정보 관리 페이지");
    }
    
    @GetMapping("/admin/chat")
    public void chat() {
    	log.info("채팅 관리 페이지");
    }
    
}
