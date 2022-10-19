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
              <h4>2022 겨울 여행지 제안</h4>
              <h1>추천할 장소 적기</h1>
              <h5><a style="color:white;" href="">자세히</a></h5>
            </div>
          </div>
          <div class="carousel-item ">
            <img src="${ path }/images/trip/야경.jpg" class="d-block w-100 h-auto" alt="...">
            <div class="carousel-caption text-left">
              <h4>2022 겨울 여행지 제안</h4>
              <h1>추천할 장소 적기</h1>
              <h5><a style="color:white;" href="">자세히</a></h5>
            </div>
          </div>
          <div class="carousel-item">
            <img src="${ path }/images/trip//제주도.jpg" class="d-block w-100 h-auto" alt="...">
            <div class="carousel-caption text-left">
              <h4>2022 겨울 여행지 제안</h4>
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
            <a href="${ path }/trip/list?locationId=39" class=""><img src="${ path }/images/trip/jeju.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat">JEJU</h4>
              <h6>대한민국 제주도</h6>
            </div>
          </div>
          <div class="owl-item">
            <a href="${ path }/trip/list?locationId=6" class=""><img src="${ path }/images/trip/busan.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat">BUSAN</h4>
              <h6>대한민국 부산</h6>
            </div>
          </div>
          <div class="owl-item">
            <a href="${ path }/trip/list?locationId=35" class=""><img src="${ path }/images/trip/gyeongju.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat">GYEONGJU</h4>
              <h6>대한민국 경주</h6>
            </div>
          </div>
          <div class="owl-item">
            <a href="${ path }/trip/list?locationId=32" class=""><img src="${ path }/images/trip/gangneung.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat">GANGNEUNG</h4>
              <h6>대한민국 강릉</h6>
            </div>
          </div>
          <div class="owl-item">
            <a href="${ path }/trip/list?locationId=37" class=""><img src="${ path }/images/trip/namwon.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat">NAMWON</h4>
              <h6>대한민국 남원</h6>
            </div>
          </div>
          <div class="owl-item">
            <a href="${ path }/trip/list?locationId=1" class=""><img src="${ path }/images/trip/seoul.jpg"></a>
            <div class="main-photo-linear"></div>
            <div class="owl-text-overlay m-auto"> 
              <h4 style="font-family: Montserrat" font-weight=700;>SEOUL</h4>
              <h6>대한민국 서울</h6>
            </div>
          </div>
        </div>
      </div>
    </div>

    <p class="h2 mt-5 font-weight-bold text-center">어디로 여행을 떠나시나요?</p>
    <p class="font-weight-light text-muted text-center mb-1">여행지를 검색해주세요.</p>
    <div class="mx-auto input-group justify-content-center w-50">
          <input  type="text"
          		  id="keyword"
                  name="keyword"
                  value=""
                  class="form-control"
                  autocomplete="off">
        <button class="btn btn-outline-warning" type="button" id="searchButton"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="black" class="bi bi-search" viewBox="0 0 16 18">
        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
      </svg></button>
    </div>

    <p class="h3 mt-5 mb-0 text-center">추천 여행지</p>
    <p class="lead text-muted text-center small" style="font-size: 1rem;">
      RECOMMENDED DESTINATIONS
    </p>
    <div class="dropdown d-flex justify-content-end" id="dropdown">
      <c:if test="${ empty sort_name }">
      <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        추천순 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
          <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
        </svg>
      </button>
      </c:if>
      <c:if test="${ not empty sort_name }">
      <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        ${sort_name} <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
          <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
        </svg>
      </button>
      </c:if>

      <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton1" >
		<li>
		  <a
		  	class="dropdown-item"
			onclick="changeSort(1)"
			id="filterSortPopular"
			>인기순</a >
		</li>
		<li>
		  <a
		  	class="dropdown-item"
			onclick="changeSort(0)"
			id="filterSortRecommend"
			>추천순</a >
		</li>
		<li>
		  <a
		  	class="dropdown-item"
			onclick="changeSort(2)"
			id="filterSortClimbingUp"
			>오름차순</a >
		</li>
 		<li>
		  <a
		  	class="dropdown-item"
			onclick="changeSort(3)"
			id="filterSortClimbingDown"
			>내림차순</a >
		</li>
      </ul>
    </div>
  
    <div class="row mt-1" id="mainDiv">
    <c:forEach var="location" items="${list}">
	    <div class="col-lg-3 col-md-6 mb-4">
	    	<a href="${path}/trip/list?locationId=${location.locationId}">
	        <div class="card" style="width: 16rem;">
	          <div class="card-img" style="overflow: hidden;">
	            <img src="${ path }/images/trip/${location.locationImage}" style="background-color: #f4f3f1;" width="100%" height="254px">
	          </div>
	          <div class="card-body">
		         <h5 class="card-title mb-1">${location.locationTitle}</h5>
		         <p class="card-text">${location.location}</p>
	          </div>
	        </div>
	        </a>
	    </div>
    </c:forEach>
    </div>
    
    <div class="row mt-1 skeletonCard" style="display:none;">
	  <div class='col-lg-3 col-md-6 mb-4'>
		<div class="card" style="width: 16rem;">
		  <div class="card-img skeleton" style="overflow: hidden;">
			<img width="100%" height="254px">
		  </div>
		  <div class="card-body">
		    <h5 class="skeleton-title skeleton mb-1"></h5>
		    <p class="skeleton-text skeleton"></p>
		  </div>
	    </div>
	  </div>
	  <div class='col-lg-3 col-md-6 mb-4'>
		<div class="card" style="width: 16rem;">
		  <div class="card-img skeleton" style="overflow: hidden;">
			<img width="100%" height="254px">
		  </div>
		  <div class="card-body">
		    <h5 class="skeleton-title skeleton mb-1"></h5>
		    <p class="skeleton-text skeleton"></p>
		  </div>
	    </div>
	  </div>
	  <div class='col-lg-3 col-md-6 mb-4'>
		<div class="card" style="width: 16rem;">
		  <div class="card-img skeleton" style="overflow: hidden;">
			<img width="100%" height="254px">
		  </div>
		  <div class="card-body">
		    <h5 class="skeleton-title skeleton mb-1"></h5>
		    <p class="skeleton-text skeleton"></p>
		  </div>
	    </div>
	  </div>
	  <div class='col-lg-3 col-md-6 mb-4'>
		<div class="card" style="width: 16rem;">
		  <div class="card-img skeleton" style="overflow: hidden;">
			<img width="100%" height="254px">
		  </div>
		  <div class="card-body">
		    <h5 class="skeleton-title skeleton mb-1"></h5>
		    <p class="skeleton-text skeleton"></p>
		  </div>
	    </div>
	  </div>
	</div>
	
	<div class="w-100" style="display:flex; justify-content: center;">
		<div class="loading">
		  <div class="ldio-76qwp4fy1ic" ><div></div>
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

