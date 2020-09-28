import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';


// ignore: must_be_immutable
class Publish extends BaseContainer {
  @override
  BaseContainerState<BaseContainer> getState() {
    return PublishState();
  }
}

class PublishState extends BaseContainerState<Publish> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.isShowNavigationBar = false;
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.2),
    );
  }
}