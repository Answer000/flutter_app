import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/personal/personalHeaderView.dart';
import 'package:flutter_app/class/profile/personal/personalImagePostPageView.dart';
import 'package:flutter_app/class/profile/personal/personalMenuView.dart';
import 'package:flutter_app/class/profile/personal/personalVideoPostPageView.dart';
import 'package:flutter_app/class/profile/personal/personalViewModel.dart';
import 'package:flutter_app/common/base/event_manager.dart';
import 'package:flutter_app/common/tools/ASSegmentView.dart';
import 'package:flutter_app/common/tools/ASSliverPersistentHeaderViewDelegate.dart';
import 'package:flutter_app/common/extension/extension.dart';

class Personal extends StatefulWidget {

  int userId;
  Personal({@required this.userId});

  PersonalState _personalState = PersonalState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _personalState;
  }
}

class PersonalState extends State<Personal> {

  PersonalViewModel _viewModel;

  int _currentIndex = 0;

  PageController _pageController;

  bool _isLogin = false;

  @override
  void initState() {
    super.initState();

    LoginUserInfoManager().isLogin.then((value){
      this.setState(() {
        this._isLogin = value;
      });
    });

    _pageController = PageController(
        initialPage: 0,
        keepPage: true
    )..addListener(() { });

    /// 监听登录状态变化
    eventManager.add(EventName.login, (isLogin) {
      setState(() {
        this._isLogin = isLogin;
      });
    });

    _viewModel = PersonalViewModel(userId: this.widget.userId);
    _getUserInfo();
  }

  _getUserInfo() {
    _viewModel.getUserInfo(callback: () => this.setState(() { }) );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eventManager.remove(EventName.login);
  }

  @override
  Widget build(BuildContext context) {
    bool hasData = this._viewModel.userData != null;
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
                        PersonalHeaderView(
                          isLogin: this._isLogin,
                          userId: this.widget.userId,
                          infoData: this._viewModel.userData,
                        ),

                        PersonalMenuView(
                          isLogin: this._isLogin,
                          fansCount: hasData ? this._viewModel.userData.user.fansNum : 0,
                          followsCount: hasData ? this._viewModel.userData.user.attentionNum : 0,
                          likesCount: hasData ? this._viewModel.userData.user.praiseNums : 0,
                        ),
                      ],
                    ),
                  );
                }, childCount: 1),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
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
                PersonalImagePostPageView(isLogin: this._isLogin, userId: this.widget.userId),
                PersonalVideoPostPageView(isLogin: this._isLogin, userId: this.widget.userId),
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