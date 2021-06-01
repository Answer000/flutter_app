import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';

class VideoPostDetail extends BaseContainer {

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return VideoPostDetailState();
  }
}

class VideoPostDetailState extends BaseContainerState<VideoPostDetail> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.isShowLogo = false;
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return Container();
  }
}