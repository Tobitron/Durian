var popup = document.getElementById('popup');

$("#darkness").click(function() {
  $("#darkness").toggleClass("darkness", "darkIntoLight");
  // should probably make this into jquery but I think it's pretty readable like this, gosh darnt it people like it.
  popup.style.display = 'none';
  biasCard.className = 'col-md-4 biasCard hidden';
});

$(".flash").fadeOut(3500);
