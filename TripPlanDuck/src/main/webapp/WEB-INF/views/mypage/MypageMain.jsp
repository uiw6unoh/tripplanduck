<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy.MM.dd HH:mm" var="now" />

<jsp:include page="../common/header.jsp" />

<!-- MyPage CSS -->
<link rel="stylesheet" type="text/css" href="${ path }/css/mypage/Mypage.css">
<!-- fontawesome CSS -->
<script src="https://kit.fontawesome.com/f8167db045.js" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- sweetalert2 alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
					<div class="pt-1 nickName">${member.memberNickname }</div>
				</div>
				<div class="py-4 px-2 btn-UserMypageMenu">
					<button class="btn btn-outline-warning btn-sm btn-block btn-updateForm"
						data-toggle="modal" data-target="#changeUserInfo">회원정보수정</button>
				</div>
			</div>
		</div>
		<!-- 탭 메뉴 컨테이너 -->
		<div class="nav-container">
		<nav>
			<div id="horizontal-underline"></div>
			<ul class="nav justify-content-center">
				<li class="mr-4 nav-item">
					<button type="button" class="nav-link"
						onclick="location.href='${path}/mypage?select=planner'">
						내 플래너
					</button>
				</li>
				<li class="mr-4 nav-item">
					<button type="button" class="nav-link"
						onclick="location.href='${path}/mypage?select=trip'">
						내 여행지
					</button>
				</li>
				<li class="mr-4 nav-item">
					<button type="button" class="nav-link"
						onclick="location.href='${path}/mypage?select=comment'">
						나의 리뷰
					</button>
				</li>
			</ul>
		</div>
		</nav>

		<!-- 하위 컨테이너 -->
		<div class="content-container">
			<!-- 내 플래너 -->
			<c:if test="${myPlannerFirst ne null}">
				<c:set var="plan" value="${myPlannerFirst}" />

				<div id="likePlan">
					<h3 class="section-title">내 플래너</h3>
					<div id="text"></div>
					<!-- 내 플래너 카드 -->
					<a>
						<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img
										src="${ path }/images/trip/${plan.getLoc().getLocationImage()}"
										class="img-fluid rounded-start imgSize" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<div class="info-container-top">
											<div class="card-title title mt-3">
												<h5>여행지</h5>
											</div>
											<div class="card-title text-content mt-3">
												<h5>${plan.getLoc().getLocation()}</h5>
											</div>
											<div class="plannerCard-btns">
												<button type="button" class="btn btn-secondary btn-plannerDelete"
													onclick="delPlan(${plan.getPNo()})">삭제</button>
											</div>
										</div>
										<div class="info-container-top">
											<p class="card-text title">여행 일자</p>
											<p class="card-text text-content">${plan.getDemo()}</p>
										</div>
										<div class="route">
											<span class="card-text title planRouteTitle">코스</span>
											<span class="card-text text-content planRoute">${plan.getRoute()}</span>
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
			<c:if test="${planIsEmpty}">
				<div class="empty">
					<div class="empty">
						<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;">
							<a href="${ path }/planner/myplanner">
							  <div class="row g-0"> 
							   <div class="col-md-4">
								 <div class="plannerNodata"> 
								   <img class="nodataImg" alt="nodata" src="${path}/images/mypage/덕덕이(풀샷).png">
								   <div style="font-size: 1.2rem;">덕덕이와 플래너 만들어요 ~</div>
								 </div>
								   </div>
								</div>
								</a>
							</div> 
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
						<select name="selectBox" id="selectBox"
							onchange="changeOption(this.value)" style="width: 146px;"
							class="form-control">
							<c:forEach var="options" items="${options}" varStatus="i">
					 			<option value="${options.locationId}">${options.location}</option>
							</c:forEach>
							<option value="999" selected>전체</option>
							<option value="0">여행지 선택</option>
						</select>
					</div>
					<!-- 여행지 카드 -->
					<div id="shiftTrip">
						<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;">
							<div class="row g-0">
								<div class="col-md-4">
									<a href="${path}/trip/detail?destNo=${trip.getDestNo()}"> <img
										src="${trip.getDestImage()}"
										class="img-fluid rounded-start imgSize" alt="...">
									</a>
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<input type="hidden" class="tripCardUId"
											value="${trip.getDestNo()}"> <i
											class="fa-sharp fa-solid  fa-heart fa-2x heartIcon"
											onclick="unLike(${trip.getDestNo()})"></i>

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
										<div class="destAddress">
											<span class="card-text title">주소</span>
											<span class="card-text text-content">${trip.getDestAddress()}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!--  ajax로 불러온 데이터가 추가되는 곳 -->
					<div id="appendTrip"></div>

					<div class="wrap-downChevron">
						<abbr title="더보기"> <img class="down-chevron"
							alt="trip-down" src="${ path }/images/mypage/down-chevron.png">
						</abbr>
					</div>
				</div>
			</c:if>
			<c:if test="${tripIsEmpty}">
				<div class="empty">
					<div class="empty">
						<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;">
							<a href="'+ path+ '/trip/main">
							  <div class="row g-0"> 
							   <div class="col-md-4">
								 <div class=nodata> 
								   <img class="nodataImg" alt="nodata" src="${path}/images/mypage/덕덕이(풀샷).png">
								   <h5>덕덕이와 함께 떠나봐요🛫</h5>
								 </div>
								   </div>
								</div>
								</a>
							</div> 
					</div>
				</div>
			</c:if>
			<!-- comment -->
			<c:if test="${commentFirst ne null}">
				<c:set var="comments" value="${commentFirst}" />
				<div id="myComment">
					<!-- comment 카드 시작 -->
					<h3 class="section-title">나의 리뷰</h3>
					<div class="card mt-4 mb-2 commentCard" style="max-width: 900px;">
						<div>
							<div class="commentStar-rating">
								<span class="star">★</span>
								<h5 class="commentsRating">${comments.getCommentsRating()}</h5>
							</div>
							<div class="commentCard-body">
								<div class="destination">
									<h4 class="card-title">${comments.getDestSubject()}</h4>
									<span class="separator">|</span>
									<h5 class="card-area">${comments.getDestCategory()}</h5>
								</div>
								<p class="card-text commentContent">${comments.getCommentsContent()}</p>
								<div class="card-btns">
									<button class="btn btn-outline-warning"
										data-toggle="modal"
										onclick="updateSet(${comments.getCommentsId()})"
										name="${comments.getCommentsId()}"
										data-target="#updateBackdrop">수정</button>
									<button type="button" class="btn btn-secondary"
										onclick="delReview(true, ${comments.getCommentsId()})">삭제</button>
								</div>
								<p class="card-text commentDate">
									<small class="text-muted">${comments.getCommentsCreateDate()} (수정일
										: ${comments.getCommentsUpdateDate()})</small>
								</p>
								<input type="hidden"
									id="hideCmtContent${comments.getCommentsId()}"
									value="${comments.getCommentsContent()}"/> 
								<input
									type="hidden" id="hideCmtRating${comments.getCommentsId()}"
									value="${comments.getCommentsRating()}"/>
								<input type="hidden"
									id="hideCmtDest${comments.getCommentsId()}"
									value="${comments.getDestNo()}"/> 	
							</div>
						</div>
					</div>

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
			<c:if test="${commentIsEmpty}">
				<div class="empty">
					<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;">
		                  <div class="row g-0"> 
		                   <div class="col-md-4">
		                     <div class=nodata> 
							   <img class="nodataImg" alt="nodata" src="${path}/images/mypage/덕덕이(풀샷).png">
							   <h5>작성된 리뷰가 없어요 텅~</h5>
						     </div>
	                   		</div>
	                  	  </div>
	                	</div> 
				</div>
			</c:if>

			<!-- 비밀번호 확인 모달 -->
			<div class="modal fade" id="changeUserInfo" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header pwdCheckModal">
							<h5 class="modal-title" id="exampleModalLabel">비밀번호 재확인</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="password" id="inputPwdModal" class="inputPwd"
								placeholder="비밀번호 입력">
						</div>
						<div class="modal-footer">
							<div id="modal-msg-wrap"></div>
							<div id="modal-btn-wrap">
								<button type="button" class="btn btn-outline-warning"
									onclick="confirmPW()">확인</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 리뷰 수정 모달 -->
			<div class="modal fade" id="updateBackdrop" data-backdrop="static"
				data-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">리뷰 수정</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<input type="hidden" id="commentsId" />
						</div>
						<div class="modal-body">
							<form class="mb-2 " id="commentForm2">
								<div class="star-rating space-x-4 mx-auto">
									<input type="radio" id="5-stars2" name="rating2" value="5"
										v-model="ratings" /> <label for="5-stars2" class="star">★</label>
									<input type="radio" id="4-stars2" name="rating2" value="4"
										v-model="ratings" /> <label for="4-stars2" class="star">★</label>
									<input type="radio" id="3-stars2" name="rating2" value="3"
										v-model="ratings" /> <label for="3-stars2" class="star">★</label>
									<input type="radio" id="2-stars2" name="rating2" value="2"
										v-model="ratings" /> <label for="2-stars2" class="star">★</label>
									<input type="radio" id="1-star2" name="rating2" value="1"
										v-model="ratings" /> <label for="1-star2" class="star">★</label>
								</div>
								<p class="pt-1" style="font-size: 0.9em;">별점을 선택해주세요</p>
								<textarea id="commentsContent2" class="modalForm-control shadow-none"
									rows="3" placeholder="리뷰를 남겨주세요" style="resize: none;"></textarea>
								<p class="mt-1 col p-0" style="font-size: 11px;">
									<c:out value="${now}" />
								</p>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" id="updateAlert commentUpdate" onclick="updateComment()"
								class="btn btn-outline-warning">확인</button>
							<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
						</div>
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
		console.log("changeOption", e)
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
		var path ='${ pageContext.request.contextPath }'
		// 플랜 혹은 리뷰 카드일 경우
		if(select !== 'trip' && locationId == undefined){
			// 더보기를 통해 새로 불러오는 데이터  
			var offset = 1
			
			// 기본값 전체보기
			locationId = 999
			
			// 어떤 카드에서 더보기를 클릭했는지 기억하기 위하여 카드 이름을 리스트에 저장 
			selected += select;
			
			// 해당 리스트에 방금 선택한 카드 이름이 몇 번 저장되어있는지 count
			var matchReg = new RegExp(select,"g");
			var test = selected.match(matchReg)
			
			sameCnt = test.length
			console.log('동일 카드 더보기 누른 횟수:'+ sameCnt)
			
			offset = test.length
					
		}else {
			// 여행 카드일 경우
			
			// 여행 카드는 옵션이 있기 때문에 offset 따로 분류되므로 초기화
			var offset = 0 
			
			// 만약 로케이션 옵션값을 한번도 만지지 않았을 경우 로케이션은 디폴트 값인 전체로 설정
			if(locationId == undefined && locSelected.length == 0){
				locationId = 999  //기본값 전체보기
				
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
				console.log(result.data)
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
			                      '<img src="' +path +'/images/trip/'+ data.loc.locationImage+'" class="img-fluid rounded-start imgSize" alt="..."> ' +
			                    '</div> ' +
			                    '<div class="col-md-8"> '+
			                      '<div class="card-body"> '+
			                        '<div class="info-container-top"> ' +
			                          '<div class="card-title title mt-3"> ' +
			                            '<h5>여행지</h5> ' +
			                          '</div> ' +
			                          '<div class="card-title text-content mt-3"> ' +
			                            '<h5>'+ data.loc.location+'</h5> ' +
			                          '</div> ' +
									  '<div class="plannerCard-btns"> '+
										'<button type="button" class="btn btn-secondary btn-plannerDelete" '+
										'onclick="delPlan('+ data.pno +')">삭제</button> '+
									  '</div>' +
			                        '</div> ' +
			                        '<div class="info-container-top"> ' +
									  '<p class="card-text title">여행 일자</p> ' +
									  '<p class="card-text text-content"> ' + data.demo +' </p> ' +
								    '</div> ' +									
			                        '<div class="route"> ' +
			                          '<span class="card-text title">코스</span> ' +
			                          '<span class="card-text text-content"> '+ data.route +' </span> ' +
			                        '</div> ' +
									'</div> ' +
			                    '</div> ' +
			                  '</div> ' +
			                '</div> '+
			              '</a> '
						
					} else if (select === 'trip'){
						appendData += 
				              '<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;"> '+
				                '<div class="row g-0"> '+
				                  '<div class="col-md-4"> '+
				                  '<a href="'+ path+ '/trip/detail?destNo='+ data.destNo + '"> '+
				                    '<img src="'+data.destImage +'" class="img-fluid rounded-start imgSize" alt="..."> '+
				                    '</a> '+
				                  '</div> '+
				                  '<div class="col-md-8"> '+
				                    '<div class="card-body"> '+
				                      '<i class="fa-sharp fa-solid  fa-heart fa-2x heartIcon" onclick="unLike('+data.destNo+')" ></i> '+
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
				                      '<div class="destAddress"> '+
				                        '<span class="card-text title">주소</span> '+
				                        '<span class="card-text text-content">'+data.destAddress+'</span> '+
				                      '</div> '+
				                    '</div> '+
				                  '</div> '+
				                '</div> '+
				              '</div> '
				              
					} else {
						appendData += 
				         '<div class="card mt-4 mb-2 commentCard" style="max-width: 900px;"> '+
			              '<div> '+
							'<div class="commentStar-rating"> ' +
							  '<span class="star">★</span> ' +
							  '<h5 class="commentsRating">'+data.commentsRating+'</h5> ' +
							'</div> ' +
			                '<div class="commentCard-body"> '+
			                  '<div class="destination"> '+
			                    '<h4 class="card-title">'+data.destSubject+'</h4> '+
			                    '<span class="separator">|</span> '+
			                    '<h5 class="card-area">'+data.destCategory+'</h5> '+
			                  '</div> '+
			                  '<p class="card-text commentContent">'+data.commentsContent+'</p> '+
			                  '<div class="card-btns"> '+
			                  '<button class="btn btn-outline-warning" data-toggle="modal" '+
									'onclick="updateSet('+ data.commentsId +')" '+
									'name="'+data.commentsId+'" data-target="#updateBackdrop">수정</button> '+
			                    '<button type="button" class="btn btn-secondary" onclick="delReview(false, '+data.commentsId+')">삭제</button> '+
			                  '</div> '+
			                  '<p class="card-text commentDate"><small class="text-muted">'+ data.commentsCreateDate+ ' (수정일 : '+data.commentsUpdateDate +'  ) </small></p> '+
			                  '<input type="hidden" id="hideCmtContent'+ data.commentsId +'" value="'+ data.commentsContent +'"/> ' +  
			                  '<input type="hidden" id="hideCmtRating'+ data.commentsId +'" value="'+ data.commentsRating +'"/> ' +
			                  '<input type="hidden" id="hideCmtDest'+ data.commentsId +'" value="'+ data.destNo +'"/> ' +
			                '</div> '+
			              '</div> '+
			             '</div> '
					}
				} // 반복문 끝
				
				// 여행의 경우에만 옵션 값이 있으며
				// 지역 옵션 값에 따라 카드 내 데이터가 바뀌는 형식이므로 
				// 여행 데이터가 없을 경우
				// 다른 카드와는 달리 카드 내에 '데이터 없음' 보여줌 
				if(select == 'trip' && result.data.length == 0){
					appendData =   
						'<div class="card mt-4 mb-3 likeCard" style="max-width: 800px;"> ' +
						'<a href="'+ path+ '/trip/main"> '+
		                  '<div class="row g-0"> ' + 
		                   '<div class="col-md-4"> ' +
		                     '<div class=nodata> ' +
							   '<img class="nodataImg" alt="nodata" src="${path}/images/mypage/덕덕이(풀샷).png"> ' +
							   '<h5>덕덕이와 함께 떠나봐요🛫</h5>' +
						     '</div> '+
	                   	    '</div> '+
	                  	  '</div> '+
	                  	  '</a> '+
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
		
	/* 좋아요 해제 기능 */
	function unLike(e){
		$.ajax({
			url : "mypage/trip/unlike?no="+e,
			type : "get",
			//dataType : "json",
			success : function(result){
				alert('좋아요가 해제되었습니다.')
				sendReq("trip");
			}
		})	
	}
	
	/* 리뷰 삭제 기능 */
	function delReview(isFirst, e){
		var confirm = window.confirm('해당 리뷰를 삭제하시겠습니까?');
		if(confirm){
		
			 $.ajax({
					url : "mypage/review/delete?no="+e,
					type : "get",
					success : function(result){
						alert('리뷰가 삭제되었습니다.')
						location.reload()
						
						// ajax를 통해 가져온 데이터 삭제시, 다시 sendReq(ajax)를 통해 데이터를 리로드 시켜주려했으나 
						// 더보기를 누른 횟수만큼 offset을 설정해주는 기능때문에 
						// 가져오고자하는 데이터의 offset보다 높은 숫자로 요청 감
						// 컨트롤러에게 응답 받은 데이터를 가지고 화면에 그려주는 방식이 다르므로 달리 처리함 
					 	if(isFirst){
					 		// model에 담긴 데이터를 삭제했을 경우(= 나의 리뷰에서 최초로 뜨는 데이터를 삭제했을 경우 )
					 		location.reload()
					 		 
						} else {
							// ajax를 통해 불러온 데이터에서 삭제했을 경우 (= 더보기를 통해 가져온 데이터를 삭제했을 경우)
							$("#appendComment").html("");
							sendReq('comment')
						} 
						
					}, error : function(result){
						alert('데이터 삭제에 실패하였습니다. 잠시후 다시 시도해주세요')
					}
				})	 
		}
	}
	
		/* 플랜 삭제 기능 */
		function delPlan(e){
	
		 	var confirm = window.confirm('해당 플랜을 삭제하시겠습니까?');
			
			if(confirm){
				 $.ajax({
						url : "mypage/plan/delete?no="+e,
						type : "get",
						success : function(result){
							alert('플랜이 삭제되었습니다.')
								location.reload()
							
						}, error : function(result){
							alert('데이터 삭제에 실패하였습니다. 잠시후 다시 시도해주세요')
						}
					})	 
			}	 
	 
			
	}
	
	/* 비밀번호 확인 모달 */
	function confirmPW(){
		var pw = $('.inputPwd').val();
		var data ={
				password : pw
			}
		
		$.ajax({
				url : "mypage/confirm/password",
				dataType : "text",
				data : data,
				type : "post",
				success : function(result){
					console.log(result)
					if(result === 'failed'){
						var appendmsg = '<span class="error-msg">비밀번호가 일치하지 않습니다</span>';
						$('#modal-msg-wrap').html("")
						$('#modal-msg-wrap').append(appendmsg)
					}else {
						location.href = '${path}/mypage/updateform';
					}
					
				}, error : function(result){
					alert('오류가 발생했습니다. 잠시 후 다시 시도해주세요.')
				}
			})	
	}	
		
	
	
	/* 리뷰 수정 */
	
	/* 	리뷰 수정 시 임의의 엘리먼트에 수정할 리뷰 값 할당 */
	function updateSet(commentsId){
		$("#commentsId").val(commentsId)
		
		let rating = $("#hideCmtRating" + commentsId).val()
		$("input[name='rating2'][value=" + rating + "]").prop("checked", true);
	 	
		let content = $("#hideCmtContent" + commentsId).val()
		$("#commentsContent2").val(content)
		
	}

	
	function updateComment() {
		// 앞서 할당했던 엘리먼트에서 값 꺼내기
	  	let rating = $('input[name=rating2]:checked').val();
	  	let comment = $("#commentsContent2").val();
	    let commentsId = $("#commentsId").val();
	    let destNo = $("#hideCmtDest" + commentsId).val()
	  	
	    console.log("rating : ", rating);
	    console.log("comment : ", comment);
	    console.log("commentsId : ", commentsId);
	    console.log("destNo : ", destNo);
	    
		if(rating == null || rating == "" || comment == "" || comment == null){
		   Swal.fire({
			  icon: "error",
			  title: `실패!`,
			  text: '별점 혹은 내용을 입력해주세요.',
			  confirmButtonText: "확인",
			  //closeOnClickOutside : false
		 })
		     return;
		}
		   	
	    Swal.fire({
	      icon: "warning",
	      title: "댓글수정",
	      text: `댓글을 수정 하시겠습니까?`,
	      showCancelButton: true,
	      confirmButtonText: "수정",
	      cancelButtonText: "취소",
		 //closeOnClickOutside : false

	    }).then(function (result) {
	    	console.log(result)
	      if (result.isConfirmed) {
	        //수정 요청 처리
	        
	        let data = {
	  		'commentsRating' : rating, 
	   		'commentsContent' : comment,
	   		'commentsId' : commentsId,
	  		'destNo' : destNo
	 		  };
	        
	        console.log("data : ", data)
	        $.ajax({
				url : "${path}/trip/api/comment",
				type : "PUT",
				data		:  JSON.stringify(data), 
		        contentType : "application/json",
				dataType : "json",
				success: function(data) {
					 Swal.fire({
					      icon: "success",
					      title: "수정 완료",
					      text: `댓글 수정이 완료되었습니다`,
					      showCancelButton: false,
					      confirmButtonText: "확인",

					}).then(function (result) {
					    if(result.isConfirmed){
					    location.reload()	
					   } 
					});
				},
				error: function(error) {
					
				}
			})
			
	        
	      } else {
	        //취소
	      }
	    });
	  };

	</script>