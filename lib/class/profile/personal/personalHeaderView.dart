import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';
import 'otherPersonal/otherPersonal_info_entity.dart';

// ignore: must_be_immutable
class PersonalHeaderView extends StatefulWidget {

  bool isLogin;       /// 是否已登录
  int userId;         /// 用户ID
  OtherPersonalInfoData infoData;

  PersonalHeaderView({
    @required this.isLogin,
    this.userId,
    this.infoData,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PersonalHeaderViewState();
  }
}

class PersonalHeaderViewState extends State<PersonalHeaderView> {

  bool isSelf = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginUserInfoManager().userId.then((userId){
      this.setState(() {
        this.isSelf = (this.widget.userId == userId && userId.isValid);
        print('object        $isSelf');
      });
    });
  }

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
                            child: (this.widget.isLogin && this.widget.infoData != null)
                                ? (this.widget.infoData.user.userAvatar.isValid
                                ? CustomImage.assetNetwork(image: '${this.widget.infoData.user.userAvatar}')
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
                      child: (this.widget.isLogin && this.widget.infoData != null)
                          ? Stack(
                        children: [
                          Center(
                            child: Container(
                              width: 10.dp,
                              height: 13.dp,
                              child: this.widget.infoData.user.sex.isNotValid
                                  ? Container()
                                  : CustomAssetImage.image(
                                      image: this.widget.infoData.user.sex == 0
                                        ? ImageName.cjm_gender_female.imagePath
                                        : ImageName.cjm_gender_male.imagePath,
                                    ),
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
              (this.widget.isLogin && this.widget.infoData != null)
                  ? '${this.widget.infoData.user.nick ?? ""}'
                  : '请点击头像进行登录',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.dpFontSize,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10.dp),
            child: Text(
              (this.widget.isLogin && this.widget.infoData != null)
                  ? 'ID编号：${this.widget.infoData.user.userNo ?? ""}'
                  : '用户未登录',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.dpFontSize,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none
              ),
            ),
          ),

          this.isSelf
              ? Container()
              : Container(
              margin: EdgeInsets.only(top: 10.dp),
              height: 30.dp,
              decoration: BoxDecoration(
                  color: CustomColor.mainRedColor,
                  borderRadius: BorderRadius.circular(5.dp)
              ),
              child: FlatButton(
                child: Text(
                  this.widget.infoData != null
                      ? (this.widget.infoData.attention == "1" ? "已关注" : '+ 关注')
                      : "" ,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.dpFontSize,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none
                  ),
                ),
                onPressed: (){
                  bool isFollow = this.widget.infoData.attention != "1";
                  this.widget.infoData.user.id.isFollow(
                      isFollow,
                      onSuccess: (response){
                        this.setState(() {
                          this.widget.infoData.attention = isFollow ? "1" : "2";
                        });
                      }
                  );
                },
              )
          )
        ],
      ),
    );
  }
}