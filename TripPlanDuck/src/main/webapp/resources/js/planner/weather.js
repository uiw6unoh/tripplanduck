//두번째 날씨 위젯
//$('.lb-left-weather').hide();
$('#lbl-1').show();
$('#locationSelect').change(function () {
  dropdown = $('##locationSelect').val();
  $('.lb-left-weather').hide();
  $('#' + "lbl-" + dropdown).show();
});

//30초 마다 새로고침
/*$(document).ready(function () {
  setTimeout(
    function () {
      window.location.reload(1);
    },
    30000
  );
});*/
