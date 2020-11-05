import 'package:flutter/material.dart';
import 'package:flutter_app/class/home/home_page_view.dart';
import 'package:flutter_app/class/home/home_section_header_view.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';
import 'package:flutter_app/common/tools/customPageView.dart';
import 'dart:async';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_loading.dart';
import 'package:flutter_app/resource.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'homeViewModel.dart';
import 'home_banner_entity.dart';
import 'home_banner_view.dart';
import 'home_menu_view.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';


// ignore: must_be_immutable
class Home extends BaseContainer {
  @override
  BaseContainerState<BaseContainer> getState() {
    return HomeState();
  }

  @override
  NavigationBarType get navigationBarType => NavigationBarType.root;
}

class HomeState extends BaseContainerState<Home> {

  PageController _pageController;

  int _selectIndex = 0;

  HomeViewModel _viewModel = HomeViewModel();

  List<HomeBannerDataBannerList> _banners = List();

  double _leftValue = 1.0;
  double _rightValue = 0.0;

  double _bannerViewHeight = 335.dp;
  double _menuViewHeight = 146.dp;
  double _sectionHeaderViewHeight = 44.dp;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: this._selectIndex,
      keepPage: true,
      viewportFraction: 1.0,
    )..addListener(() {
      double value = _pageController.offset / Screen.width;
      if(value > 1) { value = 1; }
      if(value < 0) { value = 0; }
      setState(() {
        this._leftValue = 1 - value;
        this._rightValue = value;
      });
    });

    this.navigationBar.title = "早上好，";
    this.navigationBar.detailTitle = 'MR.superUP';
    this.navigationBar.descriptionText = '用真心对世界微笑';
    this.navigationBar.addRightItem(
        iconName: ImageName.cjm_home_scan.imagePath,
        size: Size(20.dp,30.dp),
        margin: EdgeInsets.only(right: 24.dp),
        onPress: (){

        }
    ).addRightItem(
        iconName: ImageName.cjm_home_message.imagePath,
        size: Size(20.dp,30.dp),
        margin: EdgeInsets.only(right: 12.dp),
        onPress: (){
        }
    );

    _loadBanner();
  }

  /// 请求轮播图数据
  _loadBanner({BuildContext context, Function callback}) async {
    if(context != null) {
      CustomLoading.showLoading(context: context);
    }
    await _viewModel.loadBannerSources((banners){
      if(banners.isValid) {
        setState(() {
          this._banners = banners;
        });
      }
      if(context != null) { CustomLoading.hideLoading(context: context); }
      if(callback != null) { callback(); }
    });
  }

  @override
  Widget setContentView(BuildContext context) {
    return CustomRefresher(
        onRefresh: (controller){
          _loadBanner(callback: (){
            controller.refreshCompleted();
          });
        },
        onLoading: (controller){
          controller.loadComplete();
        },
        child: NestedScrollView(
          scrollDirection: Axis.vertical,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverList(
                delegate: SliverChildBuilderDelegate((content, index) {
                  switch(index) {
                    case 0:
                      return HomeBannerView(
                        banners: this._banners,
                        viewHeight: this._bannerViewHeight,
                      );
                    case 1:
                      return HomeMenuView(
                        viewHeight: this._menuViewHeight,
                      );
                    default: return Container();
                  }
                }, childCount: 2),
              ),

              SliverPersistentHeader(
                pinned: true,
                delegate: HomeHeaderViewDelegate(
                  maxExtentValue: this._sectionHeaderViewHeight,
                  minExtentValue: this._sectionHeaderViewHeight,
                  child: HomeSectionHeaderView(
                    leftValue: this._leftValue,
                    rightValue: this._rightValue,
                    viewHeight: this._sectionHeaderViewHeight,
                    indexDidChanged: (index){
                      this._pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 250),
                          curve: Curves.decelerate
                      );
                    },
                  ),
                ),
              ),
            ];
          },
          body: PageView(
            controller: this._pageController,
            scrollDirection: Axis.horizontal,
            children: [
              HomePageView(type: HomePageViewType.saveBeauty,),
              HomePageView(type: HomePageViewType.nightBeauty,),
            ],
            onPageChanged: (index){
              setState(() {
                this._selectIndex = index;
              });
            },

          ),
        )
    );
  }
}

class HomeHeaderViewDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxExtentValue;
  final double minExtentValue;

  HomeHeaderViewDelegate({
    @required this.child,
    @required this.maxExtentValue,
    @required this.minExtentValue
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.maxExtentValue;

  @override
  double get minExtent => this.minExtentValue;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}