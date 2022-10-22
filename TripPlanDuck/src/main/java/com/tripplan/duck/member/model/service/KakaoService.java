package com.tripplan.duck.member.model.service;

import org.springframework.stereotype.Service;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class KakaoService {
     public String getReturnAccessToken(String code) {
         String access_token = "";
         String refresh_token = "";
         String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

             //HttpURLConnection 설정 값 셋팅
             conn.setRequestMethod("POST");
             conn.setDoOutput(true);


             // buffer 스트림 객체 값 셋팅 후 요청
             BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
             StringBuilder sb = new StringBuilder();
             sb.append("grant_type=authorization_code");
             sb.append("&client_id=ad8b938ac510d9524c1e65f7aa96de64");  //앱 KEY VALUE
             sb.append("&redirect_uri=http://localhost:9999/duck/member/kakaoLogin"); // 앱 CALLBACK 경로
             sb.append("&code=" + code);
             bw.write(sb.toString());
             bw.flush();

             //  RETURN 값 result 변수에 저장
             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
             String br_line = "";
             String result = "";

             while ((br_line = br.readLine()) != null) {
                 result += br_line;
             }

             JsonParser parser = new JsonParser();
             JsonElement element = parser.parse(result);


             // 토큰 값 저장 및 리턴
             access_token = element.getAsJsonObject().get("access_token").getAsString();
             refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();

             br.close();
             bw.close();
         } catch (IOException e) {
             e.printStackTrace();
         }

         return access_token;
     }

     public Map<String,Object> getUserInfo(String access_token) {
            Map<String,Object> resultMap =new HashMap<>();
            String reqURL = "https://kapi.kakao.com/v2/user/me";
             try {
                 URL url = new URL(reqURL);
                 HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                 conn.setRequestMethod("GET");

                //요청에 필요한 Header에 포함될 내용
                 conn.setRequestProperty("Authorization", "Bearer " + access_token);

                 int responseCode = conn.getResponseCode();
                 System.out.println("responseCode : " + responseCode);

                 BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

                 String br_line = "";
                 String result = "";

                 while ((br_line = br.readLine()) != null) {
                     result += br_line;
                 }
                System.out.println("response:" + result);


                 JsonParser parser = new JsonParser();
                 JsonElement element = parser.parse(result);
                 log.warn("element:: " + element);
                 JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
                 JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
                 log.warn("id:: "+element.getAsJsonObject().get("id").getAsString());
                 String memberSnsId = element.getAsJsonObject().get("id").getAsString();
                 String memberNickname = properties.getAsJsonObject().get("nickname").getAsString();
                 String memberEmail = kakao_account.getAsJsonObject().get("email").getAsString();
                 String memberGender = kakao_account.getAsJsonObject().get("gender").getAsString();
                 String memberAge = kakao_account.getAsJsonObject().get("age_range").getAsString();
                 
                 log.warn("email:: " + memberEmail);
                 resultMap.put("nickname", memberNickname);
                 resultMap.put("id", memberSnsId);
                 resultMap.put("email", memberEmail); 
                 resultMap.put("gender", memberGender); 
                 resultMap.put("age_range", memberAge); 
                 

             } catch (IOException e) {
                 e.printStackTrace();
             }
             return resultMap;
         }
}