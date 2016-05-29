/**
 */

@HtmlImport("my-animatable.html")
library using_neon_animation.lib.basic.my_animatable;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'dart:html';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation_runner_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/transform_animation.dart';
import 'package:polymer_elements/neon_animation/animations/scale_down_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_down_animation.dart';

@PolymerRegister('my-animatable')
class MyAnimatable extends PolymerElement
    with NeonAnimatableBehavior, NeonAnimationRunnerBehavior {
  MyAnimatable.created() : super.created() {
  }

  Element squareNode;

  attached() {

    animationConfig = {
      'entry': [
        {
          'name': 'scale-down-animation',
          'node': this
        }
      ]
    };

  }

  void play() {
    playAnimation('entry', null);
  }

  @Listen("neon-animation-finish")
  void onNeonAnimationFinish([_, detail]) {
    print('animation finish!');
  }


}
