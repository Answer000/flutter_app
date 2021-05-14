
import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/fashion_base_page_view.dart';
import 'package:flutter_app/class/fashion/personal/fashion_personal_header_view.dart';
import 'package:flutter_app/class/fashion/personal/fashion_personal_image_post_page_view.dart';
import 'package:flutter_app/class/fashion/personal/fashion_personal_menu_view.dart';
import 'package:flutter_app/class/fashion/personal/fashion_personal_video_post_page_view.dart';
import 'package:flutter_app/class/fashion/personal/fashion_personal_viewModel.dart';
import 'package:flutter_app/class/home/home.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/profile_info_entity.dart';
import 'package:flutter_app/common/base/event_manager.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/ASSegmentView.dart';
import 'package:flutter_app/common/tools/ASSliverPersistentHeaderViewDelegate.dart';
import 'package:flutter_app/resource.dart';

class FashionPersonalPageView extends FashionBasePageView {

  bool isLogin;

  Function(bool isLogin) loginStatusDidChanged;

  FashionPersonalPageView({@required this.isLogin, this.loginStatusDidChanged});

  @override
  FashionBasePageViewState<FashionBasePageView> getState() {
    return FashionPersonalPageViewState();
  }
}

class FashionPersonalPageViewState extends FashionBasePageViewState<FashionPersonalPageView> {

  int _currentIndex = 0;

  PageController _pageController;

  FashionPersonalViewModel _viewModel = FashionPersonalViewModel();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true)
      ..addListener(() { });

    _getUserInfo();

    this.widget.loginStatusDidChanged = (isLogin){
      if (isLogin) { _getUserInfo(); }
    };
  }

  _getUserInfo() {
    _viewModel.getUserInfo(callback: () => this.setState(() { }) );
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      child: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return [
            SliverList(
              delegate: SliverChildBuilderDelegate((content, index) {
                return Container(
                  margin: EdgeInsets.only(top: 30.dp, bottom: 20.dp),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FashionPersonalHeaderView(
                        isLogin: this.widget.isLogin,
                        userAvatar: this._viewModel.userAvatar,
                        nickName: this._viewModel.nickName,
                        userNo: this._viewModel.userNo,
                        sex: this._viewModel.sex,
                      ),
                      FashionPersonalMenuView(
                        isLogin: this.widget.isLogin,
                        fansCount: this._viewModel.fansNum,
                        followsCount: this._viewModel.attentionNum,
                        likesCount: this._viewModel.praiseNums,
                      ),
                    ],
                  ),
                );
              }, childCount: 1),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: ASSliverPersistentHeaderViewDelegate(
                maxExtentValue: 44.dp,
                minExtentValue: 44.dp,
                child: Container(
                  child: ASSegmentView(
                    currentIndex: this._currentIndex,
                    titles: ["帖子", "视频"],
                    selectFontSize: 20.dpFontSize,
                    normalFontSize: 15.dpFontSize,
                    selectFontWeight: FontWeight.w500,
                    scrollLineColor: Colors.white,
                    scrollLineWidth: 18.dp,
                    backgroundColor: CustomColor.blackGroundColor,
                    indexDidChanged: (index){
                      print(index);
                      this._pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.decelerate
                      );
                    },
                  ),
                )
              ),
            ),
          ];
        },
        body: Container(
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            children: [
              FashionPersonalImagePostPageView(isLogin: this.widget.isLogin),
              FashionPersonalVideoPostPageView(isLogin: this.widget.isLogin),
            ],
            onPageChanged: (index){
              this.setState(() {
                this._currentIndex = index;
              });
            },
          ),
        ),
      )
    );
  }

}
