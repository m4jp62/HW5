<%@page contentType="text/html" pageEncoding="utf-8"
import="java.lang.*,java.util.*,javax.xml.parsers.*,org.xml.sax.*,org.w3c.dom.*,java.io.*,javax.xml.transform.*,javax.xml.transform.stream.*,javax.xml.transform.dom.DOMSource,javax.xml.xpath.*" %>

<%
request.setCharacterEncoding("Big5");
String c = (String)request.getParameter("city");
String a = (String)request.getParameter("area");
String t = (String)request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
      <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    .title{
      font-family:Microsoft JhengHei;
    }
    </style>
  <title>美食地圖</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body class='title'>

        <div  id="map"></div>
  <dialog class="mdl-dialog green lighten-4">
    <h4 class="mdl-dialog__title" >就決定是這家了?</h4>
    <div class="mdl-dialog__content">
      <p id="fo1">
        Allowing us to collect data will let us get you the information you want faster.
      </p>
      <p id="fo2">
        Allowing us to collect data will let us get you the information you want faster.
      </p>
      <p id="fo3">
        Allowing us to collect data will let us get you the information you want faster.
      </p>
    </div>
    <div class="mdl-dialog__actions">
      <button type="button" class="waves-effect waves-light btn  " onclick="location.href='timetable.jsp'">出發</button>
      <button type="button" class="waves-effect waves-light btn light-green lighten-2 close">不要</button>
    </div>
  </dialog>
  <button id="show-dialog" class="waves-effect waves-light btn " class="mdl-button" style="display:none;" />
  <!--  Scripts-->
  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAltTkkJGqsXJX8va1TLbnHJ9-6ipe63NQ&libraries=places&callback=initMap"
        async defer></script>
        <script type="text/javascript">
            var map;
var infowindow;
var bounds = new google.maps.LatLngBounds();
var ci='<%=c%>';
var ai='<%=a%>';
var ti='<%=t%>';
var se=ci+ai+ti;

function initMap() {
  var n = {lat: 24.1209668, lng: 120.6733179};

  map = new google.maps.Map(document.getElementById('map'), {
    center: n,
    zoom: 15,
                      styles: [
          {"featureType":"water","elementType":"geometry","stylers":[{"visibility":"on"},{"color":"#aee2e0"}]},
          {"featureType":"landscape","elementType":"geometry.fill","stylers":[{"color":"#abce83"}]},
          {"featureType":"poi","elementType":"geometry.fill","stylers":[{"color":"#769E72"}]},
          {"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#7B8758"}]},
          {"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"color":"#EBF4A4"}]},
          {"featureType":"poi.park","elementType":"geometry","stylers":[{"visibility":"on"},{"color":"#8dab68"}]},
          {"featureType":"road","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},
          {"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#5B5B3F"}]},
          {"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ABCE83"}]},
          {"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"on"}]},
          {"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#A4C67D"}]},
          {"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#9BBF72"}]},
          {"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#9BBF72"}]},
          {"featureType":"transit","stylers":[{"visibility":"on"}]},
          {"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"visibility":"on"},{"color":"#87ae79"}]},
          {"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#7f2200"},{"visibility":"on"}]},
          {"featureType":"administrative","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"},{"visibility":"on"},{"weight":4.1}]},
          {"featureType":"administrative","elementType":"labels.text.fill","stylers":[{"color":"#495421"}]},
          {"featureType":"administrative.neighborhood","elementType":"labels","stylers":[{"visibility":"on"}]}]
  });

  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  service.textSearch({
    location: n,
    radius: 500,
    query: se
  }, callback);
}

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
    map.setCenter(results[0].geometry.location);
  }
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });

  google.maps.event.addListener(marker, 'click', function() {
    $("#fo1").text(place.name);
    $("#fo2").text(place.formatted_address);

if (place.opening_hours.open_now==true){
   $("#fo3").text('營業中');
}else{
   $("#fo3").text('已打烊');
}
    var btn = document.getElementById("show-dialog");//btnOK为服务器button控件
        btn.click();
  });


}

    var dialog = document.querySelector('dialog');
    var showDialogButton = document.querySelector('#show-dialog');
    if (! dialog.showModal) {
      dialogPolyfill.registerDialog(dialog);
    }
    showDialogButton.addEventListener('click', function() {
      dialog.showModal();
    });
    dialog.querySelector('.close').addEventListener('click', function() {
      dialog.close();
    });
        </script>
  </body>
</html>
