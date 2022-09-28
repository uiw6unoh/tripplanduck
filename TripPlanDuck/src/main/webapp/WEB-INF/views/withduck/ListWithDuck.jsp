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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동행인 찾기</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/withduck/ListWithDuck.css">
</head>
<body>

<section class="zone1">
<div class="img_textContainer">
    <p class="img_text">동행인 찾기</p>
</div>
</section>
<section class="zone2">
<div class="go_withduck">
    <a href="">
        <img src="${path}/resources/images/WithDuck/go.png" alt="">
        <br>위드덕 생성하러 가기!
    </a>
</div>
<div class="filter">
    <div class="filter_container">
        <div class="filter_location">지역</div>
        <div class="filter_gender">희망성별</div>
        <div class="filter_personel">인원</div>
        <div class="filter_personel">날짜</div>
    </div>
    <div class="filter_containerValue">
        <div class="location_value">
               <!-- <div><a href="">서울</a></div>
                    <div><a href="">강원</a></div>
                    <div><a href="">제주</a></div>
                    <div><a href="">부산</a></div>
                    <div><a href="">경기</a></div>
                    <div><a href="">인천</a></div>
                    <div><a href="">충청</a></div>
                    <div><a href="">경상</a></div>
                    <div><a href="">전라</a></div> -->
                    
                    <div><button class="location_btn">서울</button></div>
                    <div><button class="location_btn">강원</button></div>
                    <div><button class="location_btn">제주</button></div>
                    <div><button class="location_btn">부산</button></div>
                    <div><button class="location_btn">경기</button></div>
                    <div><button class="location_btn">인천</button></div>
                    <div><button class="location_btn">충청</button></div>
                    <div><button class="location_btn">경상</button></div>
                    <div><button class="location_btn">전라</button></div>
                </div>
                <div class="gender_value">
                    <button class="gender_btn">남자만</button>
                    <button class="gender_btn">여자만</button>
                    <button class="gender_btn">성별무관</button>
                </div>
                <label for="customRange2" class="form-label"></label>
                <div>
                    <input type="range" class="form-range" min="0" step="1" max="20" id="customRange2" oninput="document.getElementById('value2').innerHTML=this.value;">
                    <span id="value2"></span>
                    명
                </div>
                <div class="date_container">
                    <div class="start_container">
                        <label for="start">Start date:</label>
    
                        <input type="date" id="start" name="trip-start"
                            value="2018-07-22"
                            min="2018-01-01" max="2018-12-31">
                    </div>
                    <div class="end_container">
                        <label for="start">End date:</label>
            
                        <input type="date" id="start" name="trip-start"
                            value="2018-07-22"
                            min="2018-01-01" max="2018-12-31">
                    </div>
                </div>
            </div>
        </div>
            <div class="filter-btn">
            <input name="query" type="text" class="form-control" aria-label="search" aria-describedby="button-addon2">
                <button class="btn favorite-styled" type="button">
                필터 검색
                </button>
        	<input name="query" type="text" class="form-control" aria-label="search" aria-describedby="button-addon2">
                <button class="btn favorite-styled" type="button">
                필터 초기화
                </button>
            </div>
    </section>
    <section class="zone3">
        <div class="container">
            <div class="sort" style="text-align: right;">
                <input type="radio" name="radio" id="" value="최신순" checked>최신순
                <input type="radio" name="radio" id="" value="조회순">조회순
                <button>모집중인 글만 보기</button>
            </div>
            <div class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3">
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="../../IMG/WithDuck/city1.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="../../IMG/WithDuck/man (1).png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="../../IMG/WithDuck/flower1.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="../../IMG/WithDuck/girl.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="../../IMG/WithDuck/river2.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="../../IMG/WithDuck/girl.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="../../IMG/WithDuck/river2.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="../../IMG/WithDuck/girl.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div> 
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="../../IMG/WithDuck/flower3.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="../../IMG/WithDuck/girl.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div> 
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="../../IMG/WithDuck/flower3.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="../../IMG/WithDuck/girl.png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div> 
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="../../IMG/WithDuck/flower4.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="../../IMG/WithDuck/man (2).png"> 바보</p> 
                        <p class="good">12</p>
                        <p class="readCount">123</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border bg-light">
                        <a href="">
                            <img class="intro-img" src="../../IMG/WithDuck/flower4.PNG" alt="">
                        </a>
                        <p class="title">안녕하세요</p>
                        <p>안녕하세요</p>
                        <p class="nickName"><img src="../../IMG/WithDuck/man (2).png"> 바보</p> 
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
    
    
</body>
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
</script>