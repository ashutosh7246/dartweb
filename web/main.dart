import 'dart:html';
import 'dart:convert';
import 'package:google_maps/google_maps.dart';

UListElement detailListElement;
UListElement shipmentListElement;
UListElement assetListElement;
SpanElement statsDaysElement;

void main() {
  detailListElement = querySelector('#detail-list');
  shipmentListElement = querySelector('#shipment-list');
  assetListElement = querySelector('#asset-list');
  statsDaysElement = querySelector('#stats-days');
  
  final mapOptions = new MapOptions()
    ..zoom = 3
    ..center = new LatLng(28.396392,76.861994);
  final map = new GMap(document.getElementById("map-canvas"), mapOptions);
  
  loadContent(map);
}

void loadContent (map) {
  HttpRequest.getString("data.json").then((jsonData){
    final data = jsonDecode(jsonData);
    
    final statsDays = data["days"];
    final detailList = data["detail"];
    final shipmentList = data["stats"]["shipment_detail"];
    final assetList = data["stats"]["asset_detail"];
    
    statsDaysElement.text = "${statsDays}";
    
    createList(detailList, detailListElement);
    createList(shipmentList, shipmentListElement);
    createList(assetList, assetListElement);
    
    populateMap(data, map);
  });
}

void createList (list, element) {
  list.forEach((final key, final value) {
    print("detailList: ${key} -> ${list[key]}");
    var li = new LIElement();
    var span = new SpanElement();
    span.text = "${list[key]}";
    li.text = "${key}:  ";
    li.className = "list-group-item list-group-item-info";
    li.append(span);
    element.children.add(li);
  });
}

void populateMap (data, map) {
  for(var result in data["locations"]){
    
    final lat = result["geometry"]["location"]["lat"];
    final lng = result["geometry"]["location"]["lng"];
    final name = result["name"];
    
    new Marker(new MarkerOptions()
    ..position = new LatLng(lat, lng)
    ..map = map
    ..title = name
    );
  }
}