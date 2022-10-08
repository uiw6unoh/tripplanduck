<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

	<jsp:include page="../common/header.jsp"/>
  
	<!-- MyPage CSS -->
	<link rel="stylesheet" type="text/css" href="${ path }/css/mypage/Mypage.css">
<body>
<!-- Mypage 시작 -->
    <!-- 전체 컨테이너 -->
    <div class="container">
        <!-- 상위 컨테이너 -->
        <div class="p-5 top-container">
            <div class="userMypageMenu">
                <div class="userInfo">
                    <img src="${ path }/images/common/프사.png" alt="profile" style="width: 100px; height: 100px; border-radius: 50%;">
                    <div class="pt-1 nickName">킹민주</div>
                </div>
                <div class="py-4 px-2 btn-UserMypageMenu">
                    <button class="btn btn-outline-warning btn-sm btn-block">내 위드덕</button>
                    <button class="btn btn-outline-warning btn-sm btn-block" data-toggle="modal" data-target="#changeUserInfo">회원정보수정</button>
                </div>
            </div>
            
        </div>

        <!-- 하위 메뉴 -->
        <div class="nav-container">
            <div id="horizontal-underline"></div>
            <ul class="nav justify-content-center">
                <li class="mr-4 nav-item">
                    <!-- <a class="nav-link" href="#likePlan">Like Plan</a> -->
                    <a class="nav-link" href="../Mypage/MypageLikePlan.html">Like Plan</a>
                </li>
                <li class="mr-4 nav-item">
                    <a class="nav-link" href="#myPlanner">내 여행지</a>
                </li>
                <li class="mr-4 nav-item">
                    <a class="nav-link" href="../Mypage/MypageComment.html#myComment">나의 리뷰</a>
                </li>
            </ul>
        </div>

        <div class="content-container">
            <div id="myPlanner">
                <h3 class="section-title">내 여행지</h3>
                    <!-- 여행지 필터 div -->
                    <div>
                      <select class="form-control">
                        <option>여행지 선택</option>
                        <option>제주</option>
                      </select>
                    </div>
                    <a>
                    <div class="card mt-4 mb-3 likeCard" style="max-width: 800px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="https://www.myro.co.kr/getSpotImage/jeju?no=1000" class="img-fluid rounded-start imgSize" alt="...">
                            </div>
                            <div class="col-md-8">
                              <div class="card-body">
                                  <i class="fa-sharp fa-solid fa-heart fa-lg" id="heartIcon"></i>
                                  <div class="info-container-top">
                                      <div class="card-title title mt-3">
                                        <h5>명소명</h5>
                                      </div>
                                      <div class="card-title text-content mt-3">
                                        <h5>협재해수욕장</h5>
                                      </div>
                                  </div>
                                  <div class="info-container-top">
                                      <p class="card-text title">도시명</p>
                                      <p class="card-text text-content">제주</p>
                                  </div>
                                  <div class="info-container-top">
                                      <p class="card-text title">주소</p>
                                      <p class="card-text text-content">제주특별자치도 제주시 한림읍 한림로 329-10</p>
                                  </div>
                              </div>
                          </div>
                        </div>
                    </div>
                    </a>
                    <div class="card mb-3 likeCard" style="max-width: 800px;">
                      <div class="row g-0">
                          <div class="col-md-4">
                              <img src="https://www.myro.co.kr/getSpotImage/jeju?no=1195" class="img-fluid rounded-start imgSize" alt="...">
                          </div>
                          <div class="col-md-8">
                              <div class="card-body">
                                  <i class="fa-sharp fa-solid fa-heart fa-lg" id="heartIcon"></i>
                                  <div class="info-container-top">
                                      <div class="card-title title mt-3">
                                        <h5>명소명</h5>
                                      </div>
                                      <div class="card-title text-content mt-3">
                                        <h5>협재해수욕장</h5>
                                      </div>
                                  </div>
                                  <div class="info-container-top">
                                      <p class="card-text title">도시명</p>
                                      <p class="card-text text-content">제주</p>
                                  </div>
                                  <div class="info-container-top">
                                      <p class="card-text title">주소</p>
                                      <p class="card-text text-content">제주특별자치도 제주시 한림읍 한림로 329-10</p>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                    <div class="card mb-3 likeCard" style="max-width: 800px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="https://www.myro.co.kr/getSpotImage/jeju?no=1195" class="img-fluid rounded-start imgSize" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <i class="fa-sharp fa-solid fa-heart fa-lg" id="heartIcon"></i>
                                    <div class="info-container-top">
                                        <div class="card-title title mt-3">
                                          <h5>명소명</h5>
                                        </div>
                                        <div class="card-title text-content mt-3">
                                          <h5>협재해수욕장</h5>
                                        </div>
                                    </div>
                                    <div class="info-container-top">
                                        <p class="card-text title">도시명</p>
                                        <p class="card-text text-content">제주</p>
                                    </div>
                                    <div class="info-container-top">
                                        <p class="card-text title">주소</p>
                                        <p class="card-text text-content">제주특별자치도 제주시 한림읍 한림로 329-10</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="wrap-downChevron">
              <img class="down-chevron" src="${ path }/images/mypage/down-chevron.png">
            </div>
          </div>
    </div>

    <!-- 비밀번호 확인 모달 -->
    <div class="modal fade" id="changeUserInfo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">비밀번호 재확인</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="text" style="width: 70%; height: 40px" placeholder="비밀번호 입력">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-outline-warning" onclick="location.href='UpdateForm.html'">확인</button>
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>

	<!-- MyPage JS -->
    <!-- 
    	<script src="../../JS/Mypage/MypageMain.js"></script>
    -->