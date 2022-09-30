<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="../common/header.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동행인 찾기</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <!-- mainstyle CSS -->
    <link rel="stylesheet" href="${path }/resources/css/common/style.css" type="text/css" />
    <link rel="stylesheet" href="${path }/resources/css/common/font-icons.css" type="text/css" />
    
    <!-- WithDuck CSS-->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/withduck/ListWithDuck.css">
</head>

<body class="stretched">
<section class="zone1">
<div class="img_textContainer">
    <p class="img_text">동행인 찾기</p>
</div>
</section>

<section class="zone2">
<div class="filter">
    <div class="filter_container">
        <div class="filter_location" style="display: flex !important; justify-content: center;
        align-items: center;  border-bottom: 1px solid #a7a2a28f; height: 101.6px;">지역</div>
        <div class="filter_gender" style="display: flex !important; justify-content: center;
        align-items: center;  border-bottom: 1px solid #a7a2a28f; height: 50.8px;">희망성별</div>
        <div class="filter_age" style="display: flex !important; justify-content: center;
        align-items: center;  border-bottom: 1px solid #a7a2a28f; height: 50.8px;">연령대</div>
        <div class="filter_personel" style="display: flex !important; justify-content: center;
        align-items: center;  border-bottom: 1px solid #a7a2a28f; height: 50.8px;">인원</div>
        <div class="filter_personel" style="display: flex !important; justify-content: center;
        align-items: center; height: 53.8px;">날짜</div>
    </div>

    <div class="filter_containerValue">
                <div class="location_value" style="border-bottom: 0;">
                    <div><button class="location_btn">서울특별시</button></div>
                    <div><button class="location_btn">부산광역시</button></div>
                    <div><button class="location_btn">인천광역시</button></div>
                    <div><button class="location_btn">광주광역시</button></div>
                    <div><button class="location_btn">대전광역시</button></div>
                    <div><button class="location_btn">대구광역시</button></div>

                </div>

                <div class="location_value">
                    <div><button class="location_btn">강원도</button></div>
                    <div><button class="location_btn">제주도</button></div>
                    <div><button class="location_btn">경기도</button></div>
                    <div><button class="location_btn">충청도</button></div>
                    <div><button class="location_btn">경상도</button></div>
                    <div><button class="location_btn">전라도</button></div>
                </div>

                <div class="gender_value">
                    <button class="gender_btn">남자</button>
                    <button class="gender_btn">여자</button>
                    <button class="gender_btn">성별무관</button>
                </div>

                <div class="age_value">
                    <button class="age_btn">~20대</button>
                    <button class="age_btn">30대</button>
                    <button class="age_btn">40대</button>
                    <button class="age_btn">50대 이상</button>
                </div>

                <label for="customRange2" class="form-label"></label>
                <div style="display: flex; align-items: center; justify-content: center; position: relative; bottom: 20px; height: 50.8px;     border-bottom: 1px solid #a7a2a28f ;">
                    <input type="range" class="form-range" min="0" step="1" max="20" id="customRange2" oninput="document.getElementById('value2').innerHTML=this.value+'명';">
                    <span id="value2" style="position:relative; left:5px; bottom:2px; display: inline-block; width: 40px;">10명</span>
                    
                </div>
                <div class="date_container">
                    <div class="start_container">
                        <label for="start">출발일:</label>
    
                        <input type="date" id="start" name="trip-start"
                            value="2018-07-22"
                            min="2018-01-01" max="2018-12-31" style="margin-left:10px;">
                    </div>
                    <div class="end_container">
                        <label for="start">도착일:</label>
            
                        <input type="date" id="end" name="trip-end"
                            value="2018-07-22"
                            min="2018-01-01" max="2018-12-31" style="margin-left:10px;">
                    </div>
                </div>
    </div>
</div>

        <div class="btn filter-btn">
            <button class="btn btn-outline-warning" type="button" >
            필터 검색
            </button>
    
            <button class="btn btn-outline-warning" type="button" >
            필터 초기화
            </button>
        </div>
        <div style="text-align: center; position: relative; left: 470px; top: 36px; display: inline-block; padding: 0px;">
            <a href="">
                <img src="${path}/resources/images/WithDuck/airplane.gif" width="90px" alt="">
                <p style="font-weight: bold;">CREATE WITHDUCK</p> 
            </a>
        </div>
    </section>
    <section class="zone3">
        <div class="container">
            <div class="sort" style="text-align: right;">
                <div class="dropdown d-flex justify-content-end" style="width: 100px; position:relative; top: 35px; left: 850px">
                    <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    최신순  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                        <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                    </svg>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton1" >
                    <li><a class="dropdown-item" href="#">최신순</a></li>
                    <li><a class="dropdown-item" href="#">조회순</a></li>
                    </ul>
                </div>
                <!-- <input type="radio" name="radio" id="" value="최신순" checked>최신순
                <input type="radio" name="radio" id="" value="조회순">조회순 -->
                <button class="btn btn-outline-warning" style="width: 150px; background-color: #a7a2a23b; border: 0; font-weight: bold; border-radius: 30px;">모집중인 글만 보기</button>
            </div>
            <div class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3">
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="${path}/resources/images/WithDuck/flower1.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="${path}/resources/images/Common/프사.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="${path}/resources/images/WithDuck/flower1.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="${path}/resources/images/Common/프사.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="${path}/resources/images/WithDuck/river1.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="${path}/resources/images/Common/프사.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="${path}/resources/images/WithDuck/tower1.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="${path}/resources/images/Common/프사.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div> 
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="${path}/resources/images/WithDuck/tower1.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="${path}/resources/images/Common/프사.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div> 
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="${path}/resources/images/WithDuck/flower3.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="${path}/resources/images/Common/프사.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div> 
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="${path}/resources/images/WithDuck/flower4.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="${path}/resources/images/Common/프사.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="${path}/resources/images/WithDuck/flower4.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="${path}/resources/images/Common/프사.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div>
            </div>
        </div>
        <nav aria-label="..." style="margin-top: 50px;">
            <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <span class="page-link">이전</span>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item active" aria-current="page">
                <span class="page-link">2</span>
            </li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item">
                <a class="page-link" href="#">다음</a>
            </li>
            </ul>
        </nav>
    </section>
    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!--jQuery-->
    <script src="${path }/resources/js/common/jquery-3.6.0.min.js"></script>

    <!-- JavaScripts -->
    <script src="${path }/resources/js/common/plugins.min.js"></script>
    <script src="${path }/resources/js/common/functions.js"></script>

</body>
<jsp:include page="../common/footer.jsp"/>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
$('.location_btn').on('click', function(){
    $('.location_btn').removeClass('selected');
    $(this).addClass('selected');
});
$('.gender_btn').on('click', function(){
    $('.gender_btn').removeClass('selected');
    $(this).addClass('selected');
});
$('.age_btn').on('click', function(){
    $('.age_btn').removeClass('selected');
    $(this).addClass('selected');
});

document.querySelector('.form-range').addEventListener('input',function(event){
    var gradient_value = 100 / event.target.attributes.max.value;
  event.target.style.background = 'linear-gradient(to right, #FFE283 0%, #FFE283 '+gradient_value * event.target.value +'%, rgb(236, 236, 236) ' +gradient_value *  event.target.value + '%, rgb(236, 236, 236) 100%)';
});
</script>