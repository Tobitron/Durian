var style_array = [
    {
        "featureType": "administrative",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 40
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "saturation": -10
            },
            {
                "lightness": 30
            }
        ]
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            },
            {
                "saturation": -60
            },
            {
                "lightness": 10
            }
        ]
    },
    {
        "featureType": "landscape.natural",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            },
            {
                "saturation": -60
            },
            {
                "lightness": 60
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 60
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 60
            }
        ]
    }
]

$.get("/cities.json", function(data) {
  cityData = data;

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 10.209, lng: 108},
    zoom: 5,
    styles: style_array
  });

  cityData["cities"].forEach(function(city) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(city.latitude, city.longitude),
      map: map,
      icon: {
          path: google.maps.SymbolPath.CIRCLE,
          scale: 18,
          fillColor: "#" + city.city_color,
          fillOpacity: 1,
          strokeWeight: 0.6
      }
    });
    
    // My change to MarkerWithLabel seems to have broken this code
    google.maps.event.addListener(marker,'click', function(event) {
      var latitude = event.latLng.lat();
      var longitude = event.latLng.lng();

      $.ajax({
         method: 'POST',
         url: '/cities',
         data: { latitude: latitude, longitude: longitude },
         dataType: 'html',
         success: function(data){
          popup.style.display = 'block';
          $("#popup").empty();
          $("#popup").append(data);
         },
         error: function(response) {
           console.log("error")
         }
      });
    });

  // Event that closes the Info Window with a click on the map
  google.maps.event.addListener(map, 'click', function() {
    popup.style.display = 'none';
    biasCard.className = 'col-md-4 biasCard hidden';
  });
  });
});
