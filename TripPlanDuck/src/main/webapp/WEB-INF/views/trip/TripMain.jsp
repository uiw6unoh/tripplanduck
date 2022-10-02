<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="../common/header.jsp"/>

<!-- Trip CSS-->
<link rel="stylesheet" type="text/css" href="${ path }/css/trip/Mainstyle.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">

<!--owl carousel CSS-->
<link rel="stylesheet" type="text/css" href="${ path }/owlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${ path }/owlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">

<!-- 내용 시작 -->
<!-- 내용 전체 컨테이너 -->
<div class="container mt-2">
  <div class="row">
      <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
          <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="${ path }/images/trip/건대.jpg" class="d-block w-100 h-auto" alt="...">
            <div class="carousel-caption text-left mt-0">
              <h4 class="">2022 봄 여행지 제안</h4>
              <h1>추천할 장소 적기</h1>
              <h5><a style="color:white;" href="">자세히</a></h5>
            </div>
          </div>
          <div class="carousel-item ">
            <img src="${ path }/images/trip/야경.jpg" class="d-block w-100 h-auto" alt="...">
            <div class="carousel-caption text-left">
              <h4 class="">2022 봄 여행지 제안</h4>
              <h1>추천할 장소 적기</h1>
              <h5><a style="color:white;" href="">자세히</a></h5>
            </div>
          </div>
          <div class="carousel-item">
            <img src="${ path }/images/trip//제주도.jpg" class="d-block w-100 h-auto" alt="...">
            <div class="carousel-caption text-left">
              <h4>2022 봄 여행지 제안</h4>
              <h1>추천할 장소 적기</h1>
              <h5><a style="color:white;" href="">자세히</a></h5>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </button>
    </div>
  </div>

  <div class="justify-content-center">
    <p class="h3 mt-5 mb-0 text-center">인기 여행지</p>
    <p class="lead text-muted text-center small mb-2"  style="font-size: 1rem;">
      POPULAR DESTINATIONS
    </p>

    <div class="owl-carousel owl-theme owl-loaded">
      <div class="owl-stage-outer">
        <div class="owl-stage">
          <div class="owl-item">
            <a href="#" class=""><img src="${ path }/images/trip/jeju.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat">JEJU</h4>
              <h6>대한민국 제주도</h6>
            </div>
          </div>
          <div class="owl-item">
            <a href="#" class=""><img src="${ path }/images/trip/busan.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat">BUSAN</h4>
              <h6>대한민국 부산</h6>
            </div>
          </div>
          <div class="owl-item">
            <a href="#" class=""><img src="${ path }/images/trip/gyeongju.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat">GYEONGJU</h4>
              <h6>대한민국 경주</h6>
            </div>
          </div>
          <div class="owl-item">
            <a href="#" class=""><img src="${ path }/images/trip/gangneung.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat">GANGNEUNG</h4>
              <h6>대한민국 강릉</h6>
            </div>
          </div>
          <div class="owl-item">
            <a href="#" class=""><img src="${ path }/images/trip/namwon.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat">NAMWON</h4>
              <h6>대한민국 남원</h6>
            </div>
          </div>
          <div class="owl-item">
            <a href="#" class=""><img src="${ path }/images/trip/geojetongyeong.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat" font-weight=700;>GEOJETONGYEONG</h4>
              <h6>대한민국 거제통영</h6>
            </div>
          </div>
        </div>
      </div>
    </div>

    <p class="h2 mt-5 font-weight-bold text-center">어디로 여행을 떠나시나요?</p>
    <p class="font-weight-light text-muted text-center mb-1">여행지를 검색해주세요.</p>
    <div class="mx-auto input-group justify-content-center w-50">
          <input name="query" type="text" class="form-control" aria-label="search">
        <button class="btn btn-outline-warning" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="black" class="bi bi-search" viewBox="0 0 16 18">
        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
      </svg></button>
    </div>

    <p class="h3 mt-5 mb-0 text-center">추천 여행지</p>
    <p class="lead text-muted text-center small" style="font-size: 1rem;">
      RECOMMENDED DESTINATIONS
    </p>
    <div class="dropdown d-flex justify-content-end">
      <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        추천순  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
          <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
        </svg>
      </button>
      <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton1" >
        <li><a class="dropdown-item" href="#">최신순</a></li>
        <li><a class="dropdown-item" href="#">인기순</a></li>
        <li><a class="dropdown-item" href="#">추천순</a></li>
      </ul>
    </div>
  
    <div class="row mt-1">
      <div class="col-lg-3 col-md-6">
        <div class="card" style="width: 16rem;">
          <div style="overflow: hidden;">
            <img src="${ path }/images/trip/busan.jpg" style="background-color: #f4f3f1;" width="100%" height="254px">
          </div>
            <div class="card-body">
              <h5 class="card-title mb-1">BUSAN</h5>
              <p class="card-text">대한민국 부산</p>
            </div>
          </div>
        </div>
      <div class="col-lg-3 col-md-6">
        <div class="card" style="width: 16rem;">
          <div style="overflow: hidden;">
            <img src="${ path }/images/trip/jeju.jpg" style="background-color: #f4f3f1;" width="100%" height="254px">
          </div>
            <div class="card-body">
              <h5 class="card-title mb-1">JEJU</h5>
              <p class="card-text">대한민국 제주도</p>
            </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6">
        <div class="card" style="width: 16rem;">
          <div style="overflow: hidden;">
            <img src="" style="background-color: #f4f3f1;" width="100%" height="254px">
          </div>
            <div class="card-body">
              <h5 class="card-title mb-1">Card title</h5>
              <p class="card-text">여행지 이름 적기</p>
            </div>
          </div>
      </div>
      <div class="col-lg-3 col-md-6">
        <div class="card" style="width: 16rem;">
          <div style="overflow: hidden;">
            <img src="" style="background-color: #f4f3f1;" width="100%" height="254px">
          </div>
            <div class="card-body">
              <h5 class="card-title mb-1">Card title</h5>
              <p class="card-text">여행지 이름 적기</p>
            </div>
          </div>
      </div>
    </div>
    <div class="row my-5">
      <div class="col-lg-3 col-md-6">
        <div class="card" style="width: 16rem;">
          <div style="overflow: hidden;">
            <img src="" style="background-color: #f4f3f1;" width="100%" height="254px">
          </div>
            <div class="card-body">
              <h5 class="card-title mb-1">Card title</h5>
              <p class="card-text">여행지 이름 적기</p>
            </div>
          </div>
      </div>
      <div class="col-lg-3 col-md-6">
        <div class="card" style="width: 16rem;">
          <div style="overflow: hidden;">
            <img src="" style="background-color: #f4f3f1;" width="100%" height="254px">
          </div>
            <div class="card-body">
              <h5 class="card-title mb-1">Card title</h5>
              <p class="card-text">여행지 이름 적기</p>
            </div>
          </div>
      </div>
      <div class="col-lg-3 col-md-6">
        <div class="card" style="width: 16rem;">
          <div style="overflow: hidden;">
            <img src="" style="background-color: #f4f3f1;" width="100%" height="254px">
          </div>
            <div class="card-body">
              <h5 class="card-title mb-1">Card title</h5>
              <p class="card-text">여행지 이름 적기</p>
            </div>
          </div>
      </div>
      <div class="col-lg-3 col-md-6">
        <div class="card" style="width: 16rem;">
          <div style="overflow: hidden;">
            <img src="" style="background-color: #f4f3f1;" width="100%" height="254px">
          </div>
            <div class="card-body">
              <h5 class="card-title mb-1">Card title</h5>
              <p class="card-text">여행지 이름 적기</p>
            </div>
          </div>
        </div>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"/>

<!--owl carousel JS -->
<script src="${ path }/owlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
<script src="${ path }/owlCarousel2-2.3.4/src/js/owl.autoplay.js"></script>
<script src="${ path }/owlCarousel2-2.3.4/src/js/owl.navigation.js"></script>

<!-- Trip JS -->
<script src="${ path }/js/trip/Mainstyle.js"></script>