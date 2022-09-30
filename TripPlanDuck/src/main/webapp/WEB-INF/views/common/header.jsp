<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">

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
  
  <title>TripPlanDuck</title>
</head>

<body class="stretched">
    <div id="container" class="clearfix">
      <header id="header" class="full-header">
        <div id="header-wrap">
          <div class="container">
            <div class="header-row">
              <div id="logo">
                <a href="index.html" class="standard-logo" data-dark-logo="images/logo-dark.png"
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
                    <a class="menu-link" href="#"><div>Home</div></a>
                  </li>
                  <li class="menu-item">
                    <a class="menu-link" href="${ path }/planner/myplanner"><div>플래너</div></a>
                  </li>
                  <li class="menu-item">
                    <a class="menu-link" href="#"><div>여행지</div></a>
                  </li>
                  <li class="menu-item">
                    <a class="menu-link" href="#"><div>위드덕</div></a>
                  </li>
                </ul>
              </nav>

              <nav class="primary-menu">
                <ul class="menu-container p-0">
                  <li class="menu-item">
                    <a class="menu-link" href="#"><div>로그인</div></a>
                  </li>
                  <li class="menu-item">
                    <a class="menu-link" href="#"><div>회원가입</div></a>
                  </li>
                </ul>
              </nav>
              <!-- #primary-menu end -->

              <form class="top-search-form" action="search.html" method="get">
                <input
                  type="text"
                  name="q"
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
  </body>
</html>