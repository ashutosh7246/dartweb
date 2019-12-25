library mapview;

import 'dart:html';
import 'package:google_maps/google_maps.dart';

void main() {}

class MapView {
  loadMap() {
    final mapOptions = new MapOptions()
      ..zoom = 3
      ..center = new LatLng(28.396392, 76.861994);
    final map = new GMap(document.getElementById("map-canvas"), mapOptions);
    return map;
  }

  addMarkers(lat, lng, map, name) {
    new Marker(new MarkerOptions()
      ..position = new LatLng(lat, lng)
      ..map = map
      ..title = name);
  }
}
