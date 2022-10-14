<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="../common/header.jsp"/>

<!-- Trip CSS-->
<link rel="stylesheet" type="text/css" href="${ path }/css/trip/Mainstyle.css">

<!-- Heart CSS-->
<link rel="stylesheet" type="text/css" href="${ path }/css/common/heart.css">

<!--owl carousel CSS-->
<link rel="stylesheet" type="text/css" href="${ path }/owlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${ path }/owlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">

<style>
	.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #fff8c6;background: #fff8c6 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>

<!-- 내용 시작 -->
<section>
    <div class="container px-4 px-lg-4 my-3 position-relative">
      <div class="HeartBox">
        <svg class="Heart" style="z-index: 10;" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 269 264" style="enable-background:new 0 0 269 264;" xml:space="preserve">
            <style type="text/css">
                .st1{fill: coral;}
                .st2{fill: red;}
                .st3{fill:#6BABBD;}
                .st4{fill:#38B133;}
                .st5{fill:#E03BE7;}
                .st6{fill:#E9ACC1;}
                .st7{fill:#fabf42;}
                .st8{fill:#13414C;}
                .st9{font-family:'Montserrat-Regular';}

            </style>
            <g>
                <path id="Particle" class="st1" d="M84.7,71.5c-4.1-3.6-8.1-3.9-10.1-6.4c-1.2-1.5-1.3-4.2,0.4-5.6s4.6-0.6,5.9,0.5
                    C83.8,62.3,82.4,67.1,84.7,71.5z"/>
                <path id="Particle_3_" class="st2" d="M100.5,49.6c-2-5.1-5.5-7.1-6.1-10.3c-0.4-1.9,0.7-4.4,2.9-4.8c2.2-0.5,4.4,1.5,5.1,3.1
                    C103.8,41,100.4,44.6,100.5,49.6z"/>
                <path id="Particle_1_" class="st3" d="M134.9,63.9c0-5.4-2.4-8.6-1.8-11.8c0.4-1.9,2.3-3.8,4.5-3.4c2.2,0.4,3.5,3.1,3.5,4.8
                    C141.2,57.1,136.7,59.2,134.9,63.9z"/>
                <path id="Particle_2_" class="st4" d="M170.5,47.1c-0.3-3.9-2.9-4.3-2-7.4c0.5-1.8,2.6-3.6,4.8-3s3.2,3.4,3.1,5
                    C176.1,45.4,172.6,44.1,170.5,47.1z"/>
                <path id="Particle_10_" class="st1" d="M171.7,77.1c3.6-4.1,3.9-8.1,6.4-10.1c1.5-1.2,4.2-1.3,5.6,0.4c1.4,1.7,0.6,4.6-0.5,5.9
                    C180.9,76.2,176.1,74.8,171.7,77.1z"/>
                <path id="Particle_4_" class="st5" d="M203.7,86c4.1-3.6,8.1-3.9,10.1-6.4c1.2-1.5,1.3-4.2-0.4-5.6c-1.7-1.4-4.6-0.6-5.9,0.5
                    C204.7,76.8,206.1,81.6,203.7,86z"/>
                <path id="Particle_13_" class="st2" d="M221.7,107.9c5.1-2,7.1-5.5,10.3-6.1c1.9-0.4,4.4,0.7,4.8,2.9c0.5,2.2-1.5,4.4-3.1,5.1
                    C230.3,111.2,226.7,107.8,221.7,107.9z"/>
                <path id="Particle_11_" class="st3" d="M205,131.4c5.4,0,8.6-2.4,11.8-1.8c1.9,0.4,3.8,2.3,3.4,4.5c-0.4,2.2-3.1,3.5-4.8,3.5
                    C211.7,137.6,209.6,133.1,205,131.4z"/>
                <path id="Particle_12_" class="st4" d="M205,169.9c3.9-0.3,4.3-2.9,7.4-2c1.8,0.5,3.6,2.6,3,4.8c-0.6,2.2-3.4,3.2-5,3.1
                    C206.6,175.5,208,172,205,169.9z"/>
                <path id="Particle_5_" class="st1" d="M184.6,187.1c4.1,3.6,8.1,3.9,10.1,6.4c1.2,1.5,1.3,4.2-0.4,5.6c-1.7,1.4-4.6,0.6-5.9-0.5
                    C185.5,196.3,186.9,191.5,184.6,187.1z"/>
                <path id="Particle_8_" class="st2" d="M155.5,193.1c2,5.1,5.5,7.1,6.1,10.3c0.4,1.9-0.7,4.4-2.9,4.8c-2.2,0.5-4.4-1.5-5.1-3.1
                    C152.2,201.7,155.7,198.1,155.5,193.1z"/>
                <path id="Particle_6_" class="st3" d="M129.4,214.1c0,5.4,2.4,8.6,1.8,11.8c-0.4,1.9-2.3,3.8-4.5,3.4c-2.2-0.4-3.5-3.1-3.5-4.8
                    C123.1,220.9,127.7,218.8,129.4,214.1z"/>
                <path id="Particle_7_" class="st4" d="M111.3,197.4c0.3,3.9,2.9,4.3,2,7.4c-0.5,1.8-2.6,3.6-4.8,3c-2.2-0.6-3.2-3.4-3.1-5
                    C105.8,199.1,109.2,200.4,111.3,197.4z"/>
                <path id="Particle_14_" class="st1" d="M85.6,191.1c-3.6,4.1-3.9,8.1-6.4,10.1c-1.5,1.2-4.2,1.3-5.6-0.4s-0.6-4.6,0.5-5.9
                    C76.4,192.1,81.2,193.5,85.6,191.1z"/>
                <path id="Particle_9_" class="st5" d="M73.7,165.1c-4.1,3.6-8.1,3.9-10.1,6.4c-1.2,1.5-1.3,4.2,0.4,5.6c1.7,1.4,4.6,0.6,5.9-0.5
                    C72.8,174.3,71.4,169.5,73.7,165.1z"/>
                <path id="Particle_17_" class="st2" d="M55.1,150c-5.1,2-7.1,5.5-10.3,6.1c-1.9,0.4-4.4-0.7-4.8-2.9c-0.5-2.2,1.5-4.4,3.1-5.1
                    C46.6,146.7,50.2,150.1,55.1,150z"/>
                <path id="Particle_15_" class="st3" d="M59.4,114.8c-5.4,0-8.6,2.4-11.8,1.8c-1.9-0.4-3.8-2.3-3.4-4.5c0.4-2.2,3.1-3.5,4.8-3.5
                    C52.7,108.5,54.8,113.1,59.4,114.8z"/>
                <path id="Particle_16_" class="st4" d="M82.6,93.7c-3.9,0.3-4.3,2.9-7.4,2c-1.8-0.5-3.6-2.6-3-4.8s3.4-3.2,5-3.1
                    C81,88.2,79.7,91.6,82.6,93.7z"/>
            </g>
            <g id="Circle">
                <circle cx="134.7" cy="131.1" r="52"/>
            </g>
            <c:if test="${ !empty loginMember }">
				<style type="text/css">
	                .st1{fill: coral;}
	                .st2{fill: red;}
	                .st3{fill:#6BABBD;}
	                .st4{fill:#38B133;}
	                .st5{fill:#E03BE7;}
	                .st6{fill:#E9ACC1;}
	                .st7{fill:#fabf42;}
	                .st8{fill:#13414C;}
	                .st9{font-family:'Montserrat-Regular';}
	            </style>
	            
	            <path id="Heart_2_" class="st7" style="fill-opacity: 0;" d="M131.9,110.7c-6.8-6.3-17.4-6-23.7,0.8c-6.3,6.8-6,17.4,0.8,23.7l14.4,13.5l11.5,10.7l11.5-10.7
                l14.4-13.5c6.8-6.3,7.1-16.9,0.8-23.7c-6.3-6.8-16.9-7.1-23.7-0.8l-2.9,2.7"/>
        	</c:if>
        	
        	<c:if test="${ empty loginMember }">
				<style type="text/css">
	                .st1{fill: coral;}
	                .st2{fill: red;}
	                .st3{fill:#6BABBD;}
	                .st4{fill:#38B133;}
	                .st5{fill:#E03BE7;}
	                .st6{fill:#E9ACC1;}
	                .st7{fill-opacity: 0;}
	                .st8{fill:#13414C;}
	                .st9{font-family:'Montserrat-Regular';}
	            </style>
	            
	            <path id="Heart_2_N" class="st7" style="fill-opacity: 0;" d="M131.9,110.7c-6.8-6.3-17.4-6-23.7,0.8c-6.3,6.8-6,17.4,0.8,23.7l14.4,13.5l11.5,10.7l11.5-10.7
                l14.4-13.5c6.8-6.3,7.1-16.9,0.8-23.7c-6.3-6.8-16.9-7.1-23.7-0.8l-2.9,2.7"/>
        	</c:if>
            </svg>
          </div>
        <div class="detail-main row align-items-center position-relative" >
            <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${dest.destImage eq null ? '/duck/images/trip/noImage.jpeg' : dest.destImage}" alt="..." />
            </div>
            <div class="detail-mail-desc col-md-6 pl-0 position-absolute">
              <div class="score"><span><svg class="mb-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#FABF42" class="bi bi-star-fill" viewBox="0 0 16 16">
                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg> ${dest.destHit}</span></div>
              <div class="title">
                <div>
                  <a href="${path}/trip/main">홈 ></a>
                  <a href="${path}/trip/list?locationId=${location.locationId}">${dest.destCategory}</a>
                </div>
                <h2 class="stu_h2_title">${dest.destSubject}</h2>
                <p>${dest.destSummary}</p>
              </div>
              <div class="description">
                <p class="lead" style="font-size: 1rem;">${dest.destContent}</p>
              </div>
            </div>
        </div>

        <p class="h3 mb-0 mt-5">경험해볼 만한 것들</p>
        <div class="row mt-2">
        	<c:forEach var="dest" items="${destnations}">
	        	<div class="col-md-6 col-lg-3">
		        	<a href="${path}/trip/detail?destNo=${dest.destNo}">
		              <div class="card">
		                <div style="overflow: hidden;">
		                  <img class="card-img-top w-100" data-src="holder.js/300x200" alt="300x200" style="width: 300px; height: 200px;" src="${dest.destImage eq null ? '/duck/images/trip/noImage.jpeg' : dest.destImage}" data-holder-rendered="true">
		                </div>
		                <div class="card-body">
		                  <h6 class="mt-1 mb-0 ml-1 font-weight-bold">${dest.destSubject}</h6>
		                  <h6 class="mt-1 ml-1 text-secondary">${dest.destContent}</h6>
		                </div>
		              </div>
		              </a>
	            </div>
        	</c:forEach>
            
          </div>
        
          <div class="tabs tabs-alt tabs-tb clearfix ui-tabs ui-corner-all ui-widget ui-widget-content mt-4" id="tab-8">
            <ul class="tab-nav clearfix ui-tabs-nav" role="tablist">
              <li role="tab" class="ui-tabs-tab ui-corner-top ui-state-default ui-tabs-active " data-tab="tab-1"><a href="#tab-1">여행지 정보</a></li>
              <li role="tab" class="ui-tabs-tab ui-corner-top ui-state-default" data-tab="tab-2"><a href="#tab-2">별점</a></li>
            </ul>

            <div class="tab-container">
              <div id="tab-1" class="tab-content clearfix ui-tabs-active " aria-hidden="">
				<div class="mt-3 ml-2">               
                   <div id="map" style="width:500px;height:400px;"></div>
				</div> 
              </div>
              <div id="tab-2" class="tab-content clearfix" aria-hidden="" style="display: none;">
                <section class="mb-5">
                  <div class="card-tab bg-light">
                      <div class="card-tab pt-2 px-3 pb-3">
                          <!-- Comment form-->
                          <form class="mb-2 ">
                            <div class="star-rating space-x-4 mx-auto float-left ">
                              <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
                              <label for="5-stars" class="star">★</label>
                              <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                              <label for="4-stars" class="star">★</label>
                              <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                              <label for="3-stars" class="star">★</label>
                              <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                              <label for="2-stars" class="star">★</label>
                              <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                              <label for="1-star" class="star">★</label>
                            </div>
                            <button id="enrollAlert" class="btn btn-outline-warning btn-sm float-right" type="button">등록</button>
                            <p class="pt-2" style="font-size: 0.9em;">별점을 선택해주세요</p>
                            
                            <textarea class="form-control shadow-none" rows="3" placeholder="리뷰를 남겨주세요" style="resize: none;"></textarea>
                              <p class="mt-1 col p-0" style="font-size: 11px;">2022.09.16 01:30
                              </p>
                            
                          </form>
                          <!-- Comment with nested comments-->
                          <div class="d-flex mb-4">
                              <!-- Parent comment-->
                              <div class="flex-shrink-0"><img class="rounded-circle" src="${ path }/images/common/프사.png" alt="..." style="height: 50px; width: 50px; object-fit:contain ;" ></div>
                              <div class="ms-3 w-100">
                                <p style="font-weight: bold;">짹짹이 김여울</p>
	                              <div class="star-rating m-0">
									<span>별점</span> 	
	                              </div>
                                  <div class="float-right">
                                    <button id="updateAlert" class="btn btn-outline-warning py-0">수정</button>
                                    <button id="deleteAlert" class="btn btn-outline-warning py-0">삭제</button>
                                  </div>
                                    <p>아싸 해산!!!</p>
                                  <!-- Child comment 1-->
                                  <div class="d-flex mt-2">
                                      <div class="flex-shrink-0"><img class="rounded-circle" src="${ path }/images/common/프사.png" alt="..." style="height: 50px; width: 50px; object-fit:contain ;"></div>
                                      <div class="ms-3 w-100">
                                        <p style="font-weight: bold;">선긋기 김민주</p>
                                          <div class="float-right">
                                            <button id="updateAlert" class="btn btn-outline-warning py-0">수정</button>
                                            <button id="deleteAlert" class="btn btn-outline-warning py-0">삭제</button>
                                          </div>
                                            <p>저 빼고 재밌는 이야기하지 마세여</p>
                                      </div>
                                  </div>
                                  <!-- Child comment 2-->
                                  <div class="d-flex mt-3">
                                      <div class="flex-shrink-0"><img class="rounded-circle" src="${ path }/images/common/프사.png" alt="..." style="height: 50px; width: 50px; object-fit:contain ;"></div>
                                      <div class="ms-3 w-100">
                                        <p style="font-weight: bold;">코드의마법사 박노경</p>
                                          <div class="float-right">
                                            <button id="updateAlert" class="btn btn-outline-warning py-0">수정</button>
                                            <button id="deleteAlert" class="btn btn-outline-warning py-0">삭제</button>
                                          </div>
                                            <p>사는게 쉽지가 않네요...</p>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          
                          <!-- Single comment-->
                          <div class="d-flex">
                              <div class="flex-shrink-0"><img class="rounded-circle" src="${ path }/images/common/프사.png" alt="..." style="height: 50px; width: 50px; object-fit:contain ;"></div>
                              <div class="ms-3 w-100">
                                <p style="font-weight: bold;">무게치는 이건호</p>
                                  <div class="float-right">
                                    <button id="updateAlert" class="btn btn-outline-warning py-0">수정</button>
                                    <button id="deleteAlert" class="btn btn-outline-warning py-0">삭제</button>
                                  </div>
                                    <p>계란후라이 먹었어요</p>
                              </div>
                          </div>
                      </div>
                  </div>
                </section>
                </div>
              </div>
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

<!-- Heart JS -->
<script src="${ path }/js/common/heart.js"></script>

<!-- sweetalert2 alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
  // alertsweet 버튼
  $(document).ready(function () {
    $('[id="deleteAlert"]').on("click", function () {
      Swal.fire({
        icon: "warning",
        title: "댓글삭제",
        text: `댓글을 삭제 하시겠습니까?`,
        showCancelButton: true,
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
        closeOnClickOutside : false

      }).then(function (result) {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          //삭제 요청 처리
          swal.fire(
          '삭제완료!',
          '댓글이 삭제되었습니다',
          'success'
    )
        } else {
          //취소
        }
      });
    });

    $('[id="enrollAlert"]').on("click", function () {
      var form = $(this).parents('form');
      Swal.fire({
        icon: "success",
        title: "등록성공!",
        text: `댓글이 등록되었습니다.`,
        confirmButtonText: "확인",
        closeOnClickOutside : false

      }).then(function (isConfirmed) {
        //등록 요청 처리
        document.getElementById('updateAlert').submit();
      });
    });

    $('[id="updateAlert"]').on("click", function () {
      Swal.fire({
        icon: "warning",
        title: "댓글수정",
        text: `댓글을 수정 하시겠습니까?`,
        showCancelButton: true,
        confirmButtonText: "수정",
        cancelButtonText: "취소",
        closeOnClickOutside : false

      }).then(function (result) {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          //삭제 요청 처리
          swal.fire(
          '수정완료!',
          '댓글이 수정되었습니다',
          'success'
    )
        } else {
          //취소
        }
      });
    });
  });
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ffc9caebebf866316d34a68b425adfd"></script>
<script>
	var mapX="${dest.destMapX}";
	var mapY="${dest.destMapY}";
	
	if(mapX == "" || mapX == null){
		mapX = 33.42404;
		mapY = 126.93073;
	}

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(mapX, mapY), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var imageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbj1sID%2FbtrOmc6KtD6%2FKF00nKO1xpe9nbUlbySxn1%2Fimg.png', // 마커이미지의 주소입니다
    imageSize = new kakao.maps.Size(40, 60), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(15, 32)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
	//마커가 표시될 위치입니다 
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(mapX, mapY); // 마커가 표시될 위치입니다
	
	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position: markerPosition,
		image: markerImage // 마커이미지 설정
	});
	
	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	var content = '<div class="customoverlay">' +
	   '  <a href="#" target="_blank">' +
	    '    <span class="title">${dest.destSubject}</span>' +
	    '  </a>' +
	    '</div>';
    
 	// 커스텀 오버레이가 표시될 위치입니다 
    var position = new kakao.maps.LatLng(mapX, mapY);  
    
	 // 커스텀 오버레이를 생성합니다
	    var customOverlay = new kakao.maps.CustomOverlay({
	        map: map,
	        position: position,
	        content: content,
	        yAnchor: 0.2
	    });
</script>

<script>
$(document).ready(function () {
	  function addListener() {
	    var btn = document.querySelector("#Heart_2_");
	    btn.addEventListener("click", restart, false);
	  }

	  function restart() {
	    // var newHeart = document.getElementsByClassName(".st7");
	    var container = document.querySelector("#Layer_1");
	    var newContainer = container.cloneNode(true);

	    container.parentNode.replaceChild(newContainer, container);
	    $(".st7").removeAttr("style");

	    addListener();
	  }
	  addListener();
	});
</script>