<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="../common/header.jsp" />
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>

<!--BootStrap CSS-->
<link rel="stylesheet" type="text/css"
	href="${ path }/resources/css/album.css">

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


<section>
	<div class="container-fluid">

		<div class="row">
			<div class="left-box">
				<div class="list-group">
					<div class="list-group-item">
						<input type="title" value=" ${ location.location } ">
					</div>

					<div class="list-group-item list-group-item-primary">여행 기간</div>
					<div class="list-group-item list-group-item-secondary">
						<input type="text" id="demo" name="demo" value="" />
					</div>
				</div>
				<div class="col-12 my-3" style="text-align: center;">
					<button type="button" class="col-5 btn btn-success">완 성</button>
					<button type="button" class="col-5 btn btn-danger" onclick="">초기화</button>
				</div>
			</div>
			<div class="col-8">
				<div id="map" style="width: 100%; height: 100vh;"></div>
				<p id="result"></p>
			</div>
			<div class="right-box">
				<div class="courseZero_margin90"></div>

				<div id="right-box1">
					<input id="searchBox" type="text" placeholder="검색어를 입력해주세요">
					<button id="magBtn">
						<i class="fas fa-search">검색</i>
					</button>
				</div>
				<input type="hidden" id="card-plus-btn">
			</div>
		</div>
	</div>
</section>

<jsp:include page="../common/footer.jsp" />


<script type="text/javascript" src="${ path }/resources/js/daterangepicker.js"></script>
<script type="text/javascript" src="${ path }/resources/js/date/date.js"></script>
<script type="text/javascript" src="${ path }/resources/js/planner/map.js"></script>
