/**
 */

@HtmlImport("card_view.html")
library using_neon_animation.lib.card_view;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_item_body.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animation_behavior.dart';
import 'package:polymer_elements/neon_animation_runner_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/fade_in_animation.dart';
import 'package:polymer_elements/neon_animation/animations/fade_out_animation.dart';
import 'package:polymer_elements/neon_animation/animations/transform_animation.dart';
import 'package:polymer_elements/neon_animation/animations/ripple_animation.dart';
import 'package:polymer_elements/neon_animation/animations/hero_animation.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'dart:js' show JsArray, JsObject;

@PolymerRegister('card-view')
class CardView extends PolymerElement
    with
        PolymerBase,
        NeonAnimatableBehavior,
        NeonAnimationRunnerBehavior {

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

    this.sharedElements = {
      'hero': $['card'],
      'ripple': $['fixed']
    };

  }

  @property
  String color = "";

  @reflectable
  String computeCardClass(color) {
    print("computeCardClass > $color");
    String cls = 'card';
    if (color!=null) {
      cls += ' mdl-color--' + color + '-300';
    }
    return cls;
  }

  @reflectable
  String computeFixedBackgroundClass(color) {

    print("computeFixedBackgroundClass > $color");
    String cls = 'fixed';
    if (color!=null) {
      cls += ' mdl-color--' + color + '-100';
    }
        return cls;
  }

  @reflectable
  void onClearButtonClick([_, __]) {
    print("onClearButtonClick");
    fire("close");
  }

  /// A map of shared element id to node.
  get sharedElements => jsElement[r'sharedElements'];
  set sharedElements(value) {
    jsElement[r'sharedElements'] = (value is Map ||
            (value is Iterable && value is! JsArray))
        ? new JsObject.jsify(value)
        : value;
  }
}
