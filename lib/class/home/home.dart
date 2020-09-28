import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';


// ignore: must_be_immutable
class Home extends BaseContainer {
  @override
  BaseContainerState<BaseContainer> getState() {
    return HomeState();
  }
}

class HomeState extends BaseContainerState<Home> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.barType = NavigationBarType.root;
    this.navigationBar.title = "早上好，";
    this.navigationBar.detailTitle = 'MR.superUP';
    this.navigationBar.descriptionText = '用真心对世界微笑';
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}