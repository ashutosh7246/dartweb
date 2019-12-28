import 'dart:html';
import 'dart:convert';

import 'comman/list/list.dart';
import 'comman/nav/nav.dart';
import 'comman/map/map.dart';
import 'comman/parse-uri/parse-uri.dart';

SpanElement statsDaysElement;

DivElement detailView;
DivElement shipmentView;
DivElement assetView;

void main() {
  statsDaysElement = querySelector('#stats-days');

  detailView = querySelector('#detail-view');
  shipmentView = querySelector('#shipment-view');
  assetView = querySelector('#asset-view');

  showNavView();

  final map = showMapView();

  loadContent(map);
}

void loadContent(map) {
  HttpRequest.getString("data.json").then((jsonData) {
    final data = jsonDecode(jsonData);

    final statsDays = data["days"];
    final detailList = data["detail"];
    final shipmentList = data["stats"]["shipment_detail"];
    final assetList = data["stats"]["asset_detail"];

    statsDaysElement.text = "${statsDays}";

    showListView(detailList, detailView);
    showListView(shipmentList, shipmentView);
    showListView(assetList, assetView);

    populateMap(data, map);
  });
}

void populateMap(data, map) {
  for (var result in data["locations"]) {
    final lat = result["geometry"]["location"]["lat"];
    final lng = result["geometry"]["location"]["lng"];
    final name = result["name"];

    new MapView().addMarkers(lat, lng, map, name);
  }
}

void showListView(list, element) {
  ListView listView = new ListView();
  final node = listView.loadContent(list);
  element.children.add(node);
}

void showNavView() {
  NodeValidator nodeValidator = new NodeValidatorBuilder.common()
  ..allowHtml5(uriPolicy: new ItemUrlPolicy())
  ..allowElement('a', attributes: ['href'])
  ..allowElement('button', attributes: ['data-target', 'data-toggle'])
  ..allowElement('img', attributes: ['src']);

  NavView navView = new NavView();
  final nav = navView.loadNav();
  
  querySelector("#nav-element").setInnerHtml(nav, validator: nodeValidator);
}

showMapView() {
  MapView mapView = new MapView();
  final map = mapView.loadMap();
  return map;
}
