import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';

class MyCoupons extends BaseContainer {

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return MyCouponsState();
  }
}

class MyCouponsState extends BaseContainerState<MyCoupons> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "优惠券";
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return Container();
  }

}