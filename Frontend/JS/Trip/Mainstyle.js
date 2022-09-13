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

$(document).ready(function () {
  $("ul.tab-nav li").click(function () {
    var tab_id = $(this).attr("data-tab");

    $("ul.tab-nav li").removeClass("ui-tabs-active");
    $(".tab-content").removeClass("ui-tabs-active");

    $(this).addClass("ui-tabs-active");
    $("#" + tab_id).addClass("ui-tabs-active");
  });
});
