library navview;

import 'dart:html';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

void main() {}

class NavView {
  loadNav() {
    final nav = new Element.html(
        '<nav class="navbar navbar-inverse"><div class="container-fluid"><div class="navbar-header"><button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar2"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="http://disputebills.com"><img src="https://res.cloudinary.com/mhmd/image/upload/v1557368579/logo_iqjuay.png" alt="Logo"></a></div><div id="navbar2" class="navbar-collapse collapse"><ul class="nav navbar-nav navbar-right"><li><a href="#"><span class="glyphicon glyphicon-user"></span> Account</a></li></ul></div></div></nav>');
    return nav.outerHtml;
  }
}
