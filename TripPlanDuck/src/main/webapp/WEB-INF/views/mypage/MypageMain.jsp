<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
						onclick="location.href='${path}/mypage?select=planner'">Like
						Plan</button>
				</li>
				<li class="mr-4 nav-item">
					<button type="button" class="nav-link"
						onclick="location.href='${path}/mypage?select=trip'">내
						여행지</button>
				</li>
				<li class="mr-4 nav-item">
					<button type="button" class="nav-link"
						onclick="location.href='${path}/mypage?select=comment'">나의
						리뷰</button>
				</li>
			</ul>
		</div>

		<!-- 하위 컨테이너 -->
		<div class="content-container">
			<!-- Like Plan -->
			<%-- 테스트 데이터 --%>
			<c:if test="${myPlannerFirst ne null}">
			<c:set var="plan" value="${myPlannerFirst}" />
			
			<div id="likePlan">
				<h3 class="section-title">Like Plan</h3>
				<div id="text"></div>
				<!-- Like Plan 카드 -->
				<a>
					<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="${plan.getDestImg()}"
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
											<h5>${plan.getPPlace()}</h5>
										</div>
									</div>
								
									<div class="info-container-top">
										<p class="card-text title">작성인</p>
										<p class="card-text text-content">${plan.getMNickname()}</p>
									</div>
									<div class="info-container-top">
										<p class="card-text title">여행 소요 시간</p>
										<p class="card-text text-content">${plan.getPLt()}</p>
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
		
			</c:if>
			<!-- 내 여행지 -->
			<c:if test="${tripFirst ne null}">
			<c:set var="trip" value="${tripFirst}" />
			<div id="myPlanner">
				<h3 class="section-title">내 여행지</h3>
				<!-- 여행지 필터 -->
				<div>
				<select name="selectBox" id="selectBox" onchange="changeOption(this.value)" style="width:80px;" class="form-control">      
				<c:forEach var="options" items="${options}" varStatus="i">
					 <option value="${options.locationId}">${options.location}</option>
				</c:forEach>
				 <option value="0" selected>여행지 선택</option>
					</select>
				</div>
				<!-- 여행지 카드 -->
				<div id = "shiftTrip"> 
				<a>
					<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="${trip.getDestImage()}"
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
											<h5>${trip.getDestSubject()}</h5>
										</div>
									</div>
									<div class="info-container-top">
										<p class="card-text title">도시명</p>
										<p class="card-text text-content">${trip.getDestCategory()}</p>
									</div>
									<div class="info-container-top">
										<p class="card-text title">주소</p>
										<p class="card-text text-content">${trip.getDestAddress()}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</a>
				</div>

				<!--  ajax로 불러온 데이터가 추가되는 곳 -->
				<div id="appendTrip"></div>

				<div class="wrap-downChevron">
					<abbr title="더보기"> <img class="down-chevron" alt="trip-down"
						src="${ path }/images/mypage/down-chevron.png">
					</abbr>
				</div>
			</div>
			</c:if>

			<!-- comment -->
			<c:if test="${commentFirst ne null}">
			<c:set var="comments" value="${commentFirst}" />
			<div id="myComment">
				<!-- comment 카드 시작 -->
				<h3 class="section-title">나의 리뷰</h3>
				<a>
					<div class="card mt-4 mb-2 commentCard" style="max-width: 900px;">
						<div>
							<div class="card-body">
								<div class="destination">
									<h4 class="card-title">${comments.getDestSubject()}</h4>
									<span class="separator">|</span>
									<h5 class="card-area">${comments.getDestCategory()}</h5>
								</div>
								<p class="card-text">${comments.getCommentsContent()}</p>
								<p class="card-text">
									<small class="text-muted">${comments.getCommentsCreateDateSt()}(수정일 : ${comments.getCommentsUpdateDateSt()})</small>
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
			</c:if>

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
		
