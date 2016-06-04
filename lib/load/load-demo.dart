/**
 */

@HtmlImport("load-demo.html")
library using_neon_animation.lib.load.demo;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/slide_from_left_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_from_right_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_right_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_left_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_left_animation.dart';
import 'package:using_neon_animation/load/full-page.dart';

@PolymerRegister('load-demo')
class LoadDemo extends PolymerElement
    with
      PolymerBase,
      NeonAnimatableBehavior{

  LoadDemo.created() : super.created() {
  }

  @property
  int selected = 0;

  ready() {
    // this is the WebComponentsReady event of dart version
    // ($$("full-page") as FullPage).show();
  }


}
