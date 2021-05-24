import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_webView.dart';
import 'package:flutter_app/common/base/constant.dart';

// ignore: must_be_immutable
class Mall extends BaseWebView {

  @override
  BaseContainerState<BaseContainer> getState() {
    return super.getState();
  }

  @override
  bool get isShowNavigationBar => false;

  @override
  String get url => kPrinceCharming;

}
