import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_page_view.dart';
import 'package:flutter_app/class/fashion/personal/fashion_personal_page_view.dart';
import 'package:flutter_app/class/fashion/recommend/fashion_recommend_page_view.dart';
import 'package:flutter_app/class/fashion/fashion_segment_view.dart';
import 'package:flutter_app/class/fashion/video/fashion_video_page_view.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';
import 'package:flutter_app/common/base/empty_view.dart';
import 'package:flutter_app/common/base/event_manager.dart';
import 'package:flutter_app/common/tools/ASSegmentView.dart';
import 'package:flutter_app/resource.dart';
import 'package:flutter_app/common/extension/extension.dart';


// ignore: must_be_immutable
class Fashion extends BaseContainer {

  @override
  BaseContainerState<BaseContainer> getState() {
    return FashionState();
  }

  @override
  NavigationBarType get navigationBarType => NavigationBarType.root;

  @override
  bool get isWantKeepAlive => false;
}

class FashionState extends BaseContainerState<Fashion> {

  PageController _pageController;

  int _currentIndex = 0;

  double _segmentViewHeight = 44.dp;

  bool isLogin = false;

  Function(bool isLogin) loginStatusDidChanged;

  FashionPersonalPageView _personalPageView;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "美IN，";
    this.navigationBar.detailTitle = '美超你的想象';
    this.navigationBar.descriptionText = '用真心对世界微笑';
    this.navigationBar.addRightItem(
      iconName: ImageName.cjm_navigationBar_publish.imagePath,
      size: Size(25.dp, 25.dp),
      margin: EdgeInsets.only(right: 28.dp),
    );

    _pageController = PageController(initialPage: 0, keepPage: true)
      ..addListener(() { });

    LoginUserInfoManager().isLogin.then((value) => this.isLogin = value);

    /// 监听登录状态变化
    eventManager.add(EventName.login, (isLogin) {
      setState(() {
        this.isLogin = isLogin;
      });
      if(this.loginStatusDidChanged != null) {
        this.loginStatusDidChanged(isLogin);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    eventManager.remove(EventName.login);
  }

  @override
  Widget setContentView(BuildContext context) {
    _personalPageView = FashionPersonalPageView(
      isLogin: this.isLogin,
    );
    this.loginStatusDidChanged = _personalPageView.loginStatusDidChanged;

    return Container(
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: _segmentViewHeight,
            child: ASSegmentView(
              currentIndex: this._currentIndex,
              titles: ["精选","关注","视频","主页"],
              normalFontSize: 14.dpFontSize,
              selectFontSize: 17.dpFontSize,
              scrollLineColor: CustomColor.mainRedColor,
              scrollLineWidth: 18.dp,
              backgroundColor: Colors.transparent,
              height: 44.dp,
              indexDidChanged: (index){
                this._pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.decelerate
                );
              },
            ),
          ),
          Positioned(
            top: _segmentViewHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: PageView(
              controller: this._pageController,
              children: [
                FashionRecommendPageView(),
                FashionAttentionPageView(isLogin: this.isLogin),
                FashionVideoPageView(),
                _personalPageView,
              ],
              onPageChanged: (index){
                setState(() {
                  this._currentIndex = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}