<script type="text/javascript">
	var selected = "";  
	var locSelected = [];
	var sameCnt = 0;
	
	// 옵션 값을 바꿀때 호출되는 함수
	function changeOption(e){
		 sendReq("trip", e);
	 }
	
	// 더보기 버튼 클릭시 호출, 더보기 버튼이 여러개이므로 for문 이용하였음
	document.querySelectorAll('.down-chevron').forEach((cell) => {
		// 클릭한 버튼이 어느 카드의 버튼인지 판별하기 위해 alt 프로퍼티를 추가하였고,
		// 해당 프로퍼티 내에는 카드의 이름이 들어감
		// 프로퍼티에서 꺼내온 카드 이름을 sendReq 함수의 파라미터로 넣어 호출한다 
	  cell.addEventListener('click', function() {
	    var select = cell.getAttribute('alt').replace('-down','')
	    sendReq(select);
	  });
	});
 
	
	// 더보기 버튼을 통한 ajax 통신 함수 
	function sendReq(select, locationId){
		
		
		// 플랜 혹은 리뷰 카드일 경우
		if(select !== 'trip' && locationId == undefined){
			// 더보기를 통해 새로 불러오는 데이터가  
			var offset = 1
			
			// 기본값
			locationId = 1
			
			// 어떤 카드에서 더보기를 클릭했는지 기억하기 위하여 카드 이름을 리스트에 저장 
			
			selected += select;
			
			// 해당 리스트에 방금 선택한 카드 이름이 몇번 저장되어있는지 count
			var matchReg = new RegExp(select,"g");
			var test = selected.match(matchReg)
			
			sameCnt = test.length
			console.log('동일 카드 더보기 누른 횟수:'+ sameCnt)
			
			offset = test.length
					
		}else {
			// 여행 카드일 경우
			
			// 여행 카드는 옵션이 있기 때문에 offset 따로 분류되므로 초기화
			var offset = 0 
			
			// 만약 로케이션 옵션값을 한번도 만지지 않았을 경우 로케이션은 디폴트 값인 서울로 설정
			if(locationId == undefined && locSelected.length == 0){
				locationId = 1
				
			} else if (locationId == undefined && locSelected.length > 0){
				// 로케이션 옵션값을 지정한 이후 더보기 버튼을 눌렀을 경우, 
				// 로케이션은 가장 마지막에(최근에) 누른 옵션값
				locationId = locSelected[locSelected.length-1]
			}
			
			// undefined값이 들어가는 것을 방지
			if(locationId !== undefined ){
				// 가장 마지막에 누른 옵션값을 기억해야하므로 리스트에 저장
				locSelected.push(locationId)
			}			
			
			// 동일 옵션값 더보기시 offset 증가 아닐 경우 offset 1로 초기화
			if(locSelected.includes(locationId)){
				for(let i=0; i < locSelected.length; i++) {
					  if(locSelected[i] === locationId)  {
					    offset++;
					  }
				}
			// 	
			}else{
				offset = 1;
			}
		}
		
		$.ajax({
			url : "/duck/mypage/ajax?select="+select+"&offset="+offset+"&locationId="+locationId,
			type : "get",
			dataType : "json",
			success : function(result){
				// html상에 추가해줄 데이터 
				var appendData = '';
				
				// 결과값이 리스트이므로 for문으로 접근
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
			                            '<h5>여행지</h5> ' +
			                          '</div> ' +
			                          '<div class="card-title text-content mt-3"> ' +
			                            '<h5>'+ data.pplace+'</h5> ' +
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
				                    '<img src="'+data.destImage +'" class="img-fluid rounded-start imgSize" alt="..."> '+
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
				
				// 여행의 경우에만 옵션 값이 있으며
				// 지역 옵션 값에 따라 카드 내 데이터가 바뀌는 형식이므로 
				// 여행 데이터가 없을 경우
				// 다른 카드와는 달리 카드 내에 '데이터 없음' 보여줌 
				if(select == 'trip' && result.data.length == 0){
					appendData =   
						'<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;"> ' +
		                  '<div class="row g-0"> ' + 
		                   '<div class="col-md-4"> ' +
	                   			'<h5>텅텅터ㅌㅇ텅ㅇ텅 ~!!!</h5>' +
	                   		'</div> '+
	                  	   '</div> '+
	                	'</div> '
				}
				
				
				// 각자 카드에서 요청한 더보기 ajax 리턴 값을 해당 카드 아래에 append
				if(select == 'planner'){
					$("#appendPlan").append(appendData);
					
				} else if (select == 'trip'){
					// 여행의 경우 옵션 값에 따라 바뀌므로 이전 값을 비워야함
					$("#shiftTrip").html("");
					$("#shiftTrip").append(appendData);
					
				} else {
					$("#appendComment").append(appendData);
				}
			}
		}); 
	} 
		
	
	</script>