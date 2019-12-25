library navview;

import 'dart:html';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

void main() {}

class NavView {
  loadNav() {
    final nav = new Element.html(
        '<nav class="navbar navbar-inverse"><div class="container-fluid"><div class="navbar-header"><a class="navbar-brand" href="#">MapApp...</a></div><ul class="nav navbar-nav"><li class="active"><a href="#">Home</a></li></ul></div></nav>');
    return nav.outerHtml;
  }
}
