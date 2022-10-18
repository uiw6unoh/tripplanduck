<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%//@page import = "java.util.*" %>
<%//@page import = "com.tripplan.duck.planner.model.vo.*" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="https://code.jquery.com/jquery-3.6.1.slim.js"
	integrity="sha256-tXm+sa1uzsbFnbXt8GJqsgi2Tw+m4BLGDof6eUPjbtk="
	crossorigin="anonymous"></script>
<jsp:include page="../common/header.jsp" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!--BootStrap CSS-->
<link rel="stylesheet" type="text/css"
	href="${ path }/resources/css/common/myplanner/myplanner.css">

<link rel="stylesheet" type="text/css"
	href="${ path }/resources/css/daterangepicker.css">
<!--BootStrap JS-->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<!--  데이트 피커 스크립트 -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- 카카오 api -->
<script type="text/javascript"
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f7b032a05f94f4d597ccea28be03f94f&libraries=services"></script>

<style>
.list-group-item {
	position: relative;
	display: block;
	padding: 0.75rem 1.25rem;
	background-color: #fff;
}

.destImage {
	max-width: 100px;
	max-height: 100px;
}
</style>
<section>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
  모달 테스트
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<div class="map_wrap">
			<div id="mapCopy" style="width: 50%; height: 50%;">
		    <p class="getdata">
		        <button onclick="getDataFromDrawingMap()">가져오기</button>
		    </p>
			</div>
		</div>
		</div>
		
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>




	<form name="frm" action="${path}/planner/myplannerAction" method="post">
		<div class="container-fluid">
			<div class="row">
				<div class="left-box">
					<div class="list-group">
						<div class="list-group-item">
							<select id="locationSelect" name="locationSelect"
								onchange="locationValue(this)">
								<c:forEach items="${ location }" var="location"
									varStatus="status">
									<option id="location" value="${ location.locationId }">
										${ location.location }</option>

								</c:forEach>



							</select>
							<!-- 
						 <select>
						 	<option value="1">서울</option>
						 	<option value="2">인천</option>
						 	<option value="3">대전</option>
						 	<option value="4">대구</option>
						 	<option value="5">광주</option>
						 	<option value="6">부산</option>
						 	<option value="7">울산</option>
						 	<option value="8">세종특별자치시</option>
						 	<option value="31">경기도</option>
						 	<option value="32">강원도</option>
						 	<option value="33">충청북도</option>
						 	<option value="34">충청남도</option>
						 	<option value="35">경상북도</option>
						 	<option value="36">경상남도</option>
						 	<option value="37">전라북도</option>
						 	<option value="38">전라남도</option>
						 	<option value="39">제주도</option>
						 </select>
						  -->


							<div class="list-group-item list-group-item-primary"
								style="background-color: white;">여행 기간</div>
							<div class="list-group-item list-group-item-secondary"
								style="background-color: white;">
								<input type="text" id="demo" name="demo" value="" />
							</div>
						</div>
						<div class="col-12 my-3" style="text-align: center;">
							<!-- 정리되면 마이페이지로 이동하는 식으로 바꿔야함 -->
							<input type="submit" name="location"
								class="col-5 btn btn-success" value="완 성">
								<a  data-toggle="modal" data-target="#myModal" href="${ path }/planner/test" >Launch modal</a>
							<!-- 
								<a id="delete" class="col-5 btn btn-danger" href="${ path }/planner/test">초기화</a>
							 -->	

						</div>
						<button type="button" id="lookCourseBtn" class="btn btn-md">경로
							보기</button>
					</div>
					<div class="left-box2">
						<div id="divCopy" style="height: 25%; overflow: auto;">
							<div class="row no-gutters"></div>
								<div id="divCopy_chil" class="col-md-4"></div>
								<div class="col-md-8">
									<div class="card-body "></div>
								</div>
						</div>
					</div>
				</div>
				<div class="col-7">
					<div id="map" style="width: 100%; height: 100vh;"></div>
					<script type="text/javascript"
						src="${ path }/resources/js/planner/mapcreate.js"></script>
				</div>
				<div class="right-box">
					<div class="courseZero_margin90"></div>
					<!-- 검색창을 삭제할까...흠 
						<input id="searchBox" type="text" placeholder="검색어를 입력해주세요">
						<button id="magBtn">
							<i class="fas fa-search">검색</i>
						</button>
						-->
					<div style="height: 30%; overflow: auto" class="divOriginal">
						<c:forEach items="${ destination }" var="destination"
							varStatus="status">
							<div id="divOriginal_${ destination.destNo }"
								class="card mb-3 loca_${ destination.locationId }"
								style="width: 400px;">
								<div class="row no-gutters">
									<div class="col-md-4">
										<img class="destImage" src="${ destination.destImage }">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title" id="subject">>${ destination.destSubject }</h5>
											<p class="card-text">${ destination.destContent }</p>
										</div>
									</div>
								</div>
								<div class="addDesti">
									<a id="checkButton" class="material-icons">check</a> 
									<input
										type="hidden" id="destMapX" name="destMapX"
										value="${ destination.destMapX }" /> <input type="hidden"
										id="destMapY" name="destMapY"
										value="${ destination.destMapY }" /> <input type="hidden"
										id="destImage" name="destImage"
										value="${ destination.destImage }"> <input
										type="hidden" id="destSubject" name="destSubject"
										value="${ destination.destSubject }" /> <input type="hidden"
										id="destNo" name="destNo" value="${ destination.destNo }" />
									<input type="hidden" id="destContent" name="destContent"
										value="${ destination.destContent }" />
								</div>
							</div>
						</c:forEach>
					</div>

					<input type="text" name="place" id="place">
				</div>
			</div>
		</div>
	</form>

