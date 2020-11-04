import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';


// ignore: must_be_immutable
class Game extends BaseContainer {
  @override
  BaseContainerState<BaseContainer> getState() {
    return GameState();
  }

  @override
  bool get isShowNavigationBar => false;
}

class GameState extends BaseContainerState<Game> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    );
  }
}