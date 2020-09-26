import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Screen on ScreenUtil {
  /// 状态栏高度
  static double get statusBarHeight => ScreenUtil().statusBarHeight;
  /// 底部安全距离
  static double get bottomBarHeight => ScreenUtil().bottomBarHeight;
  /// 屏幕宽度
  static double get width => ScreenUtil().screenWidth;
  /// 屏幕高度
  static double get height => ScreenUtil().screenHeight;
}

/// int extension
extension int_extension on int {
  double get dp => ScreenUtil().pixelRatio * ScreenUtil().setWidth(this.toDouble());
  double get dpFontSize => ScreenUtil().setSp(this) * ScreenUtil().pixelRatio;
}

/// double extension
extension double_extension on double {
  double get dp => ScreenUtil().pixelRatio * ScreenUtil().setWidth(this.toDouble());
  double get dpFontSize => ScreenUtil().setSp(this) * ScreenUtil().pixelRatio;
}

/// string extension
extension String_extension on String {
  bool get isValid => (this != null && (this.length ?? 0 != 0));
  bool get isNotValid => !isValid;
}

/// List extension
extension List_extension on List {
  bool get isValid => (this != null && (this.length ?? 0 != 0));
  bool get isNotValid => !isValid;
}

/// Map extension
extension Map_extension on Map {
  bool get isValid => (this != null && (this.length ?? 0 != 0));
  bool get isNotValid => !isValid;
}

extension CustomAssetImage on Image {
   static Image image({String image, BoxFit fit = BoxFit.cover}) {
    return Image(
      image: AssetImage(image),
      fit: fit,
    );
  }
}