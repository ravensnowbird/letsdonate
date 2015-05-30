$(document).ready(function(){
  $('.add_location').change(function(){
    getLocation();
  });
  
});
  function getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(getLatLong);
    } else {
      //x.innerHTML = "Geolocation is not supported by this browser.";
    }
  }

  function getLatLong(position) {
    $('#region_lat').val(position.coords.latitude);
    $('#region_long').val(position.coords.longitude);
  }
