@HtmlImport("circles-page.html")
library using_neon_animation.lib.circles_page;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/color.dart';
import 'package:polymer_elements/typography.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/scale_up_animation.dart';
import 'package:polymer_elements/neon_animation/animations/scale_down_animation.dart';
import 'package:polymer_elements/neon_animation/animations/cascaded_animation.dart';
import 'package:polymer_elements/neon_animation/animations/hero_animation.dart';
import 'dart:html';

@PolymerRegister('circles-page')
class CirclesPage extends PolymerElement
    with
        PolymerBase,
        NeonAnimatableBehavior,
        NeonSharedElementAnimatableBehavior {

  CirclesPage.created() : super.created() {
  }


  List circlesArray;
  Map cacheAnimationConfig;

  ready() {

    circlesArray = Polymer.dom(this.root).querySelectorAll('.circle');

    // setup animationConfig
    animationConfig = cacheAnimationConfig = {
      'entry': [{
        'name': 'cascaded-animation',
        'animation': 'scale-up-animation',
        'nodes': circlesArray
      }],
      'exit': [{
        'name': 'hero-animation',
        'id': 'hero',
        'fromPage': this
      }, {
        'name': 'cascaded-animation',
        'animation': 'scale-down-animation'
      }]
    };

  }

  @reflectable
  void onTapped(Event event, [_]) {

    sharedElements = {
      'hero': event.currentTarget
    };

    List nodesToScale = [];

    for (int index = 0; index < circlesArray.length; index++) {
      if (circlesArray[index] != event.currentTarget) {
        nodesToScale.add(circlesArray[index]);
      }
    }
    cacheAnimationConfig['exit'][1]['nodes'] = nodesToScale;

    // apply animation config
    animationConfig = cacheAnimationConfig;

    fire("circle-click", detail:{});
  }


}
