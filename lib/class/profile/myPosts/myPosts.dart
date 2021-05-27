import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/personal/fashion_personal_image_post_page_view.dart';
import 'package:flutter_app/class/fashion/personal/fashion_personal_video_post_page_view.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/tools/ASSegmentView.dart';
import 'package:flutter_app/common/extension/extension.dart';

class MyPosts extends BaseContainer {

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  @override
  // TODO: implement isShowBackground
  bool get isShowBackground => false;

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return MyPostsState();
  }
}

class MyPostsState extends BaseContainerState<MyPosts> {

  PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  double _segmentViewHeight = 44.dp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "帖子";
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return Stack(
      children: [
        Container(
          height: _segmentViewHeight,
          child: ASSegmentView(
            currentIndex: this._currentIndex,
            titles: ["帖子", "视频"],
            backgroundColor: Colors.transparent,
            scrollLineColor: CustomColor.hexColor("0xFFC45C"),
            selectFontSize: 17.dpFontSize,
            normalFontSize: 14.dpFontSize,
            scrollLineWidth: 24.dp,
            indexDidChanged: (index){
              this._pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.decelerate
              );
            }
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: _segmentViewHeight),
          child: PageView(
            controller: this._pageController,
            scrollDirection: Axis.horizontal,
            children: [
              FashionPersonalImagePostPageView(isLogin: true),
              FashionPersonalVideoPostPageView(isLogin: true),
            ],
          ),
        )
      ],
    );
  }

}