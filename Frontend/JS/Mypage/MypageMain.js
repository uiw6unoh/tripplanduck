// 하단 메뉴 밑줄 슬라이딩
let horizontalBar = document.getElementById("horizontal-underline");
let horizontalMenus = document.querySelectorAll("div.nav-container > ul li a");

console.log(horizontalBar);
console.log(horizontalMenus);


function horizontalIndicator(e) {
    horizontalBar.style.left = e.offsetLeft + "px";
    horizontalBar.style.width = e.offsetWidth + "px";
    horizontalBar.style.top = e.offsetTop + e.offsetHeight + "px";
}

horizontalMenus.forEach((menu) => 
    menu.addEventListener("click", (e) => horizontalIndicator(e.currentTarget))
);

// 하트 토글
// const togglingBtns = document.querySelector('.fa-heart');
// console.log(togglingBtns);
