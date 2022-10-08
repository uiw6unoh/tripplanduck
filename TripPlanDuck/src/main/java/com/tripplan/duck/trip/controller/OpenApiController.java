package com.tripplan.duck.trip.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.tripplan.duck.trip.model.service.DestinationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OpenApiController {	
	
	@Autowired
	private static DestinationService destinationService;
	
	public static void main(String[] args) throws IOException {
		   int[] areaCode = {1, 2, 3, 4, 5, 6, 7, 8, 31, 32, 33, 34, 35, 36, 37, 38 ,39};

	        for (int i : areaCode) {
	            StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList");
	            urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=wEh3KeT58fDfUP6Nwnk4nbHqBqTEWa6AKNh44bDB%2BNc%2FSQHN%2BT3a4%2FovMkE1Lza%2BtuV6rNqMAs7ckQnfOjZiJA%3D%3D");
	            urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode("wEh3KeT58fDfUP6Nwnk4nbHqBqTEWa6AKNh44bDB%2BNc%2FSQHN%2BT3a4%2FovMkE1Lza%2BtuV6rNqMAs7ckQnfOjZiJA%3D%3D", "UTF-8"));
	            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("20", "UTF-8"));
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
//	            ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>(); 
//	            
//	            list = mapper.readValue(sb.toString(), new TypeReference<ArrayList<HashMap<String, String>>>() {});        
//	            
//	            System.out.println(list);
	            
	            Map<String, Object> map = mapper.readValue(sb.toString(), new TypeReference<Map<String, Object>>() {
	            });
	            
	            Map<String, Object> response = (Map<String, Object>) map.get("response");
	            Map<String, Object> body = (Map<String, Object>) response.get("body");
	            Map<String, Object> items = (Map<String, Object>) body.get("items");
	            List<Map<String, Object>> list = (ArrayList<Map<String, Object>>) items.get("item");
	            
	            // JSON Parsing
//	            JsonParser parser = new JsonParser();
//	            JsonObject obj = parser.parse(sb.toString()).getAsJsonObject();
//	            
//	            JsonArray arr = obj.get("response")..getAsJsonObject()
//	                    .get("body").getAsJsonObject()
//	                    .get("items").getAsJsonObject()
//	                    .get("item").getAsJsonArray();
	            

	            
	            }
	   }
	
}
