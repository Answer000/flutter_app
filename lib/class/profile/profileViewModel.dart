import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/collection/myCollections.dart';
import 'package:flutter_app/class/profile/coupon/myCoupons.dart';
import 'package:flutter_app/class/profile/diary/MyDiary.dart';
import 'package:flutter_app/class/profile/fans/fans.dart';
import 'package:flutter_app/class/profile/feekback/MyFeedback.dart';
import 'package:flutter_app/class/profile/follows/follows.dart';
import 'package:flutter_app/class/profile/integral/myIntegral.dart';
import 'package:flutter_app/class/profile/likes/likes.dart';
import 'package:flutter_app/class/profile/myPosts/myPosts.dart';
import 'package:flutter_app/class/profile/orders/my_orders.dart';
import 'package:flutter_app/class/profile/signIn/signIn.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/resource.dart';
import 'package:flutter_app/class/profile/profile_info_entity.dart';

class ProfileViewModel {

  ProfileInfoData info;

  List<Map<String,dynamic>> numberDataSource() {
    List<Map<String,dynamic>> source = [
      {
        'name' : '粉丝',
        'count' : this.info != null ? '${this.info.user.fansNum}' : '0',
        'page' : Fans(),
      },
      {
        'name' : '关注',
        'count' : this.info != null ? '${this.info.user.attentionNum}' : '0',
        'page' : Follows(),
      },
      {
        'name' : '获赞',
        'count' : this.info != null ? '${this.info.user.praiseNums}' : '0',
        'page' : Likes(),
      },
    ];
    return source;
  }

  List<Map<String,dynamic>> itemsDataSource = [
    {
      'title' : '订单',
      'iconName' : ImageName.cjm_profile_order.imagePath,
      'iconSize' : Size(25.dp,30.dp),
      'page' : MyOrders(),
    },
    {
      'title' : '优惠券',
      'iconName' : ImageName.cjm_profile_coupon.imagePath,
      'iconSize' : Size(30.dp,23.dp),
      'page' : MyCoupons(),
    },
    {
      'title' : '意见反馈',
      'iconName' : ImageName.cjm_profile_feedBack.imagePath,
      'iconSize' : Size(25.dp,25.dp),
      'page' : MyFeedback(),
    },
    {
      'title' : '收藏',
      'iconName' : ImageName.cjm_profile_collect.imagePath,
      'iconSize' : Size(25.dp,30.dp),
      'page' : MyCollections(),
    },
  ];

  List<ProfileCellEntity> getCellContentViewSource() {
    List<Map<String,dynamic>> sourceMap = [
      {
        'title_zh' : '我的积分',
        'title_en' : 'Reward Points',
        'iconName' : ImageName.cjm_profile_integral.imagePath,
        'iconSize' : Size(25.dp,25.dp),
        'iconLeftMargin' : 21.dp,
        'lineColor' : Color(0xffDA3F47),
        'lineWidth' : 45.dp,
        'detailText' : this.info != null ? '${this.info.user.integral}' : '0',
        'detailTextStyle' : TextStyle(color: Color(0xffDA3F47), fontSize: 12.dpFontSize, fontWeight: FontWeight.bold),
        'page' : MyIntegral(),
      },
      {
        'title_zh' : '签到',
        'title_en' : 'Sign In',
        'iconName' : ImageName.cjm_profile_sign.imagePath,
        'iconSize' : Size(25.dp,25.dp),
        'iconLeftMargin' : 21.dp,
        'lineColor' : Color(0xff6683C6),
        'lineWidth' : 20.dp,
        'detailText' : 'DAY ${this.info != null ? this.info.user.fansNum : '0'}',
        'detailTextStyle' : TextStyle(color: Color(0xffffffff), fontSize: 12.dpFontSize, fontWeight: FontWeight.bold),
        'page' : SignIn(),
      },
      {
        'title_zh' : '帖子',
        'title_en' : 'Posting',
        'iconName' : ImageName.cjm_profile_post.imagePath,
        'iconSize' : Size(25.dp,25.dp),
        'iconLeftMargin' : 21.dp,
        'lineColor' : Color(0xffFFC45C),
        'lineWidth' : 20.dp,
        'detailText' : this.info != null ? '${this.info.user.postNum}' : '0',
        'detailTextStyle' : TextStyle(color: Color(0xffffffff), fontSize: 12.dpFontSize, fontWeight: FontWeight.bold),
        'page' : MyPosts(),
      },
      {
        'title_zh' : '美丽日记',
        'title_en' : 'beautiful diary',
        'iconName' : ImageName.cjm_profile_diary.imagePath,
        'iconSize' : Size(18.dp,25.dp),
        'iconLeftMargin' : 25.dp,
        'lineColor' : Color(0xffAACCCB),
        'lineWidth' : 45.dp,
        'page' : MyDiary(),
      },
    ];
    // return source;
    List<ProfileCellEntity> source = [];
    for(var i= 0; i<sourceMap.length; i++) {
      ProfileCellEntity entity = ProfileCellEntity.init(sourceMap[i]);
      source.add(entity);
    }
    return source;
  }

  getUserInfo(Function(ProfileInfoData) callback) async{
    await Https().post(
        apiPath: APIPath.user_getUserDetail,
        params: {'userId' : '${LoginUserInfoManager().userId}'},
        onSuccess: (response){
          ProfileInfoEntity entity = ProfileInfoEntity().fromJson(response);
          this.info = entity.data;
          LoginUserInfoManager().integral = entity.data.user.integral;
          callback(entity.data);
        },
        onFailure: (error){ }
    );
  }
}

class ProfileCellEntity {
  String titleZH;
  String titleEN;
  String iconName;
  Size iconSize;
  double iconLeftMargin;
  Color lineColor;
  double lineWidth;
  String detailText;
  TextStyle detailTextStyle;
  Widget page;

  static ProfileCellEntity init(Map<String,dynamic> map) {
    ProfileCellEntity entity = ProfileCellEntity();
    entity.titleZH = map['title_zh'].toString();
    entity.titleEN = map['title_en'].toString();
    entity.iconName = map['iconName'].toString();
    entity.detailText = map['detailText'];
    entity.detailTextStyle = map['detailTextStyle'];
    entity.lineColor = map['lineColor'];
    entity.iconSize = map['iconSize'];
    entity.iconLeftMargin = map['iconLeftMargin'];
    entity.lineWidth = map['lineWidth'];

    entity.page = map['page'];
    return entity;
  }
}