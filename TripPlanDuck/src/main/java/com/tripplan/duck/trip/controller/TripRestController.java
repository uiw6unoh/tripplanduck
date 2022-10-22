package com.tripplan.duck.trip.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.service.DestinationService;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.DestinationLike;

@RestController
@RequestMapping("/trip/api")
public class TripRestController {
	
	@Autowired
	private DestinationService destinationService;
	
	@GetMapping("/insertData")
	@Transactional(rollbackFor = Exception.class)
	public void insertData() throws Exception {
		
		System.out.println("STARt");
		
		int[] areaCode = {1, 2, 3, 4, 5, 6, 7, 8, 31, 32, 33, 34, 35, 36, 37, 38 ,39};
		
		Map<Integer, String> contents = new HashMap<Integer, String>();
		
		contents.put(12, "관광지");
		contents.put(14, "문화시설");
		contents.put(15, "축제/공연/행사");
		contents.put(25, "여행코스");
		contents.put(28, "레포츠");
		contents.put(32, "숙박");
		contents.put(38, "쇼핑");
		contents.put(39, "음식");

        for (int i : areaCode) {
            StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList");
            urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=wEh3KeT58fDfUP6Nwnk4nbHqBqTEWa6AKNh44bDB%2BNc%2FSQHN%2BT3a4%2FovMkE1Lza%2BtuV6rNqMAs7ckQnfOjZiJA%3D%3D");
            urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode("wEh3KeT58fDfUP6Nwnk4nbHqBqTEWa6AKNh44bDB%2BNc%2FSQHN%2BT3a4%2FovMkE1Lza%2BtuV6rNqMAs7ckQnfOjZiJA%3D%3D", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("30", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("3", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("listYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(i), "UTF-8"));
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            conn.setDoOutput(true); // 출력 가능 상태로 변경
            conn.connect();

            System.out.println("Response code: " + conn.getResponseCode());
            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();
            // System.out.println(sb.toString());
            
            ObjectMapper mapper = new ObjectMapper();
            
            Map<String, Object> map = mapper.readValue(sb.toString(), new TypeReference<Map<String, Object>>() {
            });
            
            Map<String, Object> response = (Map<String, Object>) map.get("response");
            Map<String, Object> body = (Map<String, Object>) response.get("body");
            Map<String, Object> items = (Map<String, Object>) body.get("items");
            List<Map<String, Object>> list = (ArrayList<Map<String, Object>>) items.get("item");
            
//            System.out.println(list.toString());
            
            String category = destinationService.getCateogryName(i);
            
            for(Map<String, Object> param : list) {
            	
            	String contentTypeId = (String) param.get("contenttypeid");
            	String summary = contents.get(Integer.parseInt(contentTypeId));
            	
            	String addr = (String) param.get("addr1");
            	
            	if(StringUtils.isEmpty(addr))
            		param.put("addr1", "주소없음");
            	
            	param.put("category", category);
            	param.put("summary", summary);
            	
            	System.out.println(addr);
            	destinationService.insertData(param);
            	
            }
            
            }
	}
	
	@PostMapping("/like")
	public int updateLike(HttpSession session, DestinationLike destinationLike) throws Exception {
		
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member == null)
			return 0;
		
		destinationLike.setMemberNo(member.getMemberNo());
		
		int like = destinationService.isLike(destinationLike);
		
		if(like == 0) {
			destinationService.insertLike(destinationLike);
			destinationService.updateDestLike(destinationLike);
		}
		
		return 1;
	}
	
	@GetMapping("/main")
	public Map<String, Object> TripMain(@RequestParam(value="sort", required = false)String sort,
								@RequestParam(value="limit", defaultValue = "4")int limit){
		
		String order = "DEST_RATING_AVG"; 
		List<Location> list = new ArrayList<Location>();    
		Map<String, Object> result = new HashMap<String, Object>();
			
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("order", order);
		params.put("limit", limit);
		
		if(sort == null)
			sort = "4";
		
		switch(sort){
			case "1":
				params.put("order", "DEST_LIKE_SUM");
				list = destinationService.getLocations(params);
				break;
			case "2":
				params.put("order", "LOCATION");
				list = destinationService.getLocationsByName(params);
				break;
			case "3":
				params.put("order", "LOCATION DESC");
				list = destinationService.getLocationsByName(params);
				break;
			default:
				list = destinationService.getLocations(params);
				break;
		}
		
		System.out.println("list : " + list);
		
		result.put("list", list);
		
		return result;
	}
	
	@PostMapping("/comment")
	public Comments insertComment(HttpSession session, Comments comments) throws Exception {
		
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member == null)
			throw new Exception("로그인된 사용자가 없습니다.");
		
		comments.setMemberNo(member.getMemberNo());
		comments.setCommentsWriterId(member.getMemberNickname());
		
		destinationService.insertComment(comments);
		destinationService.updateDestRating(comments);
		
		return comments;
	}
	
	@PutMapping("/comment")
	public Comments updateComment(HttpSession session, @RequestBody Comments comments) throws Exception {
		
		System.out.println("update comments : " + comments.toString());
		
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member == null)
			throw new Exception("로그인된 사용자가 없습니다.");
		
		comments.setMemberNo(member.getMemberNo());
		comments.setCommentsWriterId(member.getMemberNickname());
		
		destinationService.updateComment(comments);
		destinationService.updateDestRating(comments);
		
		return comments;
	}

	@DeleteMapping("/comment")
	public int deleteComment(HttpSession session, @RequestParam("commentsId")int commentsId, @RequestParam("destNo")int destNo) throws Exception {
		
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member == null)
			throw new Exception("로그인된 사용자가 없습니다.");
		
		Comments comments = new Comments();
		comments.setDestNo(destNo);
		
		destinationService.deleteComment(commentsId);
		destinationService.updateDestRating(comments);
		
		return 1;
	}
}
