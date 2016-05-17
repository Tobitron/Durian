$.get("/cities.json", function(data) {

  cityData = data["cities"];

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 10.209, lng: 108},
    zoom: 5,
    styles: style_array,
    mapTypeControl: false,
    zoomControl: true,
    zoomControlOptions: {
       position: google.maps.ControlPosition.LEFT_CENTER
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
        // opacity: 0.6,
        map: map,
        title: city.name,
        icon: {
            path: google.maps.SymbolPath.CIRCLE,
            scale: 13,
            fillColor: city.city_color,
            fillOpacity: 1,
            strokeWeight: 0.6
        }
      });
    // Populate an array with marker info so I can set icon scale later
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
          popup.style.display = 'flex';
          $("#popup").empty();
          $("#popup").append(data);

          $("#popup").removeClass('animate-right');
          $("#popup").addClass('animate-left');

          // Make closing the popup a function so this shit be DRY
          $('#x').click(function() {
              $("#popup").removeClass('animate-left');
              $("#popup").addClass('animate-right');
              setTimeout(function(){ popup.style.display = "none" }, 300);
           });

          map.addListener('click', function() {
              $("#popup").removeClass('animate-left');
              $("#popup").addClass('animate-right');
              setTimeout(function(){ popup.style.display = "none" }, 300);
           });
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
        content: marker[2]
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
        title: markerArray[i][2],
        fillColor: markerArray[i][1],
        fillOpacity: 1,
        strokeWeight: 0.6
      });
    };
  });

});

// Hide info pane if user clicks on map




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
