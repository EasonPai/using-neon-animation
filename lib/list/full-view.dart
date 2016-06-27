/**
 */

@HtmlImport("full-view.html")
library using_neon_animation.lib.list.full;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_item_body.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'dart:js' show JsArray, JsObject;

@PolymerRegister('full-view')
class FullView extends PolymerElement
    with
        PolymerBase,
        NeonAnimatableBehavior,
        NeonSharedElementAnimatableBehavior {

  FullView.created() : super.created() {
  }

  ready() {
    // setup animationConfig
    animationConfig = {
      'entry': [
        {'name': 'fade-in-animation', 'node': this.$['button']},
        {'name': 'hero-animation', 'id': 'hero', 'toPage': this}
      ],
      'exit': [
        {'name': 'fade-out-animation', 'node': this.$['button']},
        {
          'name': 'scale-down-animation',
          'node': this.$['main'],
          'transformOrigin': '50% 50%',
          'axis': 'y'
        }
      ]
    };

    this.sharedElements = {'hero': this.$['main']};
  }

  @reflectable
  void onClearButtonClick([_, __]) {
    fire("close");
  }
}
