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
<link href="https://fonts.googleapis.com/css2?family=Satisfy&display=swap" rel="stylesheet">

<!--owl carousel CSS-->
<link rel="stylesheet" type="text/css" href="${ path }/owlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${ path }/owlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">

<!-- 내용 시작 -->
<section>
  <div class="container px-4 px-lg-4 my-3">
	<div class="place-title" >
	  <h5>"${keyword}"의 검색 결과입니다.</h5>
    </div>
  
      <div class="tour-title">
	      <p class="mt-3 mb-1 font-weight-bold " style="font-size: 1.1rem; color:dimgrey">관광지</p>
	      <div class="owl-carousel owl-theme">
	      	<c:forEach var="dest"  items="${destinations}">
	      		<c:if test="${dest.destSummary eq '관광지'}">
					<div class="item tour-item" style="position:relative;">
			          <a href="${path}/trip/detail?destNo=${dest.destNo}"><img src="${dest.destImage eq null ? '/duck/images/trip/noImage.jpeg' : dest.destImage}" alt="Image 1"></a>
			          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
			            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
			          </svg> ${dest.destHit}</span></div>
			          <div class="owl-text-over m-auto"> 
			            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">${dest.destSubject}</h6>
			            <h6 class="mt-1 ml-1 text-secondary destContent">${dest.destContent}</h6>
			          </div>
			        </div>
		        </c:if>
			</c:forEach>
	      </div>
      </div>
	
	  <div class="reports-title">
	      <p class="mt-3 mb-1 font-weight-bold " style="font-size: 1.1rem; color:dimgrey">레포츠</p>
	      <div class="owl-carousel owl-theme">
		      <c:forEach var="dest"  items="${destinations}">
		      		<c:if test="${dest.destSummary eq '레포츠'}">
						<div class="item reports-item" style="position:relative;">
				          <a href="${path}/trip/detail?destNo=${dest.destNo}"><img src="${dest.destImage eq null ? '/duck/images/trip/noImage.jpeg' : dest.destImage}" alt="Image 1"></a>
				          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
				            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				          </svg> ${dest.destHit}</span></div>
				          <div class="owl-text-over m-auto"> 
				            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">${dest.destSubject}</h6>
				            <h6 class="mt-1 ml-1 text-secondary destContent">${dest.destContent}</h6>
				          </div>
				        </div>
			        </c:if>
			  </c:forEach>
	      </div>
	  <//div>
      
      <div class="culture-title">
	      <p class="mt-3 mb-1 font-weight-bold " style="font-size: 1.1rem; color:dimgrey">문화시설</p>
	      <div class="owl-carousel owl-theme">
		      <c:forEach var="dest"  items="${destinations}">
		      		<c:if test="${dest.destSummary eq '문화시설'}">
						<div class="item culture-item" style="position:relative;">
				          <a href="${path}/trip/detail?destNo=${dest.destNo}"><img src="${dest.destImage eq null ? '/duck/images/trip/noImage.jpeg' : dest.destImage}" alt="Image 1"></a>
				          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
				            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				          </svg> ${dest.destHit}</span></div>
				          <div class="owl-text-over m-auto"> 
				            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">${dest.destSubject}</h6>
				            <h6 class="mt-1 ml-1 text-secondary destContent">${dest.destContent}</h6>
				          </div>
				        </div>
			        </c:if>
			  </c:forEach>
	      </div>
      </div>
      
      <div class="shopping-title">
	      <p class="mt-3 mb-1 font-weight-bold" style="font-size: 1.1rem; color:dimgrey">쇼핑</p>
	      <div class="owl-carousel owl-theme">
		      <c:forEach var="dest"  items="${destinations}">
		      		<c:if test="${dest.destSummary eq '쇼핑'}">
						<div class="item shopping-item" style="position:relative;">
				          <a href="${path}/trip/detail?destNo=${dest.destNo}"><img src="${dest.destImage eq null ? '/duck/images/trip/noImage.jpeg' : dest.destImage}" alt="Image 1"></a>
				          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
				            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				          </svg> ${dest.destHit}</span></div>
				          <div class="owl-text-over m-auto"> 
				            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">${dest.destSubject}</h6>
				            <h6 class="mt-1 ml-1 text-secondary destContent">${dest.destContent}</h6>
				          </div>
				        </div>
			        </c:if>
			  </c:forEach>
	      </div>
      </div>
      
      <div class="hotel-title">
	      <p class="mt-3 mb-1 font-weight-bold " style="font-size: 1.1rem; color:dimgrey">숙박</p>
	      <div class="owl-carousel owl-theme">
		      <c:forEach var="dest"  items="${destinations}">
		      		<c:if test="${dest.destSummary eq '숙박'}">
						<div class="item hotel-item" style="position:relative;">
				          <a href="${path}/trip/detail?destNo=${dest.destNo}"><img src="${dest.destImage eq null ? '/duck/images/trip/noImage.jpeg' : dest.destImage}" alt="Image 1"></a>
				          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
				            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				          </svg> ${dest.destHit}</span></div>
				          <div class="owl-text-over m-auto"> 
				            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">${dest.destSubject}</h6>
				            <h6 class="mt-1 ml-1 text-secondary destContent">${dest.destContent}</h6>
				          </div>
				        </div>
			        </c:if>
			  </c:forEach>
	      </div>
      </div>
      
      <div class="travle-title">
	      <p class="mt-3 mb-1 font-weight-bold" style="font-size: 1.1rem; color:dimgrey">여행코스</p>
	      <div class="owl-carousel owl-theme">
		      <c:forEach var="dest"  items="${destinations}">
		      		<c:if test="${dest.destSummary eq '여행코스'}">
						<div class="item travle-item" style="position:relative;">
				          <a href="${path}/trip/detail?destNo=${dest.destNo}"><img src="${dest.destImage eq null ? '/duck/images/trip/noImage.jpeg' : dest.destImage}" alt="Image 1"></a>
				          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
				            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				          </svg> ${dest.destHit}</span></div>
				          <div class="owl-text-over m-auto"> 
				            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">${dest.destSubject}</h6>
				            <h6 class="mt-1 ml-1 text-secondary destContent">${dest.destContent}</h6>
				          </div>
				        </div>
			        </c:if>
			  </c:forEach>
	      </div>
      </div>
   
      <div class="food-title">
	      <p class="mt-3 mb-1 font-weight-bold " style="font-size: 1.1rem; color:dimgrey">음식</p>
	      <div class="owl-carousel owl-theme mb-3">
		      <c:forEach var="dest"  items="${destinations}">
		      		<c:if test="${dest.destSummary eq '음식'}">
						<div class="item food-item" style="position:relative;">
				          <a href="${path}/trip/detail?destNo=${dest.destNo}"><img src="${dest.destImage eq null ? '/duck/images/trip/noImage.jpeg' : dest.destImage}" alt="Image 1"></a>
				          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
				            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				          </svg> ${dest.destHit}</span></div>
				          <div class="owl-text-over m-auto"> 
				            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">${dest.destSubject}</h6>
				            <h6 class="mt-1 ml-1 text-secondary destContent">${dest.destContent}</h6>
				          </div>
				        </div>
			        </c:if>
			  </c:forEach>
	      </div>
      </div>
      
    </div>
  </div>
