<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="../common/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <!-- mainstyle CSS -->
    <link rel="stylesheet" href="${path }/resources/css/common/style.css" type="text/css" />
    <link rel="stylesheet" href="${path }/resources/css/common/font-icons.css" type="text/css" />

    <!-- WithDuck CSS-->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/withduck/CreateWithDuck.css">
    
    <!-- Summernote CSS -->
    <link rel="stylesheet" href="${path }/resources/css/withduck/summernote/summernote-lite.css">

    <title>동행 생성</title>
</head>

<!-- 메인 로고와 상단 우측 메뉴 포함한 header> -->
<body class="stretched">
<form action="${path }/withduck/create" method="post" id="formobj" enctype="multipart/form-data">
<!-- 이미지 생성 -->
    <section class="zone1">
    <div class="carousel_container">
        <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
            </ul>
        
            <!-- The slideshow -->
            <div class="carousel-inner">
            <div class="carousel-item active">
            <div style="cursor: pointer;" id="file_container1">
                <div id="image_preview1">
	                <img class="car-img" name="photo1" style="">
                </div>
            </div>
                <div class="empty" id="empty1">
                <div>
                    <img class="empty_img" src="${path}/resources/images/WithDuck/photo.png" style="width: 20px; height: 20px;" alt="">
                </div>
                <p>업로드할 사진을 추가해보세요!</p>
                <label for="file1" class="file">사진추가</label>
                <input type="file" name="file1" id="file1" style="display: none;">
                </div>
            </div>
            <div class="carousel-item">
            <div style="cursor: pointer;" id="file_container2">
               	<div id="image_preview2">
	                <img class="car-img" name="photo2" style="">
                </div>
            </div>
                <div class="empty" id="empty2">
                    <div>
                        <img class="empty_img" src="${path}/resources/images/WithDuck/photo.png" name="photo2" style="width: 20px; height: 20px;" alt="">
                    </div>
                    <p>업로드할 사진을 추가해보세요!</p>
                    <label for="file2" class="file">사진추가</label>
                    <input type="file" name="file2" id="file2" style="display: none;">
                </div>
            </div>
            <div class="carousel-item">
            <div style="cursor: pointer;" id="file_container3">
               <div id="image_preview3">
	                <img class="car-img" name="photo3" style="">
                </div>
            </div>
                <div class="empty" id="empty3">
                    <div>
                        <img class="empty_img" src="${path}/resources/images/WithDuck/photo.png" name="photo3" style="width: 20px; height: 20px;" alt="">
                    </div>
                    <p>업로드할 사진을 추가해보세요!</p>
                    <label for="file3" class="file">사진추가</label>
                    <input type="file" name="file3" id="file3" style="display: none;">
                </div>
            </div>
            </div>
        
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
            </a>
        
        </div>
    </div>
    </section>
    
    <!-- 필터 등록 -->
    <section class="zone2" >
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
                    <div><button class="location_btn" value="부산광역시" type="button" name="location">부산광역시</button></div>
                    <input type="hidden" type="text" id="btnValueSaveLocation" name="withLocation">
                    <div><button class="location_btn" value="서울특별시" type="button" name="location">서울특별시</button></div>
                    <div><button class="location_btn" value="인천광역시" type="button" name="location">인천광역시</button></div>
                    <div><button class="location_btn" value="광주광역시" type="button" name="location">광주광역시</button></div>
                    <div><button class="location_btn" value="대전광역시" type="button" name="location">대전광역시</button></div>
                    <div><button class="location_btn" value="대구광역시" type="button" name="location">대구광역시</button></div>
                </div>

                <div class="location_value">
                    <div><button class="location_btn" value="강원도" type="button" name="location">강원도</button></div>
                    <div><button class="location_btn" value="제주도" type="button" name="location">제주도</button></div>
                    <div><button class="location_btn" value="경기도" type="button" name="location">경기도</button></div>
                    <div><button class="location_btn" value="충청도" type="button" name="location">충청도</button></div>
                    <div><button class="location_btn" value="경상도" type="button" name="location">경상도</button></div>
                    <div><button class="location_btn" value="전라도" type="button" name="location">전라도</button></div>
                </div>
    
                <div class="gender_value">
                    <input type="hidden" type="text" id="btnValueSaveGender" name="withGender">
                    <button class="gender_btn" value="남자" type="button" name="gender">남자</button>
                    <button class="gender_btn" value="여자" type="button" name="gender">여자</button>
                    <button class="gender_btn" value="성별무관" type="button" name="gender">성별무관</button>
                </div>

                <div class="age_value">
                	<input type="hidden" type="text" id="btnValueSaveAge" name="withAge">
                    <button class="age_btn" value="~20대" type="button" name="age">~20대</button>
                    <button class="age_btn" value="30대" type="button" name="age">30대</button>
                    <button class="age_btn" value="40대" type="button" name="age">40대</button>
                    <button class="age_btn" value="50대 이상" type="button" name="age">50대 이상</button>
                </div>
    
                    <label for="customRange2" class="form-label"></label>
                    <div style="display: flex; align-items: center; justify-content: center; position: relative; bottom: 20px; height: 50.8px;     border-bottom: 1px solid #a7a2a28f ;">
                        <input type="range" name="withPersonner" class="form-range" min="1" step="1" max="50" id="customRange2" oninput="document.getElementById('value2').innerHTML=this.value+'명';">
                        <span id="value2" style="position:relative; left:5px; bottom:2px; display: inline-block; width: 40px;">25명</span>
                        
                    </div>
                <div class="date_container">
                    <div class="start_container">
                        <label for="start">출발일:</label>
    
                        <input type="date" id="start" class="start" name="withStartDate"
                            value="2018-07-22"
                            min="2018-01-01" max="2030-12-31" style="margin-left:10px;">
                    </div>
                    <div class="end_container">
                        <label for="start">도착일:</label>
            
                        <input type="date" id="end" class="end" name="withEndDate"
                            value="2018-07-22"
                            min="2018-01-01" max="2030-12-31" style="margin-left:10px;">
                    </div>
                </div>
        </div>
    </div>
    </section>
    <!-- 내용, 제목 -->
    <section class="zone3">
    <div class="content_container">
        <p>제목</p>
            <input type="text" class="with_title" name="withTitle" id="" placeholder="제목을 입력하세요!">
        
        <p style="margin-top: 10px;">내용</p>
        <textarea id="summernote" name="withContent"></textarea>
    </div>
    </section>
    <div style="text-align: center; display: flex; align-items: center; justify-content: center; margin-bottom: 10px; position: relative; bottom: 50px;">
        <button class="btn btn-outline-warning" type="submit">등록</button>
        <button class="btn btn-outline-warning" type="button" id="cancel">취소</button>
    </div>
  </div>
