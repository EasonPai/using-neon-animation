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
import 'package:using_neon_animation/load/load-demo.dart';
import 'package:polymer_elements/iron_collapse.dart';
import 'dart:html';
import 'package:using_neon_animation/load/full-page.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement with PolymerBase {

  Element demoContainer;
  int _index = 0;
  IronCollapse menu;

  MainApp.created() : super.created() {
    demoContainer = $['demos'];
    menu = $$('.horizontal-section');
    toggleDemo();
  }

  @reflectable
  void onMenuTapped(Event event, [_]) {
    menu.toggle();
  }

  @reflectable
  void onTapped(Event event, [_]) {
    _index = int.parse(event.currentTarget.id);
    toggleDemo();
  }

  void toggleDemo() {
    for (int i = 0; i < demoContainer.children.length; i++) {
      if (_index == i) {
        demoContainer.children[i].classes.remove("invisible");

        // special rule for 'load-demo'
        if( _index == 5){

          // pardon me for using this hack-around
          (Polymer.dom(demoContainer.children[i].root).querySelector('full-page') as FullPage).show();
        }

      } else {
        demoContainer.children[i].classes.add("invisible");
      }
    }
  }
}
