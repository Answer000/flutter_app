
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/setting/settingViewModel.dart';

class Setting extends BaseContainer {

  @override
  BaseContainerState<BaseContainer> getState() {
    return SettingState();
  }
}

class SettingState extends BaseContainerState<Setting> {

  String _version = '';
  String _cacheSize = '';
  List<Map<String,dynamic>> _source = [
    {'title' : "清除缓存", 'isShowMore' : true},
    {'title' : "当前版本", 'isShowMore' : false},
    {'title' : "绑定微信号", 'isShowMore' : true},
    {'title' : "用户注册协议", 'isShowMore' : false},
    {'title' : "用户隐私协议", 'isShowMore' : false}];

  SettingViewModel _viewModel = SettingViewModel();

  @override
  void initState() {
    super.initState();
    this.navigationBar.title = "设置";

    _viewModel.getVersion().then((value) {
      setState(() {
        this._version = value;
      });
    });

    _viewModel.loadCache().then((value) {
      setState(() {
        this._cacheSize = value;
      });
    });
  }

  String _getDescText(int index) {
    switch (index) {
      case 0:   return _cacheSize;
      case 1:   return _version;
      case 2:   return "未绑定";
      default:  return null;
    }
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.all(0),
            itemCount: this._source.length,
            scrollDirection: Axis.vertical,
            primary: false,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    height: 50.dp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12.dp),
                          child: Text(
                            '${this._source[index]['title']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.dpFontSize,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                      right: 12.dp,
                      height: 50.dp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (_getDescText(index) != null) ?
                          Container(
                            child: Text(
                              _getDescText(index),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.dpFontSize,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none
                              ),
                            ),
                          ) :
                          Container(),

                          Padding(
                            padding: EdgeInsets.only(
                                right: (_getDescText(index) != null && this._source[index]['isShowMore'] == false) ? 0 : 12.dp
                            ),
                          ),

                          (this._source[index]['isShowMore'] == true) ?
                          Container(
                            alignment: Alignment.centerRight,
                            width: 6.dp,
                            height: 11.dp,
                            child: CustomAssetImage.image(
                                image: ImageName.cjm_profile_more.imagePath
                            ),
                          ) :
                          Container(),
                        ],
                      )

                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              bool isTarget = index == 2;
              return Container(
                height: isTarget ? 5 : 0.5,
                color: Color(0xff292929),
                margin: EdgeInsets.only(left: isTarget ? 0 : 12.dp, right: isTarget ? 0 : 12.dp),
              );
            },
          ),

          Positioned(
            width: Screen.width,
            bottom: 200.dp,
            child: Center(
              child: Container(
                width: 200.dp,
                height: 40.dp,
                decoration: BoxDecoration(
                  color: Color(0xff313131),
                  borderRadius: BorderRadius.circular(20.dp),
                ),
                child: FlatButton(
                  child: Text(
                    '退出登录',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  onPressed: () {
                    LoginUserInfoManager().clearUserInfo();
                    CustomNavigator.pop(context);
                  },
                ),
              ),
            )
          )
        ],
      )
    );
  }
}