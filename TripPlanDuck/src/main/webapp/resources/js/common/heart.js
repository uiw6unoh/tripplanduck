$(document).ready(function () {
  function addListener() {
    var btn = document.querySelector("#Heart_2_");
    btn.addEventListener("click", restart, false);
  }

  function restart() {
    // var newHeart = document.getElementsByClassName(".st7");
    var container = document.querySelector("#Layer_1");
    var newContainer = container.cloneNode(true);

    container.parentNode.replaceChild(newContainer, container);
    $(".st7").removeAttr("style");

    addListener();
  }
  addListener();
});

$(document).ready(function () {
  function addListener() {
    var btn = document.querySelector("#Heart_2_N");
    btn.addEventListener("click", restart, false);
  }

  function restart() {
    // var newHeart = document.getElementsByClassName(".st7");
    var container = document.querySelector("#Layer_1");
    var newContainer = container.cloneNode(true);

    container.parentNode.replaceChild(newContainer, container);
    $(".st7").removeAttr("style");

    addListener();
  }
  addListener();
});
