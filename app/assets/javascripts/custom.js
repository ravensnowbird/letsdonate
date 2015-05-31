$(document).ready(function(){
  $('.add_location').change(function(){
  getLocation();
});

  $(".alert").fadeTo(2000, 500).slideUp(500, function(){
    $(".alert").alert('close');
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
