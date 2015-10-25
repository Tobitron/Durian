var openReview = document.getElementById("openReviewButton")
var closePopup = document.getElementById("popupClose");
var overlay = document.getElementById('reviewOverlay');
var review = document.getElementById("reviewPopup");

// Show Overlay and Popup
closePopup.onclick = function() {
 overlay.style.display = 'none';
 review.style.display = 'none';
}

// Hide Overlay and Popup
openReview.onclick = function() {
 overlay.style.display = 'block';
 review.style.display = 'block';
}

$.get("reviews.json", function(data) {

});
