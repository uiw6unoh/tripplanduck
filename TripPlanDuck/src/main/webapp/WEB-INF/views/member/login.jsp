<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

  <!-- Custom styles for this template -->
  <link href="${ path }/css/member/login.css" rel="stylesheet">

  <title>로그인</title>
</head>

<body class="text-center">
    <main class="form-signin w-300 m-auto">
  
      <form id="loginForm" name="loginForm" action="${ path }/member/login" method="POST" onsubmit="return loginForm_check();">
        <h1>LOGIN</h1>
        <a href="${ path }">
        <img class="mb-4" src="${ path }/images/common/logo.png" alt="" width="300"></a>
        <p>덕덕이와 함께 만드는 즐거운 국내여행 플래너</p>
        
        <div class="form-floating mb-3">
          <input type="text" class="form-control" id="memberId" name="memberId" placeholder="id">
        </div>
        <div class="form-floating mb-3">
          <input type="password" class="form-control" id="memberPassword" name="memberPassword" placeholder="Password">
        </div>
        <div class="checkbox mb-2">
          <label>
            <input type="checkbox" value="saveId" id="saveId" name="saveId"> 아이디저장
            <input class="auto-login" type="checkbox" value="auto-login" id="autoLogin" name="autoLogin"> 자동로그인
          </label>
        </div>
        <div class="lost-id-password mb-3">
            <button type="button" class="btn-outline-warning btn-sm" id="findId" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">아이디찾기</button>
            <button type="button" class="btn-outline-warning btn-sm" id="findPassword" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">비밀번호찾기</button>
        </div>
        <button class="w-100 btn-outline-warning btn-lg mt-2 mb-3" id="login" name="login" type="submit" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">로그인</button>
        <button class="w-100 btn-outline-warning btn-lg mb-3" id="signup" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">회원가입</button>
      </form> 
      <div class="hr-sect mb-3">OR</div>
      <div class="sns-logo">       
       <!-- 카카오 -->
      	<img src="${ path }/images/member/kakao_login.png" onclick="loginWithKakao()">
      </div>
      </main>
      
 

<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!--SweetAlert2-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- kakao JS -->
<script src = "https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>

	$(document).ready(function () {
		$('#signup').click(function (e) {
			e.preventDefault();
			location.href = '${path}/member/signup';
		});
		
		$('#findId').click(function (e) {
			e.preventDefault();
			location.href = '${path}/member/FindId';
		});
		
		$('#findPassword').click(function (e) {
			e.preventDefault();
			location.href = '${path}/member/FindPassword';
		});
	});
	

	
	// 아이디 저장
	$(function() {
        
        fnInit();
      
	  });
		  
	  function loginForm_check(){
	      saveid();
	  }
	
	 function fnInit(){
	     var cookieid = getCookie("saveId");
	     
	     console.log(cookieid);
	     if(cookieid !=""){
	         $("input:checkbox[id='saveId']").prop("checked", true);
	         $('#memberId').val(cookieid);
	     }
	     
	 }    
	
	 function setCookie(name, value, expiredays) {
	     var todayDate = new Date();
	     todayDate.setTime(todayDate.getTime() + 0);
	     if(todayDate > expiredays){
	         document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
	     }else if(todayDate < expiredays){
	         todayDate.setDate(todayDate.getDate() + expiredays);
	         document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	     }
	     
	     
	     console.log(document.cookie);
	 }
	
	 function getCookie(Name) {
	     var search = Name + "=";
	     console.log("search : " + search);
	     
	     if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
	         offset = document.cookie.indexOf(search);
	         console.log("offset : " + offset);
	         if (offset != -1) { // 쿠키가 존재하면 
	             offset += search.length;
	             // set index of beginning of value
	             end = document.cookie.indexOf(";", offset);
	             console.log("end : " + end);
	             // 쿠키 값의 마지막 위치 인덱스 번호 설정 
	             if (end == -1)
	                 end = document.cookie.length;
	             console.log("end위치  : " + end);
	             
	             return unescape(document.cookie.substring(offset, end));
	         }
	     }
	     return "";
	 }
	
	 function saveid() {
	     var expdate = new Date();
	     if ($("#saveId").is(":checked")){
	         expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일간 아이디 저장
	         setCookie("saveId", $("#memberId").val(), expdate);
	         }else{
	            
	     }
	 }
	 
	 // 카카오 로그인
	 // 3a6f0d7758bc8181d09a8444b40cf873 자바스크립트 키
	 // ad8b938ac510d9524c1e65f7aa96de64 REST API 키
	 
	    $(document).ready(function(){
	        Kakao.init('3a6f0d7758bc8181d09a8444b40cf873');
	        Kakao.isInitialized();
	    });
	
	    function loginWithKakao() {
	        Kakao.Auth.authorize({ 
	        redirectUri: 'http://localhost:9999/duck/member/kakaoLogin' 
	        }); // 등록한 리다이렉트uri 입력
	    }
	 

</script>

</body>
</html>