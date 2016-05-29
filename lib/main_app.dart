/**
 */

@HtmlImport("main_app.html")
library using_neon_animation.lib.main_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:using_neon_animation/basic/basic-demo.dart';
import 'package:using_neon_animation/declarative/declarative-demo.dart';
import 'package:using_neon_animation/grid/grid-demo.dart';
import 'package:using_neon_animation/tiles/tiles-demo.dart';
import 'package:using_neon_animation/card/card-demo.dart';
import 'dart:html';

@PolymerRegister('main-app')
class MainApp extends PolymerElement with PolymerBase {

  Element demos;
  int _index = 0;

  MainApp.created() : super.created() {
    demos = $['demos'];
    toggleMenu();
  }

  @reflectable
  void onTapped(Event event, [_]) {
    _index = int.parse(event.currentTarget.id);
    toggleMenu();
  }

  void toggleMenu() {
    for (int i = 0; i < demos.children.length; i++) {
      if (_index == i) {
        demos.children[i].classes.remove("invisible");
      } else {
        demos.children[i].classes.add("invisible");
      }
    }
  }
}
