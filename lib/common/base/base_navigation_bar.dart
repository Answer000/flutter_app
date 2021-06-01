import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resource.dart';
import 'package:flutter_app/common/extension/extension.dart';
import '../../resource.dart';
import '../extension/extension.dart';

enum NavigationBarType {
  root,
  child
}

// ignore: must_be_immutable
class NavigationBar extends StatefulWidget {
  /// 导航条样式
  NavigationBarType barType;
  /// 标题
  String title;
  /// 副标题
  String detailTitle;
  /// 说明
  String descriptionText;
  /// 导航条返回按钮事件回调
  VoidCallback backCallback;
  /// 是否显示logo
  bool isShowLogo;
  set _isShowLogo(bool value) {
    this.isShowLogo = value;
  }

  /// 是否显示logo
  Color navigationBarColor = Colors.transparent;
  set _navigationBarColor(Color color) {
    this.navigationBarColor = color;
  }

  /// 初始方法
  NavigationBar({
    @required this.barType,
    this.title,
    this.isShowLogo = true,
    this.navigationBarColor = Colors.transparent,
    this.backCallback
  });

  NavigationBarState _navigationBarState = NavigationBarState();

  @override
  State<StatefulWidget> createState() {
    return _navigationBarState;
  }

  NavigationBar addRightItem({
    String iconName,
    String title,
    Size size = Size.zero,
    EdgeInsets margin = EdgeInsets.zero,
    Function onPress
  }) {
    _navigationBarState.addRightItem(
        iconName: iconName,
        title: title,
        size: size,
        margin: margin,
        onPress: onPress);
    return this;
  }

  removeAllRightItems() {
    _navigationBarState.removeAllRightItems();
  }
}

class NavigationBarState extends State<NavigationBar> {

  List<Widget> rightItems = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: this.widget.navigationBarColor,
        height: Screen.topBarHeight,
        padding: EdgeInsets.only(top: Screen.statusBarHeight),
        child: _createWidget(),
    );
  }

  Widget _createWidget() {
    switch(this.widget.barType){
      case NavigationBarType.root:
        return _createRootWidget();
      case NavigationBarType.child:
        return _createChildWidget();
      default:
        return Container();
    }
  }

  addRightItem({
    String iconName = "",
    String title = "",
    Size size,
    EdgeInsets margin,
    Function onPress
  }) {
    var item = Container(
      margin: margin.isValid ? margin : EdgeInsets.only(right: 12.dp),
      width: size.isValid ? size.width : 30,
      height: size.isValid ? size.height : 30,
      padding: EdgeInsets.all(0),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: iconName.isValid
            ? CustomAssetImage.image(image: iconName)
            : Text(title, style: TextStyle(color: Colors.white, fontSize: 13.dpFontSize),),
        onPressed: (){
          onPress();
        },
      ),
    );
    this.rightItems.add(item);
  }

  removeAllRightItems() {
    rightItems.clear();
    setState(() {
      this.rightItems = [];
    });
  }

  Widget _createRootWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12.dp),
                child: ImageName.cjm_navigationBar_logo.assetImage,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.dp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 20.dp,
                          child: Text(
                            this.widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.dp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            this.widget.detailTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.dp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 12.dp,
                      child: Text(
                        this.widget.descriptionText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.dp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          right: 0.dp,
          child: Container(
            child: Row(
              children: this.rightItems ?? [Container()],
            ),
          ),
        )
      ],
    );
  }

  Widget _createChildWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            height: Screen.navigationBarHeight,
            child: Center(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Offstage(
                      offstage: !this.widget.isShowLogo,
                      child: Container(
                        height: 16.dp,
                        width: 24.dp,
                        child: ImageName.cjm_navigationBar_logo.assetImage,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.dp),
                    ),
                    Text(
                        this.widget.title ?? "",
                        style: TextStyle(
                            fontSize: 15.dp,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ],
                ),
              ),
            )
        ),

        Positioned(
            left: 15.dp,
            child: Container(
              width: 30.dp,
              height: 30.dp,
              child: RawMaterialButton(
                // 点击事件
                onPressed: (){
                  this.widget.backCallback();
                },
                // 必须的参数 一般是 Icon 或者是 ImageIcono
                child: ImageName.cjm_navigationBar_backIcon_white.assetImage,
                constraints: BoxConstraints(),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
            )
        ),

        Positioned(
          right: 0.dp,
          child: Container(
            child: Row(
              children: this.rightItems ?? [Container()],
            ),
          ),
        )
      ],
    );
  }
}