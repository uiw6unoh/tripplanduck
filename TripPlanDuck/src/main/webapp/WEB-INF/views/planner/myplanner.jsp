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
</style>
<section>

<% 
//List<Location> lo = (List<Location>)request.getAttribute("location");
//int lo_id = lo.get(0).getLocationId();
//out.println(lo_id);
%>

<form name="frm" action="${path}/planner/myplannerAction" method="post">
		<div class="container-fluid">
			<div class="row">
				<div class="left-box">
					<div class="list-group">
						<div class="list-group-item">
							<select id="locationSelect" name="locationSelect" onchange="locationValue(this)">
								<c:forEach items="${ location }" var="location" varStatus="status">
									<option id="location" value="${ location.locationId }">
									${ location.location }
									</option>								

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
						</div>
						<div class="list-group-item list-group-item-primary"
							style="background-color: white;">여행 기간</div>
						<div class="list-group-item list-group-item-secondary"
							style="background-color: white;">
							<input type="text" id="demo" name="demo" value="" />
						</div>
					</div>
					<div class="col-12 my-3" style="text-align: center;">
						<!-- 정리되면 마이페이지로 이동하는 식으로 바꿔야함 -->
						<input type="submit" name="location" class="col-5 btn btn-success" value="완 성">
						<button type="button" id ="delete" class="col-5 btn btn-danger">초기화</button>
					</div>
				</div>

				<div class="col-8">
					<div id="map" style="width: 100%; height: 100vh;"></div>
					<p id="result"></p>
				<script type="text/javascript" src="${ path }/resources/js/planner/mapcreate.js"></script>
				</div>
				<div class="right-box">
					<div class="courseZero_margin90"></div>

					<div id="right-box1">
						<!-- 검색창을 삭제할까...흠 
						<input id="searchBox" type="text" placeholder="검색어를 입력해주세요">
						<button id="magBtn">
							<i class="fas fa-search">검색</i>
						</button>
						-->
						
						<div style="height: 35%; overflow: auto">
							<c:forEach items="${ destination }" var="destination"
								varStatus="status">
								<div class="card mb-3 loca_${ destination.locationId }"
									style="max-width: 400px;">
									<div class="row no-gutters">
										<div class="col-md-4">
											<img
												src="${ destination.destImage }"
												alt="...">
										</div>
										<div class="col-md-8">
											<div class="card-body">
												<h5 class="card-title" id="subject">>${ destination.destSubject }</h5>
												<p class="card-text">${ destination.destContent }</p>

											</div>
										</div>
									</div>
									<div class="addDesti">
										<a class="material-icons">check</a>
										 <input type="hidden"
											id="destMapX" name="destMapX"
											value="${ destination.destMapX }" /> 
											<input type="hidden"
											id="destMapY" name="destMapY"
											value="${ destination.destMapY }" /> 
											<input type="text"
											id="destSubject" name="destSubject"
											value="${ destination.destSubject }" />
											 <input type="text"
											id="destNo" name="destination2"
											value="${ destination.destNo }" />
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					
					<input type="text" name="place" id="place">
					<input type="hidden" id="card-plus-btn">
				</div>
			</div>
		</div>
</form>

</section>

<script>

	$("[class^='addDesti']").on("click", function(event) {

		let destMapX = $(this).children('#destMapX').val().trim();
		let destMapY = $(this).children('#destMapY').val().trim();
		let destSubject = $(this).children('#destSubject').val().trim();
		let destNo = $(this).children('#destNo').val().trim();
		
		addMarker(new kakao.maps.LatLng(destMapX, destMapY));
		$("#place").val(markers);
		console.log(markers);
		
		
		 $.ajax({
		 type: "GET",
		 url: "${ path }/planner/addDesti",
		 dataType: "json",
		 data: {
		 destMapX,
		 destMapY,
		 destSubject,
		 destNo
		 },

		 success: (obj) => {


		 console.log(destMapX);
		 console.log(destMapY);
		 console.log(destSubject);
		 console.log(destNo);
		
		 }, 
		 error: (error) => {
		 console.log(error);
		 }
		 });
	});


</script>

<jsp:include page="../common/footer.jsp" />


<script type="text/javascript"
	src="${ path }/resources/js/daterangepicker.js"></script>
<script type="text/javascript" src="${ path }/resources/js/date/date.js"></script>

<script type="text/javascript"
	src="${ path }/resources/js/planner/mapex.js"></script>
<script type="text/javascript" src="${ path }/resources/js/planner/addMarker.js"></script>

<script>	
	locationValue( $('#locationSelect') );
</script>