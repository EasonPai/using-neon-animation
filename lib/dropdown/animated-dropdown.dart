/**
 */

@HtmlImport("animated-dropdown.html")
library using_neon_animation.lib.dropdown.animated_dropdown;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'dart:html';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation_runner_behavior.dart';

@PolymerRegister('animated-dropdown')
class AnimatedDropdown extends PolymerElement
    with
      NeonAnimatableBehavior,
      NeonAnimationRunnerBehavior {
  AnimatedDropdown.created() : super.created() {
  }

  Element squareNode;
  bool _showing = false;

  attached() {

    animationConfig = {
      'entry': [{
        'name': 'scale-up-animation',
        'node': this,
        'transformOrigin': '0 0'
      }],
      'exit': [{
        'name': 'fade-out-animation',
        'node': this
      }]
    };

  }

  @Listen("neon-animation-finish")
  void onAnimationFinish([_, detail]) {
    if (this._showing) {
    } else {
      this.style.display = '';
    }
  }

  void show() {
    this.style.display = 'inline-block';
    this._showing = true;
    this.playAnimation('entry', null);

  }

  void hide() {
    this._showing = false;
    this.playAnimation('exit', null);
  }


}
