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

class ASTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ASTabBarState();
  }
}

class ASTabBarState extends State<ASTabBar> {

  double get barHeight => 49.0;

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
    LoginUserInfoManager.appContext = context;
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Column(
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
            height: this.barHeight + Screen.bottomBarHeight,
            padding: EdgeInsets.only(left: 24.dp, right: 24.dp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _createItems(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> items = List();
    List<Map<String,String>> infos = [
      {'title' : '首页',
        'normalIcon': ImageName.cjm_tabbarIcon_homeNormal.imagePath,
        'selectIcon': ImageName.cjm_tabbarIcon_homeSelected.imagePath
      },{'title' : '潮IN',
        'normalIcon': ImageName.cjm_tabbarIcon_fashionNormal.imagePath,
        'selectIcon': ImageName.cjm_tabbarIcon_fashionSelected.imagePath
      },{'title' : '发布',
        'normalIcon': ImageName.cjm_tabbarIcon_publish.imagePath,
        'selectIcon': ImageName.cjm_tabbarIcon_publish.imagePath
      },{'title' : '男神',
        'normalIcon': ImageName.cjm_tabbarIcon_nearbyNormal.imagePath,
        'selectIcon': ImageName.cjm_tabbarIcon_nearbySelected.imagePath
      },{'title' : '我的',
        'normalIcon': ImageName.cjm_tabbarIcon_profileNormal.imagePath,
        'selectIcon': ImageName.cjm_tabbarIcon_profileSelected.imagePath
      },
    ];
    for(var i=0; i<infos.length; i++) {
      Map<String,String> info = infos[i];
      bool isPublish = i==2;
      items.add(
        Column(
          children: [
            Container(
              width: isPublish ? 50.dp : 35.dp,
              height: isPublish ? 50.dp : 35.dp,
              transform: Matrix4.translationValues(0, isPublish ? -15.dp : 0, 0),
              child: FlatButton(
                padding: EdgeInsets.all(isPublish ? 0 : 8.dp),
                child: CustomAssetImage.image(
                  image: this.selectIndex == i ? info['selectIcon'] : info['normalIcon'],
                ),
                onPressed: (){
                  if(i==2){
                    CustomNavigator.push(context: context, page: Publish());
                  }else{
                    this.selectIndex = i;
                  }
                },
              ),
            ),

            Container(
              child: Text(
                isPublish ? '' : '${info['title']}',
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
