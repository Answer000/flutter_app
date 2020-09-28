import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';
import 'package:flutter_app/common/tools/customPageView.dart';
import 'dart:async';
import 'package:flutter_app/common/extension/extension.dart';
import 'homeViewModel.dart';
import 'home_banner_entity.dart';
import 'home_banner_view.dart';


// ignore: must_be_immutable
class Home extends BaseContainer {
  @override
  BaseContainerState<BaseContainer> getState() {
    return HomeState();
  }
}

class HomeState extends BaseContainerState<Home> with TickerProviderStateMixin {

  HomeViewModel _viewModel = HomeViewModel();

  List<HomeBannerDataBannerList> _banners = List();

  @override
  void initState() {
    super.initState();
    this.barType = NavigationBarType.root;
    this.navigationBar.title = "早上好，";
    this.navigationBar.detailTitle = 'MR.superUP';
    this.navigationBar.descriptionText = '用真心对世界微笑';

    _loadBanner();
  }

  /// 请求轮播图数据
  _loadBanner() async {
    await _viewModel.loadBannerSources((banners){
      if(banners.isValid) {
        setState(() {
          this._banners = banners;
        });
      }
    });
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeBannerView(banners: this._banners),
        ],
      ),
    );
  }
}