/**
 */

@HtmlImport("main_app.html")
library using_neon_animation.lib.main_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/neon_animation/animations/fade_in_animation.dart';
import 'package:polymer_elements/neon_animation/animations/fade_out_animation.dart';
import 'package:polymer_elements/neon_animation/animations/hero_animation.dart';
import 'package:polymer_elements/neon_animation/animations/scale_down_animation.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation_runner_behavior.dart';
import 'package:using_neon_animation/grid_view.dart';
import 'package:using_neon_animation/card_view.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement
    with
        PolymerBase,
        NeonAnimatableBehavior,
        NeonAnimationRunnerBehavior {
  MainApp.created() : super.created() {
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
    print(" onItemClick , detail = ${detail}");

    _card.color = detail["data"]["color"];
    _card.set("color", detail["data"]["color"]);

    _pages.selected = 1;
  }

  @reflectable
  void onFullClose([_, detail]) {
    print(" onFullClose , detail = ${detail}");
    _pages.selected = 0;
  }


}
