@HtmlImport("grid_view.html")
library using_neon_animation.lib.grid_view;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/color.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/demo_pages_shared_styles.dart';
import 'package:polymer_elements/paper_material_shared_styles.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_item_body.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation_runner_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'package:polymer_elements/neon_shared_element_animation_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/transform_animation.dart';
import 'package:polymer_elements/neon_animation/animations/ripple_animation.dart';
import 'package:polymer_elements/neon_animation/animations/hero_animation.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'dart:html';
import 'dart:js' show JsArray, JsObject;

@PolymerRegister('grid-view')
class GridView extends PolymerElement
    with
        PolymerBase,
        NeonAnimatableBehavior,
        NeonAnimationRunnerBehavior {

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
//    return 'tile ' + color + '-300';
    return 'tile mdl-color--' + color + '-300';
//    return 'tile light-primary-color';
  }

	/// A map of shared element id to node.
	get sharedElements => jsElement[r'sharedElements'];
	set sharedElements(value) { jsElement[r'sharedElements'] = (value is Map || (value is Iterable && value is! JsArray)) ? new JsObject.jsify(value) : value;}


	@reflectable
	void itemSelected(Event event, [_]) {

		// success
    print(" (2) itemSelected , index = ${($['neoGridView'] as DomRepeat).modelForElement(event.target).index}");
    print(" (3) selected item, index = ${event.currentTarget.id}");


		/// Use `Polymer.NeonSharedElementAnimatableBehavior` to implement elements containing shared element
		/// animations.
		this.sharedElements = {
			'hero': event.currentTarget,
      'ripple': event.currentTarget
		};

    this.animationConfig['exit'][0]['gesture'] = {
//      "x": _.x || event.pageX,
//      "y": _.y || event.pageY
      "x": _["x"],
      "y": _["y"]
    };

		fire("tile-click", detail:{
      "tile": event.currentTarget,
      "data": data[($['neoGridView'] as DomRepeat).modelForElement(event.target).index]});
	}

}
