@HtmlImport("squares-page.html")
library using_neon_animation.lib.squares_page;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'dart:html';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/color.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/transform_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_up_animation.dart';
import 'package:polymer_elements/neon_animation/animations/scale_down_animation.dart';
import 'package:polymer_elements/neon_animation/animations/cascaded_animation.dart';
import 'package:polymer_elements/neon_animation/animations/hero_animation.dart';
import 'package:polymer_elements/neon_animation/animations/fade_in_animation.dart';
import 'package:polymer_elements/neon_animation/animations/fade_out_animation.dart';

@PolymerRegister('squares-page')
class SquaresPage extends PolymerElement
    with
        PolymerBase,
        NeonAnimatableBehavior,
        NeonSharedElementAnimatableBehavior {
  SquaresPage.created() : super.created() {}

  List squaresArray;

  ready() {
    squaresArray = Polymer.dom(this.root).querySelectorAll('.square');

    sharedElements = {'hero': $['header']};

    // setup animationConfig

    animationConfig = {
      'entry': [
//        {'name': 'hero-animation', 'id': 'hero', 'toPage': this},
//        {
//          'name': 'cascaded-animation',
//          'animation': 'transform-animation',
//          'transformFrom': 'translateY(60vh)',
//          'nodes': squaresArray
//        },
        {
          'name': 'fade-in-animation',
          'nodes': squaresArray,
          'timing': {'delay': 250}
        }
      ],
      'exit': [
        {'name': 'slide-up-animation', 'node': $['header']},
        {
          'name': 'cascaded-animation',
          'animation': 'transform-animation',
          'transformTo': 'translateY(60vh)',
          'nodes': squaresArray
        }
      ]
    };
  }
}