</form>

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

<!-- summernote JS -->
<script src="${path }/resources/js/Summernote/summernote-lite.js"></script>
<script src="${path }/resources/js/Summernote/lang/summernote-ko-KR.js"></script>
</html>

<script>
$(function() {
	var cancel = $('#cancel');
	
	cancel.click(function() {
		const formElement = $('#formobj');
		formElement.attr("action", "/withduck/list");
		formElement.attr("method", "get");
		formElement.submit();
	})
});

$(document).on('click', '.location_btn', function(){
    $('.location_btn').removeClass('selected');
    $(this).addClass('selected');
    $('#btnValueSaveLocation').attr('value', $('.location_btn.selected').val());
});
$(document).on('click', '.gender_btn', function(){
    $('.gender_btn').removeClass('selected');
    $(this).addClass('selected');
    $('#btnValueSaveGender').attr('value', $('.gender_btn.selected').val());
});
$(document).on('click', '.age_btn', function(){
    $('.age_btn').removeClass('selected');
    $(this).addClass('selected');
    $('#btnValueSaveAge').attr('value', $('.age_btn.selected').val());
});

$('#file_container1').on('click', function() {
	$('#file1')[0].click();
});
$('#file_container2').on('click', function() {
	$('#file2')[0].click();
});
$('#file_container3').on('click', function() {
	$('#file3')[0].click();
});
	

    $(document).ready(function() {
    	var date = new Date();

        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        if (month < 10) month = "0" + month;
        if (day < 10) day = "0" + day;

        var today = year + "-" + month + "-" + day;       
        $("#start").attr("value", today);
        $("#end").attr("value", today);
        
    	//여기 아래 부분
        $('#summernote').summernote({
              height: 300,                 // 에디터 높이
              minHeight: null,             // 최소 높이
              maxHeight: null,             // 최대 높이
              focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
              lang: "ko-KR",               // 한글 설정
              placeholder: '내용을 입력하세요!'   //placeholder 설정
        });
    });
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
        
        $('#file1').on('change', function() {
            ext = $(this).val().split('.').pop().toLowerCase(); //확장자
            //배열에 추출한 확장자가 존재하는지 체크
            if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                resetFormElement($(this)); //폼 초기화
                window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
            } else {
                file = $('#file1').prop("files")[0];
                blobURL = window.URL.createObjectURL(file);
                $('#image_preview1 img').attr('src', blobURL);
                $('#image_preview1').slideDown(); //업로드한 이미지 미리보기 
                $(this).slideUp(); //파일 양식 감춤
                $('#empty1').css("visibility", "hidden");
            }
         });
        $('#file2').on('change', function() {
            ext = $(this).val().split('.').pop().toLowerCase(); //확장자
            //배열에 추출한 확장자가 존재하는지 체크
            if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                resetFormElement($(this)); //폼 초기화
                window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
            } else {
                file = $('#file2').prop("files")[0];
                blobURL = window.URL.createObjectURL(file);
                $('#image_preview2 img').attr('src', blobURL);
                $('#image_preview2').slideDown(); //업로드한 이미지 미리보기 
                $(this).slideUp(); //파일 양식 감춤
                $('#empty2').css("visibility", "hidden");
            }
         });
        $('#file3').on('change', function() {
            ext = $(this).val().split('.').pop().toLowerCase(); //확장자
            //배열에 추출한 확장자가 존재하는지 체크
            if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                resetFormElement($(this)); //폼 초기화
                window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
            } else {
                file = $('#file3').prop("files")[0];
                blobURL = window.URL.createObjectURL(file);
                $('#image_preview3 img').attr('src', blobURL);
                $('#image_preview3').slideDown(); //업로드한 이미지 미리보기 
                $(this).slideUp(); //파일 양식 감춤
                $('#empty3').css("visibility", "hidden");
            }
         });
        
</script>