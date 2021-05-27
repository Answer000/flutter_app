import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';

class MyFeedback extends BaseContainer {

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return MyFeedbackState();
  }
}

class MyFeedbackState extends BaseContainerState<MyFeedback> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "意见反馈";
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return Container();
  }

}