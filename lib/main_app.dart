/**
 */

@HtmlImport("main_app.html")
library using_neon_animation.lib.main_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:using_neon_animation/grid/grid_index.dart';
import 'package:using_neon_animation/tiles/tiles_index.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement
    with
        PolymerBase{
  MainApp.created() : super.created() {
  }

  int _index = -1;

  @reflectable
  bool computeType(index) {
    return (index == _index)? false : true;
  }


}
