var cityData = 0
$.get("/cities.json", function(data) {
  cityData = data
});

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 10.209, lng: 108},
    zoom: 5,
  });

  cityData["cities"].forEach(function(city) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(city.latitude, city.longitude),
      map: map,
      icon: {
          path: google.maps.SymbolPath.CIRCLE,
          scale: 14,
          fillColor: "rgb(144,0,0)",
          fillOpacity: 1,
          strokeWeight: 0.6
      },
    });

    var loopContent =
                '<div id="iw-container">' +
                  '<div class="iw-title">' + city.name + '</div>' +
                  '<div class="iw-content">' +
                    '<div class="iw-subTitle">Review</div>' +
                    'Description place holder'  +
                  '</div>' +
                '</div>';


    var infowindow = new google.maps.InfoWindow({
      content: loopContent,
      maxWidth: 450
    });

      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
      });

      // Event that closes the Info Window with a click on the map
      google.maps.event.addListener(map, 'click', function() {
        infowindow.close();
      });
  });
};
