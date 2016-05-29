/**
 */

@HtmlImport("x-cards-list.html")
library using_neon_animation.lib.card.x_cards_list;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/ripple_animation.dart';
import 'package:polymer_elements/neon_animation/animations/reverse_ripple_animation.dart';
import 'package:polymer_elements/neon_animation/animations/fade_out_animation.dart';

@PolymerRegister('x-cards-list')
class XCardsList extends PolymerElement
    with
      PolymerBase,
      NeonAnimatableBehavior,
      NeonSharedElementAnimatableBehavior {

  XCardsList.created() : super.created() {
  }


  ready() {

    // setup animation
    animationConfig = {
      'entry': [{
        'name': 'reverse-ripple-animation',
        'id': 'reverse-ripple',
        'toPage': this
      }],
      'exit': [{
        'name': 'fade-out-animation',
        'node': $['container'],
        'timing': {
          'delay': 150,
          'duration': 10
        }
      }, {
        'name': 'ripple-animation',
        'id': 'ripple',
        'fromPage': this
      }]
    };


  }


}
