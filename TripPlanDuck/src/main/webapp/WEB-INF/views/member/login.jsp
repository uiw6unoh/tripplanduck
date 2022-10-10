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
  
      <form action="${ path }/member/login" method="POST">
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
            <input type="checkbox" value="remember-id"> 아이디저장
            <input class="auto-login" type="checkbox" value="auto-login"> 자동로그인
          </label>
        </div>
        <div class="lost-id-password mb-3">
            <button type="button" class="btn-outline-warning btn-sm" type="submit" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">아이디찾기</button>
            <button type="button" class="btn-outline-warning btn-sm" type="submit" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">비밀번호찾기</button>
        </div>
        <button class="w-100 btn-outline-warning btn-lg mt-2 mb-3" id="login" type="" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">로그인</button>
        <button class="w-100 btn-outline-warning btn-lg mb-3" id="signup" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">회원가입</button>
      <div class="hr-sect mb-3">OR</div>
      <div class="sns-logo">
        <img src="${ path }/images/member/google_logo.png" style="width: 50px;">
        <img src="${ path }/images/member/kakao_login.png" style="width: 50px; margin-left: 30px;">
        <img src="${ path }/images/member/naver.png" style="width: 50px; margin-left: 30px;">
      </div>
      </form>
      </main>
      
 

<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!--SweetAlert2-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>

	$(document).ready(function () {
		$('#signup').click(function (e) {
			e.preventDefault();
			location.href = '${path}/member/signup';
		});
	});
</script>

</body>
</html>