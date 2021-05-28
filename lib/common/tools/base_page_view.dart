import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePageView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return getState();
  }

  // 子类实现
  BasePageViewState getState();
}

abstract class BasePageViewState<T extends BasePageView> extends State<T> with AutomaticKeepAliveClientMixin {

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