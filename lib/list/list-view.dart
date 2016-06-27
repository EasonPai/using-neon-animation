@HtmlImport("list-view.html")
library using_neon_animation.lib.list.list;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'dart:html';
import 'dart:js' show JsArray, JsObject;

@PolymerRegister('list-view')
class ListView extends PolymerElement
		with
		PolymerBase,
		NeonAnimatableBehavior,
    NeonSharedElementAnimatableBehavior {

  ListView.created() : super.created() {
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

  @Listen("click")
  void onItemClick([event, detail]) {
    Element target = event.target;

    // configure the page animation
    this.sharedElements = {
      'hero': target.parentNode,
    };

    fire('item-click', detail:{
      "item": target
    });
  }
}
