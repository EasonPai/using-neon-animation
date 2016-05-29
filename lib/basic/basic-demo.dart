/**
 */

@HtmlImport("basic-demo.html")
library using_neon_animation.lib.basic.demo;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:using_neon_animation/basic/my-animatable.dart';
import 'package:using_neon_animation/basic/my-dialog.dart';

@PolymerRegister('basic-demo')
class BasicDemo extends PolymerElement
    with
        PolymerBase{
  BasicDemo.created() : super.created() {
  }


  ready() {

  }

  @reflectable
  void onCircleButtonClick([_, detail]) {
    ($$("my-animatable") as MyAnimatable).play();
  }

  @reflectable
  void onDialogButtonClick([_, detail]) {

    var node = ($$("my-dialog") as MyDialog);
    if (node.opened) {
      node.hide();
    } else {
      node.show();
    }
  }


}
