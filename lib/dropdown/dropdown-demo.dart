/**
 */

@HtmlImport("dropdown-demo.html")
library using_neon_animation.lib.dropdown.demo;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:using_neon_animation/dropdown/animated-dropdown.dart';

@PolymerRegister('dropdown-demo')
class DropdownDemo extends PolymerElement
    with
        PolymerBase{
  DropdownDemo.created() : super.created() {
  }

  @reflectable
  void onButtonClick([event, detail]) {
    var dropdown = document.querySelector('#' + event.target.getAttribute('dropdown-id'));
    if (dropdown!=null) {
      dropdown.show();
    }
  }

  @reflectable
  void onDropdownClick([event, detail]) {
    event.target.hide();
  }


}
