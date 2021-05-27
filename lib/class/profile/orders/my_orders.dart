import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';

class MyOrders extends BaseContainer {

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return MyOrdersState();
  }
}

class MyOrdersState extends BaseContainerState<MyOrders> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "订单";
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return Container();
  }

}