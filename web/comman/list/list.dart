library listview;

import 'dart:html';

void main() {}

class ListView {
  loadContent(list) {
    UListElement detailListElement = new UListElement();
    detailListElement.className = "list-group";
    list.forEach((final key, final value) {
      var li = new LIElement();
      var span = new SpanElement();
      span.text = "${list[key]}";
      li.text = "${key}:  ";
      li.className = "list-group-item list-group-item-info";
      li.append(span);
      detailListElement.children.add(li);
    });
    return detailListElement;
  }
}
