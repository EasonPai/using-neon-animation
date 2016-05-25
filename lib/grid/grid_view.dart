@HtmlImport("grid_view.html")
library using_neon_animation.lib.grid_view;

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

@PolymerRegister('grid-view')
class GridView extends PolymerElement
    with
        PolymerBase,
        NeonAnimatableBehavior,
        NeonSharedElementAnimatableBehavior {

  GridView.created() : super.created() {
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

  ready() {
    // setup animationConfig
    animationConfig = {
      'exit': [{
        'name': 'ripple-animation',
        'id': 'ripple',
        'fromPage': this
      }, {
        'name': 'hero-animation',
        'id': 'hero',
        'fromPage': this
      }]
    };


  }

  @reflectable
  String computeTileClass(color) {
    return 'tile $color-300';
  }

	@reflectable
	void onTapped(Event event, [_]) {

		/// Use `Polymer.NeonSharedElementAnimatableBehavior` to implement elements containing shared element
		/// animations.
		sharedElements = {
			'hero': event.currentTarget,
      'ripple': event.currentTarget
		};

    // update gesture value
    animationConfig = {
      'exit': [{
        'name': 'ripple-animation',
        'id': 'ripple',
        'fromPage': this,
        'gesture': {
          "x": _["x"],
          "y": _["y"]
        }
      }, {
        'name': 'hero-animation',
        'id': 'hero',
        'fromPage': this
      }]
    };

		fire("tile-click", detail:{
      "tile": event.currentTarget,
      "data": data[int.parse(event.currentTarget.id)]
    });
	}

}
