import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';
import 'package:flutter_app/common/tools/customPageView.dart';
import 'dart:async';
import 'package:flutter_app/common/extension/extension.dart';
import 'homeViewModel.dart';
import 'home_banner_entity.dart';


// ignore: must_be_immutable
class Home extends BaseContainer {
  @override
  BaseContainerState<BaseContainer> getState() {
    return HomeState();
  }
}

class HomeState extends BaseContainerState<Home> with TickerProviderStateMixin {

  PageController _pageController = PageController(initialPage: 1, viewportFraction: 1.0);

  Timer _timer;
  int _currentIndex = 1;

  HomeViewModel _viewModel = HomeViewModel();

  List<HomeBannerDataBannerList> _dataSource = List();
  List<HomeBannerDataBannerList> _banners = List();
  List<HomeBannerDataBannerList> get banners => _banners;
  set banners(List<HomeBannerDataBannerList> value) {
    if (value.isValid) {
      List<HomeBannerDataBannerList> temp = List();
      temp..add(value.last)
        ..addAll(value)
        ..add(value.first);
      setState(() {
        this._banners = value;
        this._dataSource = temp;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.barType = NavigationBarType.root;
    this.navigationBar.title = "早上好，";
    this.navigationBar.detailTitle = 'MR.superUP';
    this.navigationBar.descriptionText = '用真心对世界微笑';

    _loadBanner();
  }

  /// 设置定时器
  _setTimer() {
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      _pageController.animateToPage(_currentIndex + 1,
          duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    });
  }

  /// 请求轮播图数据
  _loadBanner() async {
    await _viewModel.loadBannerSources((banners){
      if(banners.isValid) {
        setState(() {
          this.banners = banners;
        });
        if(banners.isValid) { _setTimer(); }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 335.dp,
            child: NotificationListener(
              // ignore: missing_return
              onNotification: (ScrollNotification notification) {
                if (notification.depth == 0 &&
                    notification is ScrollStartNotification) {
                  if (notification.dragDetails != null) {
                    _timer.cancel();
                  }
                } else if (notification is ScrollEndNotification) {
                  _timer.cancel();
                  _setTimer();
                }
              },
              child: _banners.isNotValid ? Container() :
              Stack(
                children: [
                  CustomPageView(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (page) {
                      int newIndex;
                      if (page == this._dataSource.length - 1) {
                        newIndex = 1;
                        _pageController.jumpToPage(newIndex);
                      } else if (page == 0) {
                        newIndex = this._dataSource.length - 2;
                        _pageController.jumpToPage(newIndex);
                      } else {
                        newIndex = page;
                      }
                      setState(() {
                        _currentIndex = newIndex;
                      });
                    },
                    children: this._dataSource.map((item) =>
                        CustomImage.memoryNetwork(image: item.picUrl)
                    ).toList(),
                  ),

                  Positioned(
                    bottom: 15.0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: this.banners.asMap().map((i, v) =>
                          MapEntry(i, Container(
                            width: 10.dp,
                            height: 10.dp,
                            margin: EdgeInsets.only(left: i == 0 ? 0 : 9.dp),
                            decoration: ShapeDecoration(
                                color: _currentIndex == i + 1
                                    ? Color(0xffffc45c)
                                    : Colors.white,
                                shape: CircleBorder()),
                          ))).values.toList(),
                    ),
                  ),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}