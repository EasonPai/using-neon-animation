/**
 */

@HtmlImport("declarative-demo.html")
library using_neon_animation.lib.declarative.demo;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';
import 'package:polymer_elements/neon_animation/animations/slide_from_left_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_from_right_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_right_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_left_animation.dart';
import 'package:polymer_elements/neon_animation/animations/slide_left_animation.dart';

@PolymerRegister('declarative-demo')
class DeclarativeDemo extends PolymerElement
    with
      PolymerBase,
      NeonAnimatableBehavior {

  DeclarativeDemo.created() : super.created() {
  }

  @property
  int selected = 0;

  ready() {

  }

  @reflectable
  void onPrevClick([_, detail]) {
    this.entryAnimation = 'slide-from-left-animation';
    this.exitAnimation = 'slide-right-animation';
    this.selected = this.selected == 0 ? 4 : (this.selected - 1);
    set("selected", selected);
  }
  @reflectable
  void onNextClick([_, detail]) {
    this.entryAnimation = 'slide-from-right-animation';
    this.exitAnimation = 'slide-left-animation';
    this.selected = this.selected == 4 ? 0 : (this.selected + 1);
    set("selected", selected);
  }
  @reflectable
  void onUpClick([_, detail]) {
    this.entryAnimation = 'slide-from-top-animation';
    this.exitAnimation = 'slide-down-animation';
    this.selected = this.selected == 4 ? 0 : (this.selected + 1);
    set("selected", selected);
  }
  @reflectable
  void onDownClick([_, detail]) {
    this.entryAnimation = 'slide-from-bottom-animation';
    this.exitAnimation = 'slide-up-animation';
    this.selected = this.selected == 0 ? 4 : (this.selected - 1);
    set("selected", selected);
  }


}
