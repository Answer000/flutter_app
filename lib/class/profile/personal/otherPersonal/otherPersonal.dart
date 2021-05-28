import 'package:flutter/cupertino.dart';
import 'package:flutter_app/class/profile/personal/personal.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/extension/extension.dart';

class OtherPersonal extends BaseContainer {

  int userId;

  OtherPersonal(this.userId);

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return OtherPersonalState();
  }

  @override
  // TODO: implement isShowBackground
  bool get isShowBackground => false;

  @override
  // TODO: implement isShowNavigationBar
  bool get isShowNavigationBar => true;
}

class OtherPersonalState extends BaseContainerState<OtherPersonal> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.isShowLogo = false;
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return this.widget.userId.isNotValid
        ? Container()
        : Personal(userId: this.widget.userId);
  }
}