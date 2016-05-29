/**
 */

@HtmlImport("card-demo.html")
library using_neon_animation.lib.card.demo;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/ripple_animation.dart';
import 'package:polymer_elements/neon_animation/animations/reverse_ripple_animation.dart';
import 'package:polymer_elements/neon_animation/animations/fade_out_animation.dart';
import 'package:polymer_elements/neon_animation/animations/fade_in_animation.dart';
import 'package:using_neon_animation/card/x-cards-list.dart';
import 'package:using_neon_animation/card/x-card.dart';


@PolymerRegister('card-demo')
class CardDemo extends PolymerElement
    with
      PolymerBase,
      NeonAnimatableBehavior {

  CardDemo.created() : super.created() {
  }

  @property
  int selected = 0;

  ready() {
  }

  @reflectable
  void onPolymerClick([event, detail]) {
    $['list'].sharedElements = {
      'ripple': event.target,
      'reverse-ripple': event.target
    };
    $['pages'].selected = 1;
  }

  @reflectable
  void onAngularClick([event, detail]) {
    $['list'].sharedElements = {
      'ripple': event.target,
      'reverse-ripple': event.target
    };
    $['pages'].selected = 2;
  }

  @reflectable
  void onBackClick([event, detail]) {
    $['list'].sharedElements = {
      'ripple': event.target,
      'reverse-ripple': event.target
    };
    $['pages'].selected = 0;
  }


}
