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
    
    <style>
      .tag-item {
        display: flex;
        margin-right: 10px;
        width: 100px;
        height: 50px;
        background-color: #a7a2a238;
        align-items: center;
        justify-content: center;
        float: left;
        margin-top: 20px;
        margin-right: 5px;
        border-radius: 0.9em;
      }

      .div_container {
        display: flex;
        margin-bottom: 5px;
      }
    </style>
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
                    <input type="hidden" type="text" id="btnValueSaveLocation" name="withLocation" required="required"/>
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
                    <input type="hidden" type="text" id="btnValueSaveGender" name="withGender" required="required">
                    <button class="gender_btn" value="남자" type="button" name="gender">남자</button>
                    <button class="gender_btn" value="여자" type="button" name="gender">여자</button>
                    <button class="gender_btn" value="성별무관" type="button" name="gender">성별무관</button>
                </div>

                <div class="age_value">
                	<input type="hidden" type="text" id="btnValueSaveAge" name="withAge" required="required">
                    <button class="age_btn" value="~20대" type="button" name="age">~20대</button>
                    <button class="age_btn" value="30대" type="button" name="age">30대</button>
                    <button class="age_btn" value="40대" type="button" name="age">40대</button>
                    <button class="age_btn" value="50대 이상" type="button" name="age">50대 이상</button>
                </div>
    
                    <label for="customRange2" class="form-label"></label>
                    <div style="display: flex; align-items: center; justify-content: center; position: relative; bottom: 20px; height: 50.8px;     border-bottom: 1px solid #a7a2a28f ;">
                        <input required="required" type="range" name="withPersonner" class="form-range" min="0" step="1" max="50" id="customRange2" oninput="document.getElementById('value2').innerHTML=this.value+'명';">
                        <span id="value2"  style="position:relative; left:5px; bottom:2px; display: inline-block; width: 40px;">명</span>
                        
                    </div>
                <div class="date_container">
                    <div class="start_container">
                        <label for="start">출발일:</label>
    
                        <input required="required" type="date" id="start" class="start" name="withStartDate"
                            value="2018-07-22"
                            min="2018-01-01" max="2030-12-31" style="margin-left:10px;">
                    </div>
                    <div class="end_container">
                        <label required="required" for="start">도착일:</label>
            
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
        
        <div class="tr_hashTag_area">
          <div class="form-group">
            <input type="hidden" value="" name="tag" id="rdTag" />
          </div>

          <div class="div_container" aria-readonly="true"></div>

          <div class="form-group">
            <input type="text" id="tag" size="7" placeholder="엔터로 키워드를 등록해주세요." style="width: 300px;"/>
          </div>
      	</div>
    </div>
    </section>
    <div style="text-align: center; display: flex; align-items: center; justify-content: center; margin-bottom: 10px; position: relative; bottom: 50px;">
        <button class="btn btn-outline-warning" type="submit">등록</button>
        <button class="btn btn-secondary" type="submit" id="cancel" style="width:140px;">취소</button>
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
		formElement.attr("action", "${path}/withduck/list");
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
    	$('.form-range').val(0);

    	var gradient_value = 100 / document.querySelector('.form-range').attributes.max.value;
    	$('.form-range').css('background', 'linear-gradient(to right, #FFE283 0%, #FFE283 '+gradient_value * $('.form-range').val() +'%, rgb(236, 236, 236) ' +gradient_value *  $('.form-range').val() + '%, rgb(236, 236, 236) 100%)');
    	
    	var date = new Date();

        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        if (month < 10) month = "0" + month;
        if (day < 10) day = "0" + day;

        var today = year + "-" + month + "-" + day;       
        $("#start").attr("value", "");
        $("#end").attr("value", "");
        
    	//여기 아래 부분
        $('#summernote').summernote({
              height: 300,                 // 에디터 높이
              minHeight: null,             // 최소 높이
              maxHeight: null,             // 최대 높이
              focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
              lang: "ko-KR",               // 한글 설정
              placeholder: '내용을 입력하세요!'   //placeholder 설정
        });
    	
    	$('.form-range').attr('value', '0');
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
        
        $(document).ready(function () {
            var tag = {};
            var counter = 0;

            // 입력한 값을 태그로 생성한다.
            function addTag (value) {
                tag[counter] = value;
                counter++; // del-btn 의 고유 id 가 된다.
            }

            // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
            function marginTag () {
                return Object.values(tag).filter(function (word) {
                    return word !== "";
                });
            }
        
            // 서버에 제공
            $("#tag-form").on("submit", function (e) {
                var value = marginTag(); // return array
                $("#rdTag").val(value); 

                $(this).submit();
            });

            $("#tag").on("keypress", function (e) {
                var self = $(this);

                //엔터나 스페이스바 눌렀을때 실행
                if (e.key === "Enter" || e.keyCode == 32) {

                    var tagValue = self.val(); // 값 가져오기

                    // 해시태그 값 없으면 실행X
                    if (tagValue !== "") {

                        // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                        var result = Object.values(tag).filter(function (word) {
                            return word === tagValue;
                        })
                    
                        // 해시태그가 중복되었는지 확인
                        if (result.length == 0) { 
                        	if(counter > 2) {
                        		alert("태그 추가 가능한 갯수를 초과했습니다.");
                        	} else {
                        		 $(".div_container").append("<div class='tag-item' >"+tagValue+"<span class='del-btn' idx='"+counter+"'>&ensp;X</span><input type='hidden' id='keyword"+counter+"' name='keyword"+counter+"'/></div>");
  							   if($($($('.tag-item')[0])).text() != ''){
  								   $('#keyword0').attr('value', $($($('.tag-item')[0])).text());
  							   }
  							   if($($($('.tag-item')[1])).text() != '') {
  								   $('#keyword1').attr('value', $($($('.tag-item')[1])).text());
  							   }	
  							   if($($($('.tag-item')[2])).text() != '') {
  								   $('#keyword2').attr('value', $($($('.tag-item')[2])).text());
  							   }	
                            addTag(tagValue);
                            self.val("");
                        	}
                        } else {
                            alert("태그값이 중복됩니다.");
                        }
                    }
                    e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
                }
            });

            // 삭제 버튼 
            // 인덱스 검사 후 삭제
            $(document).on("click", ".del-btn", function (e) {
                var index = $(this).attr("idx");
                tag[index] = "";
                $(this).parent().remove();
            });
    });
</script>