</section>

<jsp:include page="../common/footer.jsp"/>

<!--owl carousel JS -->
<script src="${ path }/owlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
<script src="${ path }/owlCarousel2-2.3.4/src/js/owl.autoplay.js"></script>
<script src="${ path }/owlCarousel2-2.3.4/src/js/owl.navigation.js"></script>

<!-- Trip JS -->
<script src="${ path }/js/trip/Mainstyle.js"></script>

<script>
$('.owl-carousel').owlCarousel({
    loop:false,
    margin:10,
    nav:true,
    responsive:{
        0:{
            items:0
        },
        600:{
            items:5
        },
        1200:{
            items:6.6
        }
    }
})

 $(document).ready(function(){
	 
	 if($(".travle-item").length == 0)
		 $(".travle-title").css("display", "none");
	 
	 if($(".food-item").length == 0)
		 $(".food-title").css("display", "none");
	 
	 if($(".reports-item").length == 0)
		 $(".reports-title").css("display", "none");
	 
	 if($(".tour-item").length == 0)
		 $(".tour-title").css("display", "none");
	 
	 if($(".hotel-item").length == 0)
		 $(".hotel-title").css("display", "none");
	 
	 if($(".culture-item").length == 0)
		 $(".culture-title").css("display", "none");
	 
	 if($(".shopping-item").length == 0)
		 $(".shopping-title").css("display", "none");
 })

</script>