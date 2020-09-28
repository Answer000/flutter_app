import 'package:flutter/material.dart';
import 'package:flutter_app/common/extension/extension.dart';
import '../../resource.dart';
import '../extension/extension.dart';
import '../extension/extension.dart';
import '../extension/extension.dart';
import 'base_navigation_bar.dart';

// ignore: must_be_immutable
abstract class BaseContainer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return getState();
  }

  // 子类实现
  BaseContainerState getState();

  Function backHandle;
}

abstract class BaseContainerState<T extends BaseContainer> extends State<T> {

  /// 是否显示导航条
  bool _isShowNavigationBar = true;
  bool get isShowNavigationBar => _isShowNavigationBar;
  set isShowNavigationBar(bool isShow) {
    setState(() {
      this._isShowNavigationBar = isShow;
    });
  }

  NavigationBarType _barType = NavigationBarType.child;
  NavigationBarType get barType => _barType;
  set barType(NavigationBarType type) {
    setState(() {
      this._barType = type;
    });
  }

  NavigationBar _navigationBar;
  NavigationBar get navigationBar {
    if(_navigationBar == null) {
      setState(() {
        _navigationBar = NavigationBar(
            barType: this.barType,
        );
      });
    }
    return _navigationBar;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildWidgetDefault();
  }

  /// 子类实现，构建各自页面UI控件 相当于setContentView()
  @required
  Widget setContentView(BuildContext context);

  /// 构建默认布局
  Widget _buildWidgetDefault() {
    return Container(
      color: Color(0xff1d1d1d),
      child: Stack(
        children: [
          this.barType == NavigationBarType.root
              ? Container(
                    width: 127.dp,
                    height: 200.dp,
                    child: Image(
                    image: AssetImage(ImageName.cjm_navigationBar_left_background.imagePath),
                      fit: BoxFit.cover,
                    ),
                  )
              : Container(),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                this.isShowNavigationBar
                    ? this.navigationBar
                    : Container(),
                Expanded(
                  child: GestureDetector(
                    child: setContentView(context),
                    onTap: (){
                      CustomNavigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}