</section>

<script>

var markers = [];
//clusterer.addMarker( markers );
var ovarlays = [];
var lines = [];
var names = [];
var positions = [];
var data = new Array();
var imageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbj1sID%2FbtrOmc6KtD6%2FKF00nKO1xpe9nbUlbySxn1%2Fimg.png', // 마커이미지의 주소입니다    
 imageSize = new kakao.maps.Size(40, 60), // 마커이미지의 크기입니다
 imageOption = {offset: new kakao.maps.Point(15, 32)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
 
	
	$(document).ready(function(){
		
		$("[class^=addDesti]").on("click", function(event) {
	
			let destMapX = $(this).children('#destMapX').val().trim();
			let destMapY = $(this).children('#destMapY').val().trim();
			let destSubject = $(this).children('#destSubject').val().replaceAll(" ", "");
			let destNo = $(this).children('#destNo').val().trim();
			
			// 마커 찍기
			addMarker(new kakao.maps.LatLng(destMapX, destMapY));
	
				 data.push(destSubject);
				 $("#place").val(data);
	
		$('#divOriginal_'+destNo).appendTo('#divCopy_chil');
		
		$('#divCopy').find('.addDesti').replaceWith('<div onclick=deleteDiv('+destNo+',"'+destSubject+'","'+destMapX+'","'+destMapY+'")> <a class="material-icons")>delete</a></div>');
		//$('#divCopy').find('#divCopy_').replaceAll('#divOriginal_');
		
		//$('#divCopy_chil').find('#divOrginal_'+destNo).replaceWith();
		//$('#addDesti').find('a').replaceWith('a id="x" class="material-icons">delete</a>);
		
		//$('#divCopy_chil').children('#divOriginal_'+destNo).remove();
		
		});
	});
	
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    addMarker: addMarker
	});
	
// 마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position) {
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: position,
        image: markerImage
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);
}




function deleteDiv(destNo,destSubject,destMapX,destMapY) {
	let destMapXD = parseFloat(destMapX);
	let destMapYD = parseFloat(destMapY);
	
	
	$('#divCopy_chil').children('#divOriginal_'+destNo).remove();
	
	for(var i = 0; i < data.length; i++){
		
		if(data[i] == destSubject){
		markers[i].setMap(null);
		data.splice(i,1);
    	markers.splice(i,1);
    	positions.splice(i, 1);
    	ovarlays.splice(i, 1);
		$("#place").val(data);
		
		}
	}
	
};



//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다


 // 지도상의 선 긋기
const lookCourseBtn = document.getElementById('lookCourseBtn');
      lookCourseBtn.addEventListener('click', event =>{
	 	
	for (var i = 0; i < ovarlays.length; i++){
             ovarlays[i].setMap(null);
     	}  
		 ovarlays = [];
         addLine(markers);

});
      
function addLine(markers){
   var linePath=[];      
   for (i=0; i < markers.length; ++i){
      linePath.push(markers[i].getPosition()); 
   }   


   // 지도에 표시할 선을 생성합니다
   var polyline = new kakao.maps.Polyline({
	   
       path: linePath, // 선을 구성하는 좌표배열 입니다
       strokeWeight: 2, // 선의 두께 입니다
       strokeColor: 'red', // 선의 색깔입니다
       strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
       strokeStyle: 'solid' // 선의 스타일입니다
   });
   
   lines.push(polyline);
   // 지도에 선을 표시합니다 
   polyline.setMap(map); 
}



//$('#myModal').modal({
//	  keyboard: false
//});

</script>

<jsp:include page="../common/footer.jsp" />


<script type="text/javascript"
	src="${ path }/resources/js/daterangepicker.js"></script>
<script type="text/javascript" src="${ path }/resources/js/date/date.js"></script>

<script type="text/javascript"
	src="${ path }/resources/js/planner/mapex.js"></script>
	<!-- 
		<script type="text/javascript"
			src="${ path }/resources/js/planner/addMarker.js"></script>
		<script type="text/javascript"
			src="${ path }/resources/js/planner/modal.js"></script>
	 -->

<script>	
	locationValue( $('#locationSelect') );
</script>