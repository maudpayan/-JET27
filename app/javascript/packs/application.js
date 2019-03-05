import "bootstrap";
import "../plugins/flatpickr"

function initMap() {
    // Create a map object and specify the DOM element for display.
    var map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 52.5206, lng: 13.4098},
      scrollwheel: false,
      zoom: 8
    });
  }
