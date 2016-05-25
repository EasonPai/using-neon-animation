/**
 */

@HtmlImport("tiles_index.html")
library using_neon_animation.lib.tiles.index;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/color.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:using_neon_animation/tiles/circles-page.dart';
import 'package:using_neon_animation/tiles/squares-page.dart';

@PolymerRegister('tiles-index')
class TilesIndex extends PolymerElement
    with
        PolymerBase{
  TilesIndex.created() : super.created() {
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
