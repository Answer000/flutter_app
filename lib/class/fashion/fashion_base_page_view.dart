import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class FashionBasePageView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return getState();
  }

  // 子类实现
  FashionBasePageViewState getState();
}

abstract class FashionBasePageViewState<T extends FashionBasePageView> extends State<T> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return setContentView(context);
  }

  /// 子类实现，构建各自页面UI控件 相当于setContentView()
  @required
  Widget setContentView(BuildContext context);
}