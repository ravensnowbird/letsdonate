$(document).ready(function(){
  $('.add_location').change(function(){
  getLocation();

});

  $(".alert").fadeTo(2000, 500).slideUp(500, function(){
    $(".alert").alert('close');
  });
  if($("#map").length) {
  initMap()
}

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
    if($("#map").length) {
      console.log([position.coords.latitude, position.coords.longitude])
      map.setView(new L.LatLng(position.coords.latitude,position.coords.longitude),12);
      marker.setLatLng(new L.LatLng(position.coords.latitude,position.coords.longitude));
      circle.setLatLng(new L.LatLng(position.coords.latitude,position.coords.longitude));
      $("#lat").val(position.coords.latitude);
      $("#lng").val(position.coords.longitude);
    }
  }


function add_region_fields(link, content) {
   console.log("IN add_region_fields in custom.js")
  var new_id = new Date().getTime();
  $(link).prev().append(content.replace(/region_id/g, new_id));
  //initialize datetime picker dynamically when agenda_item fields are loaded
  $( ".delete_region" ).click(function() {
    $(this).closest( "fieldset" ).remove();
  });
}

function add_notifier_fields(link, content) {
  var new_id = "notify_"+Math.random();
  $(link).prev().append(content.replace(/notifier_id/g, new_id));
  //initialize datetime picker dynamically when agenda_item fields are loaded
  $( ".delete_notifier" ).click(function() {
    $(this).closest( "fieldset" ).remove();
  });
}

var map;
var circle;
var marker;

function initMap() {

  if (typeof map !== 'undefined') {
    map.remove();
  }
  $("#map").html("");
  setTimeout(function() {


  L.mapbox.accessToken = 'pk.eyJ1IjoicmF2ZW5zbm93YmlyZCIsImEiOiIxYzRhMDE0OGYyNWI1YmUwYjEwYTBmZWVjYjlhN2EwYyJ9.5dkNJRDmMaeVFrFM8COpfQ';
  map = L.mapbox.map('map', 'mapbox.streets')
  .setView([17.42239077987073, 78.50212097167969],12);
  circle = L.circle([17.42239077987073, 78.50212097167969], 2000).addTo(map);

  marker = L.marker(new L.LatLng(17.42239077987073, 78.50212097167969), {
    icon: L.mapbox.marker.icon({
      'marker-color': 'ff8888'
    }),
    draggable: true
  });

  marker.bindPopup('Set your location');
  marker.addTo(map);
  $("#lat").val(17.42239077987073);
  $("#lng").val(78.50212097167969);

  marker.on('drag', function(e) {
    circle.setLatLng(e.target.getLatLng());
    $("#lat").val(e.target.getLatLng().lat);
    $("#lng").val(e.target.getLatLng().lng);
  });
}, 1000);
}
