
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/setting/settingViewModel.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';

class Setting extends BaseContainer {

  @override
  BaseContainerState<BaseContainer> getState() {
    return SettingState();
  }

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  @override
  // TODO: implement isShowBackground
  bool get isShowBackground => false;
}

class SettingState extends BaseContainerState<Setting> {

  SettingViewModel _viewModel = SettingViewModel();

  List<SettingItemEntity> _dataSource = [];

  @override
  void initState() {
    super.initState();
    this.navigationBar.title = "设置";

    _viewModel.dataSource.then((value) {
      setState(() {
        this._dataSource = value;
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
            itemCount: this._dataSource.length,
            scrollDirection: Axis.vertical,
            primary: false,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: this._dataSource[index].function,
                child: Container(
                  color: Colors.transparent,
                  child: Stack(
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
                                '${this._dataSource[index].title}',
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
                              this._dataSource[index].descText.isValid ?
                              Container(
                                child: Text(
                                  '${this._dataSource[index].descText}',
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
                                    right: this._dataSource[index].paddingRight.dp
                                ),
                              ),

                              (this._dataSource[index].isShowMore) ?
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
                  ),
                ),
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
                    LoginUserInfoManager().clearUserInfo(context);
                    CustomNavigator.pop(context: context);
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