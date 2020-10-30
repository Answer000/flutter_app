import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';
import 'package:flutter_app/class/profile/setting/setting.dart';


// ignore: must_be_immutable
class Profile extends BaseContainer {
  @override
  BaseContainerState<BaseContainer> getState() {
    return ProfileState();
  }
}

class ProfileState extends BaseContainerState<Profile> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.barType = NavigationBarType.root;
    this.navigationBar.title = "我的，";
    this.navigationBar.detailTitle = '最美的';
    this.navigationBar.descriptionText = '用真心对世界微笑';
    this.navigationBar.addRightItem(
        iconName: ImageName.cjm_profile_setting.imagePath,
        size: Size(20,30),
        margin: EdgeInsets.only(right: 12),
        onPress: (){
          CustomNavigator.push(context, Setting());
        }
    );
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
//      color: Colors.cyan,
      child: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index){
              return _getItemBuilder(context, index);
            },
            separatorBuilder:(BuildContext context, int index){
              return _getSeparatorBuilder(context, index);
            },
            itemCount: 7,
            primary: true,
          )
        ],
      ),
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    switch (index){
      case 0:   return _getInfoContentView();
      case 1:   return _getNumberContentView();
      case 2:   return _getItemsContentView();
      default:  return _getCellContentView(index);
    }
  }

  Widget _getSeparatorBuilder(BuildContext context, int index) {
    if(index == 0) {
      return Container(height: 10.dp );
    }else{
      return Container(height: 10.dp );
    }
  }

  Widget _getInfoContentView() {
    return Container(
      margin: EdgeInsets.only(left: 12.dp, right: 12.dp),
      height: 120.dp,
      decoration: BoxDecoration(
        color: Color(0xff212121),
        borderRadius: BorderRadius.circular(6.dp),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.27),
              offset: Offset(0,2),
              blurRadius: 12.dp,
              spreadRadius: 1
          ),
        ]
      ),
    );
  }

  Widget _getNumberContentView() {
    List<Map<String,dynamic>> source = [
      {'name' : '粉丝', 'count' : '260'},
      {'name' : '关注', 'count' : '38'},
      {'name' : '获赞', 'count' : '42'},
    ];
    List<Widget> items = [];
    for (var i=0; i<source.length; i++) {
      if(i > 0) {
        items.add(Container(color: Colors.white, width: 1, height: 24.dp,));
      }
      items.add(
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '${source[i]['count'].toString()}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.dpFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 4.dp),),
              Text(
                '${source[i]['name'].toString()}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.dpFontSize,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        )
      );
    }

    return Container(
      margin: EdgeInsets.only(left: 12.dp, right: 12.dp),
      height: 82.dp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: items,
      ),
    );
  }

  Widget _getItemsContentView() {
    List<Map<String,dynamic>> source = [
      {'title' : '订单', 'iconName' : ImageName.cjm_profile_order.imagePath, 'iconSize' : Size(25.dp,30.dp)},
      {'title' : '优惠券', 'iconName' : ImageName.cjm_profile_coupon.imagePath, 'iconSize' : Size(30.dp,23.dp)},
      {'title' : '意见反馈', 'iconName' : ImageName.cjm_profile_feedBack.imagePath, 'iconSize' : Size(25.dp,25.dp)},
      {'title' : '收藏', 'iconName' : ImageName.cjm_profile_collect.imagePath, 'iconSize' : Size(25.dp,30.dp)},
    ];
    List<Widget> items = [];
    for (var i=0; i<source.length; i++) {
      Size iconSize = source[i]['iconSize'];
      items.add(
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: iconSize.width,
                  height: iconSize.height,
                  child: CustomAssetImage.image(
                    image: '${source[i]['iconName'].toString()}',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 7.dp),),
                Text('${source[i]['title'].toString()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.dpFontSize,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          )
      );
    }

    return Container(
      margin: EdgeInsets.only(left: 12.dp, right: 12.dp),
      height: 82.dp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: items,
      ),
    );
  }

  Widget _getCellContentView(int index) {
    List<Map<String,dynamic>> iconNames = [

    ];
    return Container(
      height: 60.dp,
      margin: EdgeInsets.only(left: 36.dp, right: 36.dp),
      decoration: BoxDecoration(
          color: Color(0xff212121),
          borderRadius: BorderRadius.circular(6.dp),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.27),
                offset: Offset(0,2),
                blurRadius: 12.dp,
                spreadRadius: 1
            ),
          ]
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 25.dp,
                height: 25.dp,
                margin: EdgeInsets.only(left: 21.dp),
                child: CustomAssetImage.image(
                  image: ImageName.cjm_profile_integral.imagePath
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}