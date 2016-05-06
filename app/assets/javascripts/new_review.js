$(".add-city").click(function(){
    $(".add-city").css("display", "none");
    $(".addCity").css("display", "block");
    $("#addCityButton").css("display", "block");
});

$("#addCityButton").click(function(){
  var newCity = $(".addCity").val();
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode({address: newCity}, function(results, status) {
    $.ajax({
       method: 'POST',
       url: '/cities',
       data: { name: newCity, latitude: results[0].geometry.location.lat(), longitude: results[0].geometry.location.lng() },
       dataType: 'html',
       error: function(response) {
         console.log("error");
       }
    });
  });

  alert("New city added! Please refresh this page and select from the city dropdown. (Kinda ghetto that you need to refresh, sorry, I'll fix that later)")
});