<!-- sweetalert2 alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>


function changeSort(sort){
	window.location.href = "${path}" + "/trip/main?sort=" + sort;
}

$('[id="searchButton"]').on("click", function () {
	var keyword = document.getElementById("keyword");
	
	if(!keyword.value) {
		Swal.fire({
	        icon: "error",
	        title: `실패!`,
	        text: `검색어를 입력해주세요.`,
	        confirmButtonText: "확인",
	        closeOnClickOutside : false
	      });
	} else {
		window.location.href="${path}/trip/search?keyword=" + keyword.value;
	};
});

var limit = 4;
var datalength = 1;
var isEnd = true;

$(window).scroll(function() {
	if ($(window).scrollTop() == $(document).height() - $(window).height() || $(window).scrollTop() >= $(document).height() - $(window).height() - 5) {
		if (datalength > 0 && isEnd == true) {
			showSkeleton();
			showLoading();
			isEnd = false;
			let sort = getParameter("sort")
			$.ajax({
				url : "${path}/trip/api/main?sort=" + sort + "&limit=" + limit,
				type : "GET",
				success: function(obj) {
					datalength = obj.list.length;
					
					setTimeout(function() {
						if(obj.list.length > 0) {
							obj.list.forEach(function(v,i) {
								
							    $("#mainDiv").append(
							    		"<div class='col-lg-3 col-md-6 mb-4'>" +
							    		"<a href=\'${ path }/trip/list?locationId=" + obj.list[i].locationId + "\'>" +
							    		"<div class='card' style='width: 16rem;'>" +
							    		"<div style='overflow: hidden;'>" +
							    		"<img src=\'${ path }/images/trip/" + obj.list[i].locationImage + "\' style='background-color: #f4f3f1;' width='100%' height='254px'>" +
							    		"</div>" +
							    		"<div class='card-body'>" +
							    		"<h5 class='card-title mb-1 '>" + obj.list[i].locationTitle + "</h5>" + 
							    		"<p class='card-text '>" + obj.list[i].location + "</p>" + 
							    		"</div>" + 
							    		"</div>" + 
							    		"</a>" +
							    		"</div>")
							});

							
						} else {
							Swal.fire({
						        icon: "warning",
						        text: `더 이상 스크롤을 할 수 없습니다.`,
						        confirmButtonText: "확인",
						        closeOnClickOutside : false
						      });
						}
						
						hideSkeleton();
						hideLoading();
						isEnd = true;
						limit += 4;
					}, 2000);
					
				},
				error: function(error) {
					Swal.fire({
				        icon: "error",
				        confirmButtonText: "확인",
				        closeOnClickOutside : false
				      });
					hideSkeleton();
					hideLoading();
				}
			});
		}
	}
});

function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
</script>