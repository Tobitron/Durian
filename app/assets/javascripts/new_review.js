$(".add-city").click(function(){
    $(".dont-see-city").css("display", "none");
    $(".addCity").css("display", "block");
    $("#addCityButton").css("display", "block");
});

$("#addCityButton").click(function(){
  $(".addCity").css("display", "none");
  $("#addCityButton").css("display", "none");
});
