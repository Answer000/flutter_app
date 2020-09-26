import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class ASTabBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ASTabBarState();
  }
}

class ASTabBarState extends State<ASTabBar> {

  double get barHeight => 49.0;

  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('${ImageName.cjm_tabbarIcon_fashionNormal.assetImage}');
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
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
      )
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
              transform: Matrix4.translationValues(0, isPublish ? -25.dp : 0, 0),
              child: FlatButton(
                padding: EdgeInsets.all(isPublish ? 0 : 8.dp),
                child: CustomAssetImage.image(
                  image: this._selectIndex == i ? info['selectIcon'] : info['normalIcon'],
                ),
                onPressed: (){
                  this.setState(() {
                    this._selectIndex = i;
                  });
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
