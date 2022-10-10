<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="../common/header.jsp"/>
  <!-- MyPage CSS -->
  <link rel="stylesheet" type="text/css" href="${ path }/css/mypage/Mypage.css">

  <!-- fontawesome CSS -->
  <script src="https://kit.fontawesome.com/f8167db045.js" crossorigin="anonymous"></script>
<body>
	<!-- Mypage 시작 -->
    <!-- 전체 컨테이너 -->
    <div class="container">
      <!-- 상위 컨테이너 -->
        <div class="p-5 top-container">
          <div class="userMypageMenu">
            <div class="userInfo">
              <img src="${ path }/images/common/프사.png" alt="profile" style="width: 100px; height: 100px; border-radius: 50%;">
              <div class="pt-1 nickName">닉네임</div>
            </div>
            <div class="py-4 px-2 btn-UserMypageMenu">
              <button class="btn btn-outline-warning btn-sm btn-block">내 위드덕</button>
              <button class="btn btn-outline-warning btn-sm btn-block" data-toggle="modal"
                data-target="#changeUserInfo">회원정보수정</button>
            </div>
          </div>
        </div>

        <!-- 탭 메뉴 컨테이너 -->
        <div class="nav-container">
          <div id="horizontal-underline"></div>
          <ul class="nav justify-content-center">
            <li class="mr-4 nav-item">
              <button type="button" class="nav-link" onclick="location.href='/mypage?select=planner&memberId=${ memberId }'">Like Plan</button>
            </li>
            <li class="mr-4 nav-item">
              <button type="button" class="nav-link" onclick="location.href='/mypage?select=trip&memberId=${ memberId }'">내 여행지</button>
            </li>
            <li class="mr-4 nav-item">
              <button type="button" class="nav-link" onclick="location.href='/mypage?select=comment&memberId=${ memberId }'">나의 리뷰</button>
            </li>
          </ul>
        </div>

        <!-- 하위 컨테이너 -->
        <div class="content-container">
          <!-- Like Plan -->

            <div id="likePlan">
              <h3 class="section-title">Like Plan</h3>
              <!-- Like Plan 카드 -->
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
            </div>
        
          <!-- 내 여행지 -->
        
          <div id="myPlanner">
            <h3 class="section-title">내 여행지</h3>
              <!-- 여행지 필터 -->
            <div>
              <select class="form-control">
                <option>여행지 선택</option>
                <option>제주</option>
              </select>
            </div>
            <!-- 여행지 카드 -->
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
                    <h4 class="card-title">성산 일출봉</h4>
                    <span class="separator">|</span>
                    <h5 class="card-area">제주</h5>
                  </div>
                  <p class="card-text">아름다웠어요</p>
                  <p class="card-text"><small class="text-muted">2022-09-25</small></p>
                  <div class="card-btns">
                    <button type="button" class="btn btn-warning" onclick="location.href=''">수정</button>
                    <button type="button" class="btn btn-secondary">삭제</button>
                  </div>
                </div>
              </div>
            </div>
            </a>

        <!-- 더보기 -->
        <div class="wrap-downChevron">
          <abbr title="더보기">
            <img class="down-chevron" src="${ path }/images/mypage/down-chevron.png">
          </abbr>
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
              <input type="text" class="inputPwd" placeholder="비밀번호 입력">
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
              <button type="button" class="btn btn-outline-warning"
                onclick="location.href='UpdateForm.html'">확인</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
    <!-- MyPage JS -->
    <!-- 
    	<script src="../../JS/Mypage/MypageMain.js"></script>
    -->