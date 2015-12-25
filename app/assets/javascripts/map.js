$("#addCityButton").click(function(){
  newCity = $(".addCity").val()
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode({address: newCity}, function(results, status) {
    $.ajax({
       method: 'POST',
       url: '/cities',
       data: { name: newCity, latitude: results[0].geometry.location.lat(), longitude: results[0].geometry.location.lng() },
       dataType: 'html',
       error: function(response) {
         console.log("error")
       }
    });
  });
});

$.get("/cities.json", function(data) {

  cityData = data["cities"];

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 10.209, lng: 108},
    zoom: 5,
    styles: style_array,
    zoomControl: true,
    zoomControlOptions: {
       position: google.maps.ControlPosition.RIGHT_TOP
   },
  });

  // Remove cities that don't have any reviews from array, don't want them on the map with no reviews!
  for (var i = cityData.length - 1; i >= 0; i--) {
    if (cityData[i].city_reviews.length === 0) {
       cityData.splice(i, 1);
    }
  };

  // Create map markers
  var markerArray = [];
  cityData.forEach(function(city) {
        marker = new google.maps.Marker({
        position: new google.maps.LatLng(city.latitude, city.longitude),
        opacity: 0.6,
        map: map,
        icon: {
            path: google.maps.SymbolPath.CIRCLE,
            scale: 13,
            fillColor: city.city_color,
            fillOpacity: 1,
            strokeWeight: 0.6
        }
      });
    // Create an array with marker info so I can set icon scale later
    markerArray.push([marker, city.city_color, city.name]);

    // My change to MarkerWithLabel broken this code, reverted back to standard Gmaps marker
    google.maps.event.addListener(marker,'click', function(event) {
      var latitude = event.latLng.lat();
      var longitude = event.latLng.lng();

      $.ajax({
         method: 'POST',
         url: '/cities/popup',
         data: { latitude: latitude, longitude: longitude },
         dataType: 'html',
         success: function(data){
          popup.style.display = 'block';
          $("#popup").empty();
          $("#popup").append(data);
          $("#darkness").addClass("darkness");
         },
         error: function(response) {
           console.log("error")
         }
      })
    })
  });


  markerArray.forEach(function(marker) {
    google.maps.event.addListener(marker[0], 'mouseover', function(event){

      var infowindow = new google.maps.InfoWindow({
        content: '<strong>' + marker[2] + '</strong>'
      });

      infowindow.open(map, marker[0]);

      google.maps.event.addListener(marker[0], 'mouseout', function () {
           infowindow.close();
       });
    })
  });


  // Change icon scale on zoom
  map.addListener('zoom_changed', function() {
    var zoom = map.getZoom();

    for (i = 0; i < markerArray.length; i++) {
      markerArray[i][0].setIcon({
        path: google.maps.SymbolPath.CIRCLE,
        scale: (zoom * zoom) / 3,
        fillColor: city.city_color,
        fillOpacity: 1,
        strokeWeight: 0.6
      });
    };
  });
});


// Variable used for gmaps style
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
                "saturation": 0
            },
            {
                "lightness": 100
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
                "lightness": 100
            }
        ]
    }
]
