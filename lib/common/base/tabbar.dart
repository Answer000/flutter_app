import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'dart:ui';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';
import 'package:flutter_app/class/home/home.dart';
import 'package:flutter_app/class/fashion/fashion.dart';
import 'package:flutter_app/class/game/game.dart';
import 'package:flutter_app/class/profile/profile.dart';
import 'package:flutter_app/class/publish/publish.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ASTabBarItemType {
  home,
  fashion,
  center,
  mall,
  personal,
}

class ASTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ASTabBarState();
  }
}

class ASTabBarState extends State<ASTabBar> {

  PageController _pageController;

  int _selectIndex = 0;
  int get selectIndex => _selectIndex;
  set selectIndex(int index){
    setState(() {
      this._selectIndex = index;
      this._pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: this.selectIndex,
      keepPage: true,
      viewportFraction: 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
    ScreenUtil.init(context, designSize: Screen.designSize, allowFontScaling: true);

    LoginUserInfoManager.appContext = context;
    SystemChrome.setEnabledSystemUIOverlays([]);

    /// 中间按钮的size
    Size centerItemSize = Size(50.dp, 50.dp);

    /// 中间按钮突出距离
    double centerItemDistance = -20.dp;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Home(),
                      Fashion(),
                      Publish(),
                      Game(),
                      Profile(),
                    ],
                  ),
                ),
              ),

              Container(
                color: Color(0xff232323),
                height: Screen.tabBarHeight + Screen.bottomBarHeight,
                padding: EdgeInsets.only(left: 24.dp, right: 24.dp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _createItems(centerItemSize, centerItemDistance),
                ),
              ),
            ],
          ),

          Positioned(
            bottom: Screen.tabBarHeight + Screen.bottomBarHeight - centerItemSize.height - centerItemDistance,
            left: (Screen.width - centerItemSize.width) * 0.5,
            child: Container(
              width: centerItemSize.width,
              height: centerItemSize.height,
              child: FlatButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: (){
                  CustomNavigator.push(context: context, page: Publish());
                },
              ),
            ),
          )
        ],
      )
    );
  }

  List<Widget> _createItems(Size centerItemSize, double centerItemDistance) {
    List<Widget> items = List();
    List<Map<String,dynamic>> infos = [
      {'title' : '首页',
        'type' : ASTabBarItemType.home,
        'normalIcon': ImageName.cjm_tabbarIcon_homeNormal.imagePath,
        'selectIcon': ImageName.cjm_tabbarIcon_homeSelected.imagePath
      },{'title' : '潮IN',
        'type' : ASTabBarItemType.fashion,
        'normalIcon': ImageName.cjm_tabbarIcon_fashionNormal.imagePath,
        'selectIcon': ImageName.cjm_tabbarIcon_fashionSelected.imagePath
      },{'title' : '发布',
        'type' : ASTabBarItemType.center,
        'normalIcon': ImageName.cjm_tabbarIcon_publish.imagePath,
        'selectIcon': ImageName.cjm_tabbarIcon_publish.imagePath
      },{'title' : '逛逛',
        'type' : ASTabBarItemType.mall,
        'normalIcon': ImageName.cjm_tabbarIcon_nearbyNormal.imagePath,
        'selectIcon': ImageName.cjm_tabbarIcon_nearbySelected.imagePath
      },{'title' : '我的',
        'type' : ASTabBarItemType.personal,
        'normalIcon': ImageName.cjm_tabbarIcon_profileNormal.imagePath,
        'selectIcon': ImageName.cjm_tabbarIcon_profileSelected.imagePath
      },
    ];
    for(var i=0; i<infos.length; i++) {
      Map<String,dynamic> info = infos[i];
      bool isCenter = infos[i]['type'] == ASTabBarItemType.center;
      items.add(
        Column(
          children: [
            Container(
              width: isCenter ? centerItemSize.width : 35.dp,
              height: isCenter ? centerItemSize.height : 35.dp,
              transform: Matrix4.translationValues(0, isCenter ? centerItemDistance : 0, 0),
              child: FlatButton(
                padding: EdgeInsets.all(isCenter ? 0 : 8.dp),
                child: CustomAssetImage.image(
                  image: this.selectIndex == i ? info['selectIcon'] : info['normalIcon'],
                ),
                onPressed: (){
                  if(!isCenter){
                    this.selectIndex = i;
                  }
                },
              ),
            ),

            Container(
              child: Text(
                isCenter ? '' : '${info['title']}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.dp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return items;
  }
}
