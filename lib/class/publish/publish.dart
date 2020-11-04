import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/tools/custom_route.dart';


// ignore: must_be_immutable
class Publish extends BaseContainer {

  @override
  bool get isNeedLogin => true;

  @override
  CustomRouteModalType get modalType => CustomRouteModalType.transparent;

  @override
  bool get isShowNavigationBar => false;

  @override
  BaseContainerState<BaseContainer> getState() {
    return PublishState();
  }
}

class PublishState extends BaseContainerState<Publish> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
    );
  }
}