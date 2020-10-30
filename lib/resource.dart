import 'package:flutter/material.dart';

extension String_extension on String {
  Image get localImage =>
      Image(image: AssetImage(this), fit: BoxFit.cover,);
}

extension ResourceExtension on ImageName {
  String get imagePath => 'resource/${this.toString().split('.').last}@3x.png';
  Image get assetImage => this.imagePath.localImage;
}

enum ImageName {
  placeholder,
  cjm_navigationBar_backIcon_white,
  cjm_navigationBar_logo,
  cjm_navigationBar_left_background,

  cjm_tabbarIcon_fashionNormal,
  cjm_tabbarIcon_fashionSelected,
  cjm_tabbarIcon_homeNormal,
  cjm_tabbarIcon_homeSelected,
  cjm_tabbarIcon_nearbyNormal,
  cjm_tabbarIcon_nearbySelected,
  cjm_tabbarIcon_profileNormal,
  cjm_tabbarIcon_profileSelected,
  cjm_tabbarIcon_publish,

  cjm_login_background,
  cjm_login_logo,
  cjm_login_phone,
  cjm_login_password,
  cjm_login_wechat,
  cjm_login_agree,
  cjm_login_disagree,

  cjm_profile_setting,
  cjm_profile_more,
  cjm_profile_collect,
  cjm_profile_coupon,
  cjm_profile_diary,
  cjm_profile_feedBack,
  cjm_profile_integral,
  cjm_profile_order,
  cjm_profile_post,
  cjm_profile_sign,
}