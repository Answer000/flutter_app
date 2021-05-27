import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';

class MyCollections extends BaseContainer {

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return MyCollectionsState();
  }
}

class MyCollectionsState extends BaseContainerState<MyCollections> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "收藏";
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return Container();
  }

}