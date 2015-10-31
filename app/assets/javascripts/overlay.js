var openReview = document.getElementById("openReviewButton")
var closePopup = document.getElementById("popupClose");
var overlay = document.getElementById('reviewOverlay');
var review = document.getElementById("reviewPopup");

closePopup.onclick = function() {
 overlay.style.display = 'none';
 review.style.display = 'none';
}

openReview.onclick = function() {
 overlay.style.display = 'block';
 review.style.display = 'block';
}
