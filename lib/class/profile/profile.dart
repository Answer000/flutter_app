import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';
import 'package:flutter_app/class/profile/setting/setting.dart';
import 'package:flutter_app/class/profile/profileViewModel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/common/base/event_manager.dart';

// ignore: must_be_immutable
class Profile extends BaseContainer {
  @override
  BaseContainerState<BaseContainer> getState() {
    return ProfileState();
  }

  @override
  NavigationBarType get navigationBarType => NavigationBarType.root;
}

class ProfileState extends BaseContainerState<Profile> with TickerProviderStateMixin {

  ProfileViewModel _viewModel = ProfileViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "我的，";
    this.navigationBar.detailTitle = '最美的';
    this.navigationBar.descriptionText = '用真心对世界微笑';
    this.navigationBar.addRightItem(
        iconName: ImageName.cjm_profile_setting.imagePath,
        size: Size(20.dp,30.dp),
        margin: EdgeInsets.only(right: 12.dp),
        onPress: (){
          CustomNavigator.push(context, Setting());
        }
    );
    _getUserInfo();

    // 监听登录状态变化
    eventManager.add(EventName.login, (arg) {
      print(arg);
      if (arg) {
        _getUserInfo();
      }else{
        setState(() {
          this._viewModel.info = null;
        });
      }
    });
  }

  _getUserInfo() {
    _viewModel.getUserInfo((info){
      setState(() {
        this._viewModel.info = info;
      });
    });
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
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
      case 0:   return _getInfoContentView(context,index);
      case 1:   return _getNumberContentView(context,index);
      case 2:   return _getItemsContentView(context,index);
      default:  return _getCellContentView(context, index-3, (){
        print('${this._viewModel.getCellContentViewSource()[index-3].titleZH}');
      });
    }
  }

  Widget _getSeparatorBuilder(BuildContext context, int index) {
    if(index == 0) {
      return Container(height: 10.dp );
    }else{
      return Container(height: 10.dp );
    }
  }

  Widget _getInfoContentView(BuildContext context, int index) {
    return GestureDetector(
      onTap: (){
        print('编辑资料');
      },
      child: Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 80.dp,
                height: 80.dp,
                margin: EdgeInsets.only(left: 34.dp),
                child: ClipOval(
                  child: this._viewModel.info != null
                      ? CustomImage.memoryNetwork(image: '${this._viewModel.info.user.userAvatar}')
                      : CustomAssetImage.image(image: ImageName.placeholder.imagePath),
                )
            ),

            Container(
              margin: EdgeInsets.only(left: 45.dp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${this._viewModel.info != null ? this._viewModel.info.user.nick : "点击头像进行登录"}',
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${this._viewModel.info != null ? '编辑资料' : "登录开启变美之旅"}',
                    style: TextStyle(color: Color(0xff5d5d5d), fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.dp),),
                  GestureDetector(
                    child: Text(
                      this._viewModel.info != null ? 'ID编号：${this._viewModel.info.user.userNo}' : "用户未登录",
                      style: TextStyle(color: Color(0xff8e8e8e), fontSize: 11, fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      Clipboard.setData(ClipboardData(text: this._viewModel.info.user.userNo));
                      CustomToast.show('用户ID复制成功');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getNumberContentView(BuildContext context, int index) {
    var source = this._viewModel.numberDataSource();
    List<Widget> items = [];
    for (var i=0; i<source.length; i++) {
      if(i > 0) {
        items.add(Container(color: Colors.white, width: 1, height: 24.dp,));
      }
      items.add(
        GestureDetector(
          onTap: (){
            switch (i) {
              case 0: print('======粉丝');  break;
              case 1: print('======关注');  break;
              case 2: print('======获赞');  break;
              default: break;
            }
          },
          child: Container(
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

  Widget _getItemsContentView(BuildContext context, int index) {
    List<Map<String,dynamic>> source = this._viewModel.itemsDataSource;
    List<Widget> items = [];
    for (var i=0; i<source.length; i++) {
      Size iconSize = source[i]['iconSize'];
      items.add(
          GestureDetector(
            onTap: (){
              switch (i) {
                case 0: print('======订单');  break;
                case 1: print('======优惠券');  break;
                case 2: print('======意见反馈');  break;
                case 3: print('======获赞');  break;
                default: break;
              }
            },
            child: Container(
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

  Widget _getCellContentView(BuildContext context, int index, Function() onPress) {
    ProfileCellEntity entity = this._viewModel.getCellContentViewSource()[index];
    return GestureDetector(
      onTap: onPress,
      child: Container(
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
                  width: entity.iconSize.width,
                  height: entity.iconSize.height,
                  margin: EdgeInsets.only(left: entity.iconLeftMargin.dp),
                  child: CustomAssetImage.image(
                    image: entity.iconName,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 11.dp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 14.dp,
                        child: Text(
                          '${entity.titleZH}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.dp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 3.dp),
                        height: 3.dp,
                        width: entity.lineWidth.dp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.5.dp),
                          color: entity.lineColor,
                        ),
                      ),

                      Container(
                        height: 12.dp,
                        child: Text(
                          '${entity.titleEN}',
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

            Positioned(
                right: 21,
                child: entity.detailText.isValid
                    ? Text('${entity.detailText}', style: entity.detailTextStyle,)
                    : Container()
            )
          ],
        ),
      ),
    );
  }
}