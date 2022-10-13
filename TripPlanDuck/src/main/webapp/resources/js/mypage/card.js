console.log(document.getElementsByClassName('down-chevron'));

document.querySelectorAll('.down-chevron').forEach((cell) => {
  cell.addEventListener('click', function() {
    console.log(cell.getAttribute('alt'));
  });
});