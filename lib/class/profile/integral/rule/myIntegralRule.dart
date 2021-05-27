import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_webView.dart';
import 'package:flutter_app/common/base/constant.dart';

class MyIntegralRule extends BaseWebView {

  @override
  bool get isShowNavigationBar => true;

  @override
  String get url => kIntegralRule;

  @override
  // TODO: implement title
  String get title => "积分规则";

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return super.getState();
  }
}
