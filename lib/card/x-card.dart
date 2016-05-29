/**
 */

@HtmlImport("x-card.html")
library using_neon_animation.lib.card.x_card;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/ripple_animation.dart';
import 'package:polymer_elements/neon_animation/animations/reverse_ripple_animation.dart';
import 'package:polymer_elements/neon_animation/animations/fade_out_animation.dart';
import 'package:polymer_elements/neon_animation/animations/fade_in_animation.dart';

@PolymerRegister('x-card')
class XCard extends PolymerElement
    with
      PolymerBase,
      NeonAnimatableBehavior,
      NeonSharedElementAnimatableBehavior {

  XCard.created() : super.created() {
  }


  ready() {

    sharedElements = {
      'ripple': $['placeholder'],
      'reverse-ripple': $['placeholder']
    };

    // setup animationConfig
    animationConfig = {
      'entry': [
        {
        'name': 'ripple-animation',
        'id': 'ripple',
        'toPage': this
        },
        {
        'name': 'fade-out-animation',
        'node': $['placeholder'],
        'timing': {
          'delay': 250
          }
        },
        {
        'name': 'fade-in-animation',
        'node': $['container'],
        'timing': {
          'delay': 50
          }
        }
      ],

      'exit': [
        {
          'name': 'fade-out-animation',
          'node': $['container'],
          'timing': {
            'duration': 0
          }
        },
        {
          'name': 'fade-in-animation',
          'node': $['placeholder'],
          'timing': {
            'duration': 0
          }
        },
        {
          'name': 'reverse-ripple-animation',
          'id': 'reverse-ripple',
          'fromPage': this
        }
      ]
    };
  }


}
