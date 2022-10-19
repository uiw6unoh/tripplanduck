<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="${ path }/css/member/findId.css" rel="stylesheet">
</head>
<body>
  <main class="container">
    <div>
      <div class="title">
        <h1>아이디 찾기</h1>
        <img class="mb-4" src="${ path }/images/member/profile.png" alt="" width="200px">
      </div>

      <form action="${ path }/member/findMemberId" method="post">
        <div class="findIdEmail">
          <label id="label-text" for="findIdEmail">이메일</label>
          <div>
            <input class="form-control" type="email" id="memberEmail" name="memberEmail" placeholder="" />
          </div>
        </div>

        <p class="small-text">회원가입시 등록하셨던 이메일 주소를 입력해주시면 아이디를 표시합니다.</p>

        <div class="find-btn-box">
          <button class="form-control" type="submit" id="find-btn" style="background-color: #FFF8C6; color:black; border: 1px solid gold; margin-bottom: 10px;">Find</button>
        </div>

        <div class="btns-box">
          <button class="form-control" type="button" id="back-btn" style="background-color: #FFF8C6; color:black; border: 1px solid gold; margin-bottom: 10px;" onclick="history.go(-1);" >뒤로가기</button>
        </div>
      </form>
    </div>
 	</main>  
</body>
</html>