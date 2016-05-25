/**
 */

@HtmlImport("grid_index.html")
library using_neon_animation.lib.grid.index;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:using_neon_animation/grid/grid_view.dart';
import 'package:using_neon_animation/grid/card_view.dart';

@PolymerRegister('grid-index')
class GridIndex extends PolymerElement
    with
        PolymerBase{
  GridIndex.created() : super.created() {
  }

  NeonAnimatedPages _pages;
  CardView _card;
  GridView _grid;

  ready() {

    _pages = $['pages'];
    _grid = $['grid'];
    _card = $['card'];
  }

  @reflectable
  void onTileClick([_, detail]) {
    _card.set("color", detail["data"]["color"]);
    _pages.selected = 1;
  }

  @reflectable
  void onCardClosed([_, detail]) {
    _pages.selected = 0;
  }


}
