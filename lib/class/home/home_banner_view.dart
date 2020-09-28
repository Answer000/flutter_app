import 'package:flutter/material.dart';
import 'package:flutter_app/common/tools/customPageView.dart';
import 'dart:async';
import 'package:flutter_app/common/extension/extension.dart';
import 'home_banner_entity.dart';

class HomeBannerView extends StatefulWidget {

  final List<HomeBannerDataBannerList> banners;

  const HomeBannerView({Key key, @required this.banners}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return HomeBannerViewState();
  }
}

class HomeBannerViewState extends State<HomeBannerView> {

  PageController _pageController = PageController(initialPage: 1, viewportFraction: 1.0);

  Timer _timer;
  int _currentIndex = 1;

  List<HomeBannerDataBannerList> _dataSource;
  List<HomeBannerDataBannerList> get dataSource {
    if(_dataSource.isNotValid) {
      if (this.widget.banners.isValid){
        _dataSource = List();
        List<HomeBannerDataBannerList> temp = List();
        temp
          ..add(this.widget.banners.last)
          ..addAll(this.widget.banners)
          ..add(this.widget.banners.first);
        setState(() {
          this._dataSource = temp;
        });
        _setTimer();
        return this._dataSource;
      }
      return List();
    }
    return this._dataSource;
  }

  /// 设置定时器
  _setTimer() {
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      _pageController.animateToPage(_currentIndex + 1,
          duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    });
  }

  @override
  void dispose() {
    super.dispose();
    /// 销毁定时器
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: this.widget.banners.isNotValid ? Container() :
          Stack(
            children: [
              CustomPageView(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (page) {
                  int newIndex;
                  if (page == this.dataSource.length - 1) {
                    newIndex = 1;
                    _pageController.jumpToPage(newIndex);
                  } else if (page == 0) {
                    newIndex = this.dataSource.length - 2;
                    _pageController.jumpToPage(newIndex);
                  } else {
                    newIndex = page;
                  }
                  setState(() {
                    _currentIndex = newIndex;
                  });
                },
                children: this.dataSource.map((item) =>
                    CustomImage.assetNetwork(image: item.picUrl)
                ).toList(),
              ),

              Positioned(
                bottom: 15.0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: this.widget.banners.asMap().map((i, v) =>
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
    );
  }
}