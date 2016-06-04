/**
 */

@HtmlImport("full-page.html")
library using_neon_animation.lib.load.full_page;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation_runner_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/slide_from_left_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_from_right_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_right_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_left_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_left_animation.dart';
import 'package:using_neon_animation/load/animated-grid.dart';

@PolymerRegister('full-page')
class FullPage extends PolymerElement
    with
      PolymerBase,
      NeonAnimatableBehavior,
      NeonAnimationRunnerBehavior  {

  FullPage.created() : super.created() {
  }

  ready() {

    animationConfig = {
      'entry': [{
        'name': 'slide-from-left-animation',
        'node': $['toolbar']
      },{
        'animatable': $['grid'],
        'type': 'entry'
      }]
    };

  }

  show() {

    // we control the setup process by our own
    $['grid'].setupAnimation();

    this.style.visibility = 'visible';
    playAnimation('entry', null);
  }


}
