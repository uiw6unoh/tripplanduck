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
<title>아이디 찾기 결과</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="${ path }/css/member/findId.css" rel="stylesheet">
</head>
<body>
<main class="container">
    <div>
    
      <div class="title">
        <h3>회원님의 아이디는?</h3>
        <img class="mb-4" src="${ path }/images/member/profile.png" alt="" width="200px">
      </div>
      
      <div>
        <h5>
        	${memberId}
        </h5>
      </div>
      
      <div>
        <button class="form-control" type="button" id="btnLogin" style="background-color: #FFF8C6; color:black; border: 1px solid gold; margin-bottom: 10px;">로그인</button>
      </div>
      
    </div>
 	</main>  
 	
<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<script>

	$(document).ready(function () {
	    $('#btnLogin').click(function (e) {
	       e.preventDefault();
	       location.href = '${path}/member/login';
	    });
	});
    
</script>
</body>
</html>