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
    <div class="img-box" style="text-align: center;" >
      <div>
        <img class="img-thumbnail" src="${ path }/images/trip/제주.png">
      </div>
      <p class="font" style="font-family: 'Satisfy'" font-weight;>Jeju Island</p>
    </div>
  
      <p class="mt-3 mb-1 font-weight-bold" style="font-size: 1.1rem; color:dimgrey">인기명소</p>
      <div class="owl-carousel owl-theme mb-2">
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 1"></a>
          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg> 1224</span></div>
          <div class="owl-text-over m-auto"> 
            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">관광지 제목1</h6>
            <h6 class="mt-1 ml-1 text-secondary">관광지 설명~~~~!@#!$!%</h6>
          </div>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 2"></a>
          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg> 1224</span></div>
          <div class="owl-text-over m-auto"> 
            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">관광지 제목2</h6>
            <h6 class="mt-1 ml-1 text-secondary">관광지 설명~~~~!@#!$!%</h6>
          </div>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 3"></a>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 4"></a>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 5"></a>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 5"></a>
        </div>
      </div>
    
      <p class="mt-3 mb-1 font-weight-bold" style="font-size: 1.1rem; color:dimgrey">체험</p>
      <div class="owl-carousel owl-theme mb-2">
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 1"></a>
          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg> 1224</span></div>
          <div class="owl-text-over m-auto"> 
            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">관광지 제목1</h6>
            <h6 class="mt-1 ml-1 text-secondary">관광지 설명~~~~!@#!$!%</h6>
          </div>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 2"></a>
          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg> 1224</span></div>
          <div class="owl-text-over m-auto"> 
            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">관광지 제목2</h6>
            <h6 class="mt-1 ml-1 text-secondary">관광지 설명~~~~!@#!$!%</h6>
          </div>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 3"></a>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 4"></a>
        </div>
      </div>

      <p class="mt-3 mb-1 font-weight-bold" style="font-size: 1.1rem; color:dimgrey">미술관 / 박물관</p>
      <div class="owl-carousel owl-theme mb-5">
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 1"></a>
          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg> 1224</span></div>
          <div class="owl-text-over m-auto"> 
            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">관광지 제목1</h6>
            <h6 class="mt-1 ml-1 text-secondary">관광지 설명~~~~!@#!$!%</h6>
          </div>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 2"></a>
          <div class="starTrip"><span><svg xmlns="http://www.w3.org/2000/svg" class="mb-1" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg> 1224</span></div>
          <div class="owl-text-over m-auto"> 
            <h6 class="mt-1 mb-0 ml-1 font-weight-bold">관광지 제목2</h6>
            <h6 class="mt-1 ml-1 text-secondary">관광지 설명~~~~!@#!$!%</h6>
          </div>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 3"></a>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 4"></a>
        </div>
        <div class="item">
          <a href="#"><img src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg" alt="Image 5"></a>
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
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:5.6
        }
    }
})

</script>