package com.tripplan.duck.planner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.common.util.MultipartFileUtil;
import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.planner.model.mapper.LocationMapper;
import com.tripplan.duck.planner.model.service.CreateService;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.vo.Destination;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/trip")
    public class CreateController {
		@Autowired
		LocationMapper locationMapper; 
		
		@Autowired
		private CreateService service;
		
		@Autowired
		private ResourceLoader resourceLoader;
		
		@GetMapping("/create")
        public ModelAndView createDesti(ModelAndView model, HttpSession session,
        		@RequestParam(name = "locationId" , defaultValue = "1") int locationId){
			
			Member loginMember = (Member)session.getAttribute("loginMember");
			if(loginMember.getMemberNo() != 1 ) {
				model.addObject("msg", "관리자만 접근이 가능합니다.");
				model.addObject("location", "/");
				model.setViewName("member/msg");
			}else {
				List<Location> location = service.locationAll();
				
				Location loca = service.selectLoca(locationId);
				
				model.addObject("loginMember",loginMember);
				model.addObject("location",location);
				model.addObject("loca",loca);
				model.setViewName("trip/TripCreate");
				
			}
			return model;
			
		
        }
		
		
		@PostMapping("/create")
		public ModelAndView createDesti(ModelAndView model, @RequestParam("upfile") MultipartFile upfile, 
									Destination destination,
									HttpServletRequest request
		) {
			
			
			// 1. 파일을 업로드 했는지 확인 후 파일을 저장
			if(upfile != null && !upfile.isEmpty()) {
				// 파일을 저장하는 로직 작성
				String location = null;
				String destImage = null;
				try {
					
					destination.setDestMapX(Double.parseDouble(new String (request.getParameter("destMapX"))));
					destination.setDestMapY(Double.parseDouble(new String (request.getParameter("destMapY"))));
					// 이 경로를 쓰면 db 자체에  / 가 아니라  \ 로 출력되어서 잘 잡아주지 못함
					location = resourceLoader.getResource("resources/images/trip/Destination").getFile().getPath();
					destImage = MultipartFileUtil.save(upfile, location);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
				if(destImage != null) {
					destination.setDestImage("../resources/images/trip/Destination/"+destImage);
				}
			}
			
				service.save(destination);
			
			
				model.addObject("msg", "여행지가 정상적으로 등록되었습니다.");
				model.addObject("location", "/trip/detail?destNo="+destination.getDestNo());
				model.setViewName("member/msg");
			return model;
		}

    }
