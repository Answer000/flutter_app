import 'package:flutter/material.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class ProfileViewModel {

  List<Map<String,dynamic>> getNumberContentViewSource() {
    List<Map<String,dynamic>> source = [
      {'name' : '粉丝', 'count' : '260'},
      {'name' : '关注', 'count' : '38'},
      {'name' : '获赞', 'count' : '42'},
    ];
    return source;
  }

  List<Map<String,dynamic>> getItemsContentViewSource() {
    List<Map<String,dynamic>> source = [
      {'title' : '订单', 'iconName' : ImageName.cjm_profile_order.imagePath, 'iconSize' : Size(25.dp,30.dp)},
      {'title' : '优惠券', 'iconName' : ImageName.cjm_profile_coupon.imagePath, 'iconSize' : Size(30.dp,23.dp)},
      {'title' : '意见反馈', 'iconName' : ImageName.cjm_profile_feedBack.imagePath, 'iconSize' : Size(25.dp,25.dp)},
      {'title' : '收藏', 'iconName' : ImageName.cjm_profile_collect.imagePath, 'iconSize' : Size(25.dp,30.dp)},
    ];
    return source;
  }

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
        'detailText' : '999',
        'detailTextStyle' : TextStyle(color: Color(0xffDA3F47), fontSize: 12.dpFontSize, fontWeight: FontWeight.bold),
      },
      {
        'title_zh' : '签到',
        'title_en' : 'Sign In',
        'iconName' : ImageName.cjm_profile_sign.imagePath,
        'iconSize' : Size(25.dp,25.dp),
        'iconLeftMargin' : 21.dp,
        'lineColor' : Color(0xff6683C6),
        'lineWidth' : 20.dp,
        'detailText' : 'DAY 1',
        'detailTextStyle' : TextStyle(color: Color(0xffffffff), fontSize: 12.dpFontSize, fontWeight: FontWeight.bold),
      },
      {
        'title_zh' : '帖子',
        'title_en' : 'Posting',
        'iconName' : ImageName.cjm_profile_post.imagePath,
        'iconSize' : Size(25.dp,25.dp),
        'iconLeftMargin' : 21.dp,
        'lineColor' : Color(0xffFFC45C),
        'lineWidth' : 20.dp,
        'detailText' : '999',
        'detailTextStyle' : TextStyle(color: Color(0xffffffff), fontSize: 12.dpFontSize, fontWeight: FontWeight.bold),
      },
      {
        'title_zh' : '美丽日记',
        'title_en' : 'beautiful diary',
        'iconName' : ImageName.cjm_profile_diary.imagePath,
        'iconSize' : Size(18.dp,25.dp),
        'iconLeftMargin' : 25.dp,
        'lineColor' : Color(0xffAACCCB),
        'lineWidth' : 45.dp,
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

    return entity;
  }
}