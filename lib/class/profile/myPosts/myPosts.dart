import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/personal/personalImagePostPageView.dart';
import 'package:flutter_app/class/profile/personal/personalVideoPostPageView.dart';
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

  int userId;
  int _currentIndex = 0;

  double _segmentViewHeight = 44.dp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "帖子";
    LoginUserInfoManager().userId.then((value){
      this.setState(() {
        this.userId = value;
      });
    });
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
              this.userId.isNotValid
                  ? Container()
                  : PersonalImagePostPageView(isLogin: true, userId: this.userId),
              this.userId.isNotValid
                  ? Container()
                  : PersonalVideoPostPageView(isLogin: true, userId: this.userId)
            ],
            onPageChanged: (index){
              this.setState(() {
                this._currentIndex = index;
              });
            },
          ),
        )
      ],
    );
  }

}