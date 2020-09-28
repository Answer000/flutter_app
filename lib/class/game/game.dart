import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';


// ignore: must_be_immutable
class Game extends BaseContainer {
  @override
  BaseContainerState<BaseContainer> getState() {
    return GameState();
  }
}

class GameState extends BaseContainerState<Game> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.isShowNavigationBar = false;
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    );
  }
}