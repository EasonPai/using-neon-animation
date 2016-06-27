@HtmlImport("list-view.html")
library using_neon_animation.lib.list.list;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:dart_dynamics/app/app.dart';
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
import 'package:polymer_elements/neon_animation/animations/transform_animation.dart';
import 'package:polymer_elements/neon_animation/animations/hero_animation.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'dart:html';
import 'dart:js' show JsArray, JsObject;

@PolymerRegister('list-view')
class ListView extends PolymerElement
		with
		PolymerBase,
		NeonAnimatableBehavior,
		NeonSharedElementAnimatableBehavior {

  ListView.created() : super.created() {
    setupPage(localName);
  }

  @property
  List<Map> itemsData = [];

  ready() {
    // setup animationConfig
    animationConfig = {
      'entry': [
        {'name': 'fade-in-animation', 'node': this.$['button']}
      ],
      'exit': [
        {'name': 'fade-out-animation', 'node': this.$['button']},
        {'name': 'hero-animation', 'id': 'hero', 'fromPage': this}
      ]
    };
  }

  @reflectable
  void itemSelected(Event event, [_]) {
    this.sharedElements = {'hero': event.currentTarget};
    fire("item-click", detail: {"item": event.currentTarget});
  }
}
