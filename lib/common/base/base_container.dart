import 'package:flutter/material.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_route.dart';
import '../../resource.dart';
import '../extension/extension.dart';
import 'base_navigation_bar.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';

// ignore: must_be_immutable
abstract class BaseContainer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return getState();
  }

  // 子类实现
  BaseContainerState getState();

  /// 是否需要登录
  bool get isNeedLogin => false;

  /// 转场动画类型
  CustomRouteModalType get modalType => CustomRouteModalType.rightLeft;

  /// 是否显示导航条
  bool get isShowNavigationBar => true;

  /// 导航条样式
  NavigationBarType get navigationBarType => NavigationBarType.child;

  /// 是否显示导航条
  bool get isShowBackground => true;

  /// 是否允许重复刷新
  bool get isWantKeepAlive => true;

  /// 是否点击空白区域时推出导航
  bool get isEnablePopWhenClickEmpty => false;

  /// 是否允许导航条透明
  bool get isCanNavigationBarTransparent => false;
}

abstract class BaseContainerState<T extends BaseContainer> extends State<T> with AutomaticKeepAliveClientMixin {

  NavigationBar _navigationBar;
  NavigationBar get navigationBar {
    if(_navigationBar == null) {
      setState(() {
        _navigationBar = NavigationBar(
            barType: this.widget.navigationBarType,
            backCallback: () => this.backCallBack(),
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
    super.build(context);
    return _buildWidgetDefault();
  }

  @protected
  bool get wantKeepAlive => this.widget.isWantKeepAlive;

  /// 子类实现，构建各自页面UI控件 相当于setContentView()
  @required
  Widget setContentView(BuildContext context);

  backCallBack() {
      if(Navigator.canPop(context)){
        Navigator.pop(context);
      }
  }

  /// 构建默认布局
  Widget _buildWidgetDefault() {
    return Container(
      color: this.widget.modalType == CustomRouteModalType.transparent ? Colors.transparent : CustomColor.blackGroundColor,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            width: 627.dp,
            height: 627.dp,
            right: Screen.width - 125.dp,
            child: Offstage(
              offstage: !this.widget.isShowBackground,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff282727),
                    borderRadius: BorderRadius.circular(627.dp * 0.5)
                ),
              ),
            )
          ),

          Positioned(
            top: 0,
            width: 394.dp,
            height: 394.dp,
            left: Screen.width - 145.dp,
            child: Offstage(
              offstage: !this.widget.isShowBackground,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff282727),
                    borderRadius: BorderRadius.circular(394.dp * 0.5)
                ),
              ),
            )
          ),

          Offstage(
            offstage: this.widget.navigationBarType != NavigationBarType.root,
            child: Container(
              width: 127.dp,
              height: 200.dp,
              child: Image(
                image: AssetImage(ImageName.cjm_navigationBar_left_background.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: this.widget.isCanNavigationBarTransparent ? 0 : Screen.topBarHeight,
            bottom: 0,
            child: GestureDetector(
              child: setContentView(context),
              onTap: (){
                if(this.widget.isEnablePopWhenClickEmpty) {
                  CustomNavigator.pop(context: context);
                }
              },
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: Screen.topBarHeight,
            child: Offstage(
              offstage: !this.widget.isShowNavigationBar,
              child: this.navigationBar,
            ),
          )
        ],
      ),
    );
  }
}