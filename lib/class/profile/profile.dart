import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';


// ignore: must_be_immutable
class Profile extends BaseContainer {
  @override
  BaseContainerState<BaseContainer> getState() {
    return ProfileState();
  }
}

class ProfileState extends BaseContainerState<Profile> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.barType = NavigationBarType.root;
    this.navigationBar.title = "我的，";
    this.navigationBar.detailTitle = '最美的';
    this.navigationBar.descriptionText = '用真心对世界微笑';
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      color: Colors.cyan,
    );
  }
}