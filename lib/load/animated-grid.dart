@HtmlImport("animated-grid.html")
library using_neon_animation.lib.animated_grid;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/color.dart';
import 'package:polymer_elements/typography.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/ripple_animation.dart';
import 'package:polymer_elements/neon_animation/animations/hero_animation.dart';
import 'dart:html';

@PolymerRegister('animated-grid')
class AnimatedGrid extends PolymerElement
    with
        PolymerBase,
        NeonAnimatableBehavior,
        NeonSharedElementAnimatableBehavior {

  AnimatedGrid.created() : super.created() {
  }


  @property
  List<Map> data = [
    {"value": 1, "color": 'blue'},
    {"value": 2, "color": 'red'},
    {"value": 3, "color": 'blue'},
    {"value": 4, "color": 'green'},
    {"value": 5, "color": 'yellow'},
    {"value": 6, "color": 'blue'},
    {"value": 7, "color": 'red'},
    {"value": 8, "color": 'green'},
    {"value": 9, "color": 'yellow'},
    {"value": 10, "color": 'red'}
  ];

  attached() {

  }

  setupAnimation(){
    // setup animationConfig
    animationConfig = {
      'entry': [{
        'name': 'cascaded-animation',
        'animation': 'transform-animation',
        'transformFrom': 'translateY(100%)',
        'transformTo': 'none',
        'timing': {
          'delay': 50
        },
        'nodes': Polymer.dom(this.root).querySelectorAll('.tile')
      }]
    };
  }

  @reflectable
  String computeTileClass(color) {
    return 'tile $color-300';
  }

}
