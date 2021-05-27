import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';

class MyDiary extends BaseContainer {

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return MyDiaryState();
  }
}

class MyDiaryState extends BaseContainerState<MyDiary> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "美丽日记";
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return Container();
  }

}