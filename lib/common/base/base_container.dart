import 'package:flutter/material.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_route.dart';
import '../../resource.dart';
import '../extension/extension.dart';
import 'base_navigation_bar.dart';

// ignore: must_be_immutable
abstract class BaseContainer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return getState();
  }

  // 子类实现
  BaseContainerState getState();

  /// 返回按钮事件回调
  Function backHandle;

  /// 是否需要登录
  bool get isNeedLogin => false;

  /// 转场动画类型
  CustomRouteModalType get modalType => CustomRouteModalType.rightLeft;

  /// 是否显示导航条
  bool get isShowNavigationBar => true;

  /// 导航条样式
  NavigationBarType get navigationBarType => NavigationBarType.child;

  /// 是否允许重复刷新
  bool get isWantKeepAlive => true;
}

abstract class BaseContainerState<T extends BaseContainer> extends State<T> with AutomaticKeepAliveClientMixin {

  NavigationBar _navigationBar;
  NavigationBar get navigationBar {
    if(_navigationBar == null) {
      setState(() {
        _navigationBar = NavigationBar(
            barType: this.widget.navigationBarType,
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

  /// 构建默认布局
  Widget _buildWidgetDefault() {
    return Container(
      color: this.widget.modalType == CustomRouteModalType.transparent ? Colors.transparent : CustomColor.blackGroundColor,
      child: Stack(
        children: [
          this.widget.navigationBarType == NavigationBarType.root
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
                this.widget.isShowNavigationBar
                    ? this.navigationBar
                    : Container(),
                Expanded(
                  child: GestureDetector(
                    child: setContentView(context),
                    onTap: (){
                      if(!this.widget.isShowNavigationBar) {
                        CustomNavigator.pop(context: context);
                      }
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