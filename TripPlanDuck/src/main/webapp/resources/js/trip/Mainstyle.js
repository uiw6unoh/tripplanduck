// owl-carousel
$(document).ready(function () {
  var owl = $(".owl-carousel");

  owl.owlCarousel({
    items: 3, // 한번에 보여줄 아이템 수
    loop: true, // 반복여부
    margin: 35, // 오른쪽 간격
    autoplay: true, // 자동재생 여부
    autoplayTimeout: 1800, // 재생간격
    autoplayHoverPause: true, //마우스오버시 멈출지 여부
  });

  $(".customNextBtn").click(function () {
    owl.trigger("next.owl.carousel");
  });

  $(".customPrevBtn").click(function () {
    owl.trigger("prev.owl.carousel", [300]);
  });
});

// tabs
$(document).ready(function () {
  $("ul.tab-nav li").click(function () {
    var tab_id = $(this).attr("data-tab");

    $("ul.tab-nav li").removeClass("ui-tabs-active");
    $(".tab-content").removeClass("ui-tabs-active");
    $(".tab-content").attr("style", "display:none;");

    $(this).addClass("ui-tabs-active");
    $("#" + tab_id).addClass("ui-tabs-active");
    $("#" + tab_id).removeAttr("style", "display:none;");
  });
});

$(document).ready(function () {
  $("#tabs").tabs({
    collapsible: true,
    event: "mouseover",
    show: {
      effect: "fade",
      duration: 400,
    },
  });
});

// 꽉찬하트로 바꾸기
$(document).ready(function () {
  const heartSvg = document.querySelectorAll(".heart-icon.like-default");
  const heartPath = document.querySelectorAll(".heart-icon.like-default path");

  for (let i = 0; i < heartSvg.length; i++) {
    heartSvg[i].addEventListener("click", function (e) {
      if (heartSvg[i].classList.contains("like-default")) {
        heartSvg[i].classList.replace("like-default", "like-fill");
        heartPath[i].setAttribute(
          "d",
          "M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"
        );
      } else {
        heartSvg[i].classList.replace("like-fill", "like-default");
        heartPath[i].setAttribute(
          "d",
          "M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"
        );
      }
    });
  }
});

/*
$(function(){
	getJson();
});

// json 함수 읽어오는 함수
function getJson() {
	// Seoul.json에서 데이터를 가져옴 -> function(data)로 처리 -> data에 저장
	$.getJSON("areaBasedList.json", function(data) {
		$.each(data, function(key, val) {
			if( key == "SID" ) {
				$("table").attr("border", "1");
				
				// API에서 받아 올 데이터들
				$("thead").append(
					"<tr>"+
						"<th>"+val.ADDR1+"</th>"+	
						"<th>"+val.AREACODE+"</th>"+	
						"<th>"+val.SIGUNGUCODE+"</th>"+
						"<th>"+val.FIRSTIMAGE2+"</th>"+	
						"<th>"+val.READCOUNT+"</th>"+	
						"<th>"+val.TITLE+"</th>"+	
					"</tr>"
				);
			} else {
				var list = val;		// list 변수 : 배열로 정의
				for( var i=0; i<list.length; i++ ) {
					var str = list[i];		// str 변수 : list 배열 안에 있는 하나의 json 데이터
					$("tbody").append(
						"<tr>"+
							"<td>"+str.addr1+"</td>"+
							"<td>"+str.areacode+"</td>"+
							"<td>"+str.sigungucode+"</td>"+
							"<td>"+str.firstimage2+"</td>"+
							"<td>"+str.readcount+"</td>"+
							"<td>"+str.title+"</td>"+
							// db에 값들을 ';'로 나눠서 넘겨줌
							"<input type='hidden' name='list' value='"+
							str.addr1+";"+str.areacode+";"+str.sigungucode+";"
							+str.firstimage2+";"+str.readcount+";"+str.title+"'>"+
						"</tr>"
					);
				}
			}
		});
	});
}
*/




function showLoading() {
	$(".loading").css("display", "block");
}

function hideLoading() {
	$(".loading").css("display", "none");
}

function showSkeleton() {
	$(".skeletonCard").css("display", "");
}

function hideSkeleton() {
	$(".skeletonCard").css("display", "none");

};