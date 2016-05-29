/**
 */

@HtmlImport("tiles-demo.html")
library using_neon_animation.lib.tiles.demo;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/color.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:using_neon_animation/tiles/circles-page.dart';
import 'package:using_neon_animation/tiles/squares-page.dart';

@PolymerRegister('tiles-demo')
class TilesDemo extends PolymerElement
    with
        PolymerBase{
  TilesDemo.created() : super.created() {
  }

  NeonAnimatedPages _pages;

  ready() {
    _pages = $['pages'];
  }

  @reflectable
  void onCircleClick([_, detail]) {
    _pages.selected = 1;
  }

  @reflectable
  void onSquareClick([_, detail]) {
    _pages.selected = 0;
  }


}
