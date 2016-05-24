/**
 */

@HtmlImport("card_view.html")
library using_neon_animation.lib.card_view;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/fade_out_animation.dart';
import 'package:polymer_elements/neon_animation/animations/transform_animation.dart';
import 'package:polymer_elements/neon_animation/animations/ripple_animation.dart';
import 'package:polymer_elements/neon_animation/animations/hero_animation.dart';

@PolymerRegister('card-view')
class CardView extends PolymerElement
    with
        PolymerBase,
        NeonAnimatableBehavior,
        NeonSharedElementAnimatableBehavior {

  CardView.created() : super.created() {
  }

  ready() {

    // setup animationConfig
    animationConfig = {
      'entry': [{
        'name': 'ripple-animation',
        'id': 'ripple',
        'toPage': this,
      }, {
        'name': 'hero-animation',
        'id': 'hero',
        'toPage': this,
        'timing': {
          'delay': 150
        }
      }],
      'exit': [{
        'name': 'fade-out-animation',
        'node': $['fixed']
      }, {
        'name': 'transform-animation',
        'transformFrom': 'none',
        'transformTo': 'translate(0px,-200vh) scale(0.9,1)',
        'node': $['card']
      }]
    };

    sharedElements = {
      'hero': $['card'],
      'ripple': $['fixed']
    };

  }

  @property
  String color = "";

  @reflectable
  String computeCardClass(color) {
    String cls = 'card';
    if (color!=null) {
      // TODO: workaround to use material colors provided by mdl/dart
      cls += ' ' + color + '-300';
    }
    return cls;
  }

  @reflectable
  String computeFixedBackgroundClass(color) {
    String cls = 'fixed';
    if (color!=null) {
      // TODO: workaround to use material colors provided by mdl/dart
      cls += ' ' + color + '-100';
    }
    return cls;
  }

  @reflectable
  void onClearButtonClick([_, __]) {
    print("onClearButtonClick");
    fire("close");
  }

}
