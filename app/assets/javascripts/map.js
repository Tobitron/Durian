$.get("/cities.json", function(data) {
  cityData = data;

  map = new google.maps.Map(document.getElementById('map'), {
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

    // Grab the marker's lat/long when user clicks, AJAX that shit to the controller
    google.maps.event.addListener(marker,'click', function(event) {

      var latitude = event.latLng.lat();
      var longitude = event.latLng.lng();

      $.ajax({
         method: 'GET',
         url: '/reviews',
         data: { latitude: latitude, longitude: longitude },
         dataType: 'json'
       });

      overlay.style.display = 'block';
      review.style.display = 'block';

    });
  });
});
