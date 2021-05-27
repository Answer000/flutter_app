import 'package:flutter/material.dart';
import 'package:flutter_app/class/profile/profile_info_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

// ignore: must_be_immutable
class FashionPersonalHeaderView extends StatefulWidget {

  bool isLogin;       /// 是否已登录
  String userAvatar;  /// 用户头像
  String nickName;    /// 昵称
  String userNo;      /// id编号
  int sex;            /// 性别

  FashionPersonalHeaderView({
    @required this.isLogin,
    this.userAvatar,
    this.nickName,
    this.userNo,
    this.sex,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FashionPersonalHeaderViewState();
  }
}

class FashionPersonalHeaderViewState extends State<FashionPersonalHeaderView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90.dp,
            height: 90.dp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90.dp),
              border: Border.all(color: Colors.white, width: 5.dp, style: BorderStyle.solid),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90.dp),
                    ),
                    child: ClipOval(
                      child: this.widget.isLogin
                          ? (this.widget.userAvatar.isValid
                              ? CustomImage.assetNetwork(image: '${this.widget.userAvatar}')
                              : CustomAssetImage.image(image: ImageName.placeholder.imagePath))
                          : CustomAssetImage.image(image: ImageName.placeholder.imagePath)
                    )
                  )
                ),
                Positioned(
                  right: 0.dp,
                  bottom: 0.dp,
                  child: Container(
                      width: 20.dp,
                      height: 20.dp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.dp),
                      ),
                      child: this.widget.isLogin
                          ? Stack(
                        children: [
                          Center(
                            child: Container(
                              width: 10.dp,
                              height: 13.dp,
                              child: this.widget.sex.isValid
                                  ? CustomAssetImage.image(
                                      image: this.widget.sex == 0
                                              ? ImageName.cjm_gender_female.imagePath
                                              : ImageName.cjm_gender_male.imagePath,
                                    )
                                  : Container(),
                            ),
                          )
                        ],
                      ) : Container()
                  ),
                )
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 7.dp),
            child: Text(
              this.widget.isLogin ? '${this.widget.nickName ?? ""}' : '请点击头像进行登录',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.dpFontSize,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10.dp),
            child: Text(
              this.widget.isLogin ? 'ID编号：${this.widget.userNo ?? ""}' : '用户未登录',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.dpFontSize,
              ),
            ),
          )
        ],
      ),
    );
  }
}