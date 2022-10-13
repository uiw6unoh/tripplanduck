<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="../common/header.jsp" />
<!-- MyPage CSS -->
<link rel="stylesheet" type="text/css"
	href="${ path }/css/mypage/Mypage.css">

<!-- fontawesome CSS -->
<script src="https://kit.fontawesome.com/f8167db045.js"
	crossorigin="anonymous"></script>
<!-- jquery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
	<!-- Mypage 시작 -->
	<!-- 전체 컨테이너 -->
	<div class="container">
		<!-- 상위 컨테이너 -->
		<div class="p-5 top-container">
			<div class="userMypageMenu">
				<div class="userInfo">
					<img src="${ path }/images/common/프사.png" alt="profile"
						style="width: 100px; height: 100px; border-radius: 50%;">
					<div class="pt-1 nickName">
						<%-- 테스트 데이터 --%>
						${member.memberNickname }
					</div>
				</div>
				<div class="py-4 px-2 btn-UserMypageMenu">
					<button class="btn btn-outline-warning btn-sm btn-block">내
						위드덕</button>
					<button class="btn btn-outline-warning btn-sm btn-block"
						data-toggle="modal" data-target="#changeUserInfo">회원정보수정</button>
				</div>
			</div>
		</div>
		<!-- 탭 메뉴 컨테이너 -->
		<div class="nav-container">
			<div id="horizontal-underline"></div>
			<ul class="nav justify-content-center">
				<li class="mr-4 nav-item">
					<button type="button" class="nav-link"
						onclick="location.href='${path}/mypage?select=planner&offset=1'">Like
						Plan</button>
				</li>
				<li class="mr-4 nav-item">
					<button type="button" class="nav-link"
						onclick="location.href='${path}/mypage?select=trip&offset=1'">내
						여행지</button>
				</li>
				<li class="mr-4 nav-item">
					<button type="button" class="nav-link"
						onclick="location.href='${path}/mypage?select=comment&offset=1'">나의
						리뷰</button>
				</li>
			</ul>
		</div>

		<!-- 하위 컨테이너 -->
		<div class="content-container">
			<!-- Like Plan -->
			<%-- 테스트 데이터 --%>
			<div id="likePlan">
				<h3 class="section-title">Like Plan</h3>
				<div id="text"></div>
				<!-- Like Plan 카드 -->
				<a>
					<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="https://www.myro.co.kr/getSpotImage/jeju?no=1000"
									class="img-fluid rounded-start imgSize" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<i class="fa-sharp fa-solid fa-heart fa-lg" id="heartIcon"></i>
									<div class="info-container-top">
										<div class="card-title title mt-3">
											<h5>여행지</h5>
										</div>
										<div class="card-title text-content mt-3">
											<h5>제주</h5>
										</div>
									</div>
									<div class="info-container-top">
										<p class="card-text title">작성인</p>
										<p class="card-text text-content">닉네임2</p>
									</div>
									<div class="info-container-top">
										<p class="card-text title">여행 소요 시간</p>
										<p class="card-text text-content"></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</a>
				<!--   ajax로 불러온 데이터가 추가되는 곳 -->
				<div id="appendPlan"></div>

				<div class="wrap-downChevron">
					<abbr title="더보기"> <img class="down-chevron"
						alt="planner-down" src="${ path }/images/mypage/down-chevron.png">
					</abbr>
				</div>
			</div>

			<!-- 내 여행지 -->

			<div id="myPlanner">
				<h3 class="section-title">내 여행지</h3>
				<!-- 여행지 필터 -->
				<div>
					<select name="selectBox" id="selectBox" onchange="changeOption(this.value)" style="width:80px;" class="form-control">      
				<c:forEach var="options" items="${options}" varStatus="i">
					 <option value="${options.locationId}">${options.location}</option>
				</c:forEach>
					</select>
				</div>
				<!-- 여행지 카드 -->
				<a>
					<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="https://www.myro.co.kr/getSpotImage/jeju?no=1000"
									class="img-fluid rounded-start imgSize" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<i class="fa-sharp fa-solid fa-heart fa-lg" id="heartIcon"></i>
									<div class="info-container-top">
										<div class="card-title title mt-3">
											<h5>명소명</h5>
										</div>
										<div class="card-title text-content mt-3">
											<h5>디파트먼트</h5>
										</div>
									</div>
									<div class="info-container-top">
										<p class="card-text title">도시명</p>
										<p class="card-text text-content">제주</p>
									</div>
									<div class="info-container-top">
										<p class="card-text title">주소</p>
										<p class="card-text text-content">제주특별자치도 제주시 한림읍 한림로
											329-10</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</a>

				<!--  ajax로 불러온 데이터가 추가되는 곳 -->
				<div id="appendTrip"></div>

				<div class="wrap-downChevron">
					<abbr title="더보기"> <img class="down-chevron" alt="trip-down"
						src="${ path }/images/mypage/down-chevron.png">
					</abbr>
				</div>
			</div>

			<!-- comment -->
			<div id="myComment">
				<!-- comment 카드 시작 -->
				<h3 class="section-title">나의 리뷰</h3>
				<a>
					<div class="card mt-4 mb-2 commentCard" style="max-width: 900px;">
						<div>
							<div class="card-body">
								<div class="destination">
									<h4 class="card-title">성산일출봉</h4>
									<span class="separator">|</span>
									<h5 class="card-area">제주</h5>
								</div>
								<p class="card-text">아름다웠어요</p>
								<p class="card-text">
									<small class="text-muted">2022-09-25</small>
								</p>
								<div class="card-btns">
									<button type="button" class="btn btn-warning"
										onclick="location.href=''">수정</button>
									<button type="button" class="btn btn-secondary">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</a>

				<!--  ajax로 불러온 데이터가 추가되는 곳 -->
				<div id="appendComment"></div>

				<!-- 더보기 -->
				<div class="wrap-downChevron">
					<abbr title="더보기"> <img class="down-chevron"
						alt="comment-down" src="${ path }/images/mypage/down-chevron.png">
					</abbr>
				</div>
			</div>

			<!-- 비밀번호 확인 모달 -->
			<div class="modal fade" id="changeUserInfo" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">비밀번호 재확인</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="text" class="inputPwd" placeholder="비밀번호 입력">

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-outline-warning"
								onclick="location.href='UpdateForm.html'">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="../common/footer.jsp" />

		<!-- MyPage JS -->
		<%-- <script src="${path}/js/mypage/card.js"></script> --%>
		<script type="text/javascript">
	var selected = "";  
	var locSelected = [];
	
	 function changeOption(e){
		 sendReq("trip", e);
	 }
	 
	document.querySelectorAll('.down-chevron').forEach((cell) => {
	  cell.addEventListener('click', function() {
	    var select = cell.getAttribute('alt').replace('-down','')
	   // console.log(select)
	    sendReq(select);
	  });
	});
 
  
	
	function sendReq(select, locationId){
		console.log(select)
		var offset = 1
		
	//	locationId = locationId == undefined? 1 : locationId
		
		if(locationId == undefined){
			locationId = 1
			
			selected += select;
			
			var matchReg = new RegExp(select,"g");
			var test = selected.match(matchReg)
			
			console.log('동일 카드 더보기 누른 횟수:'+ test.length)
			
			offset = test.length
			
			console.log(locSelected)
					
		}else {
			offset = 0
			locSelected.push(locationId)
			
			if(locSelected.includes(locationId)){
				for(let i=0; i < locSelected.length; i++) {
					  if(locSelected[i] === locationId)  {
					    offset++;
					  }
					}
			}else{
				offset = 1;
			}
			console.log(locSelected)
			console.log(offset)
			
			
		}
		
		console.log("locationId :", locationId)
				
		$.ajax({
			url : "/duck/mypage/ajax?select="+select+"&offset="+offset+"&locationId="+locationId,
			type : "get",
			dataType : "json",
			success : function(result){
				console.log(result)
				var appendData = '';
				for(var i = 0; i < result.data.length; i++){
					var data = result.data[i]
					if(select === 'planner'){
						appendData += 	
							'<a> ' + 
			                '<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;"> ' +
			                  '<div class="row g-0"> ' + 
			                   '<div class="col-md-4"> ' +
			                      '<img src="'+ data.destImg+'" class="img-fluid rounded-start imgSize" alt="..."> ' +
			                    '</div> ' +
			                    '<div class="col-md-8"> '+
			                      '<div class="card-body"> '+
			                       '<i class="fa-sharp fa-solid fa-heart fa-lg" id="heartIcon"></i> ' +
			                        '<div class="info-container-top"> ' +
			                         '<div class="card-title title mt-3"> ' +
			                            '<h5>'+ data.pplace +'</h5> ' +
			                          '</div> ' +
			                          '<div class="card-title text-content mt-3"> ' +
			                            '<h5>제주</h5> ' +
			                          '</div> ' +
			                        '</div> ' +
			                        '<div class="info-container-top"> ' +
			                          '<p class="card-text title">작성인</p> ' +
			                          '<p class="card-text text-content">' + data.mnickname +'</p> ' +
			                        '</div> ' +
			                        '<div class="info-container-top"> ' +
			                         '<p class="card-text title">여행 소요 시간</p> ' +
			                          '<p class="card-text text-content"> '+ data.plt +' </p> ' +
			                        '</div> ' +
			                      '</div> ' +
			                    '</div> ' +
			                  '</div> ' +
			                '</div> '+
			              '</a> '
						
					} else if (select === 'trip'){
						appendData += 
							'<a> '+
				              '<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;"> '+
				                '<div class="row g-0"> '+
				                  '<div class="col-md-4"> '+
				                    '<img src="https://www.myro.co.kr/getSpotImage/jeju?no=1000" class="img-fluid rounded-start imgSize" alt="..."> '+
				                  '</div> '+
				                  '<div class="col-md-8"> '+
				                    '<div class="card-body"> '+
				                      '<i class="fa-sharp fa-solid fa-heart fa-lg" id="heartIcon"></i> '+
				                      '<div class="info-container-top"> '+
				                        '<div class="card-title title mt-3"> '+
				                          '<h5>명소명</h5> '+
				                        '</div> '+
				                        '<div class="card-title text-content mt-3"> '+
				                          '<h5>'+data.destSubject+'</h5> '+
				                        '</div> '+
				                      '</div> '+
				                      '<div class="info-container-top"> '+
				                        '<p class="card-text title">도시명</p> '+
				                        '<p class="card-text text-content">'+data.destCategory+'</p> '+
				                      '</div> '+
				                      '<div class="info-container-top"> '+
				                        '<p class="card-text title">주소</p> '+
				                        '<p class="card-text text-content">'+data.destAddress+'</p> '+
				                      '</div> '+
				                    '</div> '+
				                  '</div> '+
				                '</div> '+
				              '</div> '+
				            '</a> '
					} else {
						
						appendData += 
						'<a> '+
				           '<div class="card mt-4 mb-2 commentCard" style="max-width: 900px;"> '+
			              '<div> '+
			                '<div class="card-body"> '+
			                  '<div class="destination"> '+
			                    '<h4 class="card-title">'+data.destSubject+'</h4> '+
			                    '<span class="separator">|</span> '+
			                    '<h5 class="card-area">'+data.destCategory+'</h5> '+
			                  '</div> '+
			                  '<p class="card-text">'+data.commentsContent+'</p> '+
			                  
			                  '<p class="card-text"><small class="text-muted">'+ data.commentsCreateDateSt+ '(수정일 : '+data.commentsUpdateDateSt +'  ) </small></p> '+
			                  '<div class="card-btns"> '+
			                    '<button type="button" class="btn btn-warning" onclick="">수정</button> '+
			                    '<button type="button" class="btn btn-secondary">삭제</button> '+
			                  '</div> '+
			                '</div> '+
			              '</div> '+
			            '</div> '+
			            '</a> '
					}
				} // 반복문 끝
				
				if(select == 'planner'){
					$("#appendPlan").append(appendData);
				} else if (select == 'trip'){
					$("#appendTrip").append(appendData);
				} else {
					$("#appendComment").append(appendData);
				}
				
					
				//document.getElementById("text").innerHTML = result;
			}
		}); 
	} 
		
	
	</script>