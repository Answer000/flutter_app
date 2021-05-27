import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_webView.dart';
import 'package:flutter_app/common/base/constant.dart';

class MyIntegralMall extends BaseWebView {

  @override
  bool get isShowNavigationBar => true;

  @override
  String get url => kIntegralMall;

  @override
  // TODO: implement title
  String get title => "积分商城";

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return super.getState();
  }
}
