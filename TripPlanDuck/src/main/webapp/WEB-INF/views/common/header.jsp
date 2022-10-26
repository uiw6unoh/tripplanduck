<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">

<style>
/* font-family - pretendard */
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");

* {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI",
        "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", sans-serif;
}
</style>

<head>
<!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    
  <!-- Bootstrap CSS -->
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
    crossorigin="anonymous"
  />

  <!-- Mainstyle CSS -->
  <link rel="stylesheet" href="${ path }/css/common/style.css" type="text/css" />
  <link rel="stylesheet" href="${ path }/css/common/font-icons.css" type="text/css" />
  <script src="${ path }/js/trip/search.js"></script>
  
  <title>TripPlanDuck</title>
</head>

<body class="stretched">
    <div id="container" class="clearfix">
      <header id="header" class="full-header">
        <div id="header-wrap">
          <div class="container">
            <div class="header-row">
              <div id="logo">
                <a href="${ path }" class="standard-logo" data-dark-logo="images/logo-dark.png"
                  ><img src="${ path }/resources/images/common/logo.png" 
                /></a>
              </div>
              <div class="header-misc">
                <div id="top-search" class="header-misc-icon">
                  <a href="#" id="top-search-trigger"
                    ><i class="icon-line-search"></i><i class="icon-line-cross"></i
                  ></a>
                </div>
              </div>

              <div id="primary-menu-trigger">
                <svg class="svg-trigger" viewBox="0 0 100 100">
                  <path
                    d="m 30,33 h 40 c 3.722839,0 7.5,3.126468 7.5,8.578427 0,5.451959 -2.727029,8.421573 -7.5,8.421573 h -20"
                  ></path>
                  <path d="m 30,50 h 40"></path>
                  <path
                    d="m 70,67 h -40 c 0,0 -7.5,-0.802118 -7.5,-8.365747 0,-7.563629 7.5,-8.634253 7.5,-8.634253 h 20"
                  ></path>
                </svg>
              </div>

              <!-- Primary Navigation -->
              <nav class="primary-menu">
                <ul class="menu-container" style="font-size: 15px">
                  <li class="menu-item">
                    <a class="menu-link" href="${ path }"><div>Home</div></a>
                  </li>
                  <li class="menu-item">
                    <a class="menu-link" href="${ path }/planner/myplanner"><div>플래너</div></a>
                  </li>
                  <li class="menu-item">
                    <a class="menu-link" href="${path}/trip/main""><div>여행지</div></a>
                  </li>
                  <li class="menu-item">
                    <a class="menu-link" href="${path}/withduck/list"><div>위드덕</div></a>
                  </li>
                </ul>
              </nav>

              <nav class="primary-menu">
                <ul class="menu-container p-0">
                <c:if test="${ empty loginMember }">
                  <li class="menu-item">
                    <a class="menu-link" href="${path}/member/login"><div>로그인</div></a>
                  </li>
                </c:if>
                <c:if test="${ !empty loginMember }">
                	<div class="dropdown">
					  <button class="btn btn-warning btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">
					    ${ loginMember.memberNickname }
					  </button>
					  <ul class="dropdown-menu">
					  	<c:choose>
					  	<c:when test="${ loginMember.memberId == 'admin' }">
					  		<li><a class="dropdown-item" href="${path}/admin/member">관리자페이지</a></li>
					  	</c:when>
					  	
					  	<c:otherwise>
					    <li><a class="dropdown-item" href="${path}/mypage?select=planner">마이페이지</a></li>
					  	</c:otherwise>
					  	
					  	</c:choose>
					  	
					    <li><a class="dropdown-item" id="chatGo" onclick="location.replace('${ path }/chatgoDropDown')">내 위드덕</a></li>
					    <li><a class="dropdown-item" id="logout" onclick="location.replace('${ path }/logout')">로그아웃</a></li>

					  </ul>
					</div>
                </c:if>
                <c:if test="${ empty loginMember }">
                  <li class="menu-item">
                    <a class="menu-link" href="${path}/member/signup"><div>회원가입</div></a>
                  </li>
                </c:if>
                </ul>
              </nav>
              <!-- #primary-menu end -->

              <form class="top-search-form" name="headerForm" action="search" method="get" onsubmit="return validate();">
                <input
                  type="text"
                  id="searchBtn"
                  name="keyword"
                  class="form-control"
                  value=""
                  placeholder="도시, 키워드로 검색"
                  autocomplete="off"
                />
              </form>
            </div>
          </div>
        </div>
        <div class="header-wrap-clone"></div>
      </header>
      <!-- #header end -->
    </div>
    <!-- #wrapper end -->
    
    <!--jQuery-->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>  
  
  <script>
  function validate() {
	    var searchBtn = document.getElementById('searchBtn').value;
	    var isFormValid = (searchBtn != '');

	    return isFormValid;
	}  
  </script>
  </body>
</html>