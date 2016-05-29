/**
 */

@HtmlImport("my-dialog.html")
library using_neon_animation.lib.basic.my_dialog;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'dart:html';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation_runner_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/scale_up_animation.dart';
import 'package:polymer_elements/neon_animation/animations/fade_out_animation.dart';

@PolymerRegister('my-dialog')
class MyDialog extends PolymerElement
    with NeonAnimatableBehavior, NeonAnimationRunnerBehavior {
  MyDialog.created() : super.created() {
  }

  Element squareNode;
  bool opened = false;

  attached() {

    animationConfig = {
      'entry': [{
        'name': 'scale-up-animation',
        'node': this
      }],
      'exit': [{
        'name': 'fade-out-animation',
        'node': this
      }]
    };

  }

  void show() {
    this.opened = true;
    this.style.display = 'inline-block';
    playAnimation('entry', null);
  }

  void hide() {
    this.opened = false;
    playAnimation('exit', null);
  }

  @Listen("neon-animation-finish")
  void onNeonAnimationFinish([_, detail]) {
    if (!this.opened) {
      this.style.display = '';
    }
  }